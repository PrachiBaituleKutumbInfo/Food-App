import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart' as http_io;
import 'package:konkan_bite_food/config/environment.dart';
import 'package:konkan_bite_food/core1/services/secure_storage_service.dart';
import 'package:logger/logger.dart';

// Custom HttpException class for error handling
class HttpException implements Exception {
  final String message;

  HttpException(this.message);

  @override
  String toString() => 'HttpException: $message';
}

class HttpService {
  final String baseUrl;
  final http.Client client;
  final SecureStorageService secureStorageService;
  final Logger logger;
  final bool bypassSslVerification; // For development only

  HttpService({
    required this.baseUrl,
    http.Client? client,
    SecureStorageService? secureStorageService,
    Logger? logger,
    this.bypassSslVerification = false, // Default to false for production
  })  : client = client ?? _createClient(bypassSslVerification),
        secureStorageService = secureStorageService ?? SecureStorageService(),
        logger = logger ?? Logger() {
    logger?.d('HttpService initialized with baseUrl: $baseUrl, '
        'connectTimeout: ${AppConfig.connectTimeout}ms, '
        'receiveTimeout: ${AppConfig.receiveTimeout}ms');
  }

  // Create http.Client with optional SSL bypass
  static http.Client _createClient(bool bypassSslVerification) {
    if (bypassSslVerification) {
      final httpClient = HttpClient()
        ..badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      return http_io.IOClient(httpClient);
    }
    return http.Client();
  }

  // Generic GET request
  Future<T> get<T>(
    String endpoint, {
    Map<String, String>? headers,
    T Function(dynamic)? parser,
    bool isPublic = false, // Flag for public endpoints
  }) async {
    try {
      final uri = Uri.parse('$baseUrl$endpoint');
      final requestHeaders = await _buildHeaders(headers, isPublic);
      logger.d('GET $uri with headers: ${requestHeaders.keys}');
      final response = await client
          .get(uri, headers: requestHeaders)
          .timeout(Duration(milliseconds: AppConfig.connectTimeout));
      logger.d('Response: ${response.statusCode}');
      return _handleResponse(response, parser);
    } catch (e) {
      logger.e('Error during GET $endpoint: $e');
      throw HttpException(_parseError(e, endpoint));
    }
  }

  // Generic POST request
  Future<T> post<T>(
    String endpoint, {
    Map<String, String>? headers,
    dynamic body,
    T Function(dynamic)? parser,
    bool isPublic = false, // Flag for public endpoints
  }) async {
    try {
      final uri = Uri.parse('$baseUrl$endpoint');
      final requestHeaders = await _buildHeaders(headers, isPublic);
      logger.d('POST $uri with body: $body, headers: ${requestHeaders.keys}');
      final response = await client
          .post(
            uri,
            headers: {
              'Content-Type': 'application/json',
              ...requestHeaders,
            },
            body: body != null ? jsonEncode(body) : null,
          )
          .timeout(Duration(milliseconds: AppConfig.receiveTimeout));
      logger.d('Response: ${response.statusCode}');
      return _handleResponse(response, parser);
    } catch (e) {
      logger.e('Error during POST $endpoint: $e');
      throw HttpException(_parseError(e, endpoint));
    }
  }

  // Generic PUT request
  Future<T> put<T>(
    String endpoint, {
    Map<String, String>? headers,
    dynamic body,
    T Function(dynamic)? parser,
    bool isPublic = false, // Flag for public endpoints
  }) async {
    try {
      final uri = Uri.parse('$baseUrl$endpoint');
      final requestHeaders = await _buildHeaders(headers, isPublic);
      logger.d('PUT $uri with body: $body, headers: ${requestHeaders.keys}');
      final response = await client
          .put(
            uri,
            headers: {
              'Content-Type': 'application/json',
              ...requestHeaders,
            },
            body: body != null ? jsonEncode(body) : null,
          )
          .timeout(Duration(milliseconds: AppConfig.receiveTimeout));
      logger.d('Response: ${response.statusCode}');
      return _handleResponse(response, parser);
    } catch (e) {
      logger.e('Error during PUT $endpoint: $e');
      throw HttpException(_parseError(e, endpoint));
    }
  }

  // Generic DELETE request
  Future<T> delete<T>(
    String endpoint, {
    Map<String, String>? headers,
    T Function(dynamic)? parser,
    bool isPublic = false, // Flag for public endpoints
  }) async {
    try {
      final uri = Uri.parse('$baseUrl$endpoint');
      final requestHeaders = await _buildHeaders(headers, isPublic);
      logger.d('DELETE $uri with headers: ${requestHeaders.keys}');
      final response = await client
          .delete(uri, headers: requestHeaders)
          .timeout(Duration(milliseconds: AppConfig.connectTimeout));
      logger.d('Response: ${response.statusCode}');
      return _handleResponse(response, parser);
    } catch (e) {
      logger.e('Error during DELETE $endpoint: $e');
      throw HttpException(_parseError(e, endpoint));
    }
  }

  // Build headers with optional auth token
  Future<Map<String, String>> _buildHeaders(
      Map<String, String>? customHeaders, bool isPublic) async {
    final headers = <String, String>{};

    // Skip token check for public endpoints
    if (!isPublic) {
      try {
        final token = await secureStorageService.read(StorageKey.authToken);
        if (token != null && token.isNotEmpty) {
          headers['Authorization'] = 'Bearer $token';
          logger.d(
              'Auth token added to headers using key: ${StorageKey.authToken.name}');
        } else {
          logger.d(
              'No auth token found in secure storage for key: ${StorageKey.authToken.name}');
        }
      } catch (e) {
        logger.e('Error reading auth token: $e');
      }
    } else {
      logger.d('Public endpoint, skipping auth token check');
    }

    // Merge custom headers (custom headers take precedence)
    headers.addAll(customHeaders ?? {});
    return headers;
  }

  // Handle HTTP response
  T _handleResponse<T>(http.Response response, T Function(dynamic)? parser) {
    final statusCode = response.statusCode;
    final headers = response.headers;
    final body = response.body;

    // Log response details using logger
    logger.d('HTTP Response:');
    logger.d('  Status Code: $statusCode');
    logger.d('  Headers: ${headers.toString()}');
    logger.d('  Body: $body');

    if (statusCode >= 200 && statusCode < 300) {
      if (parser != null) {
        final decoded = jsonDecode(response.body);
        return parser(decoded);
      }
      return response.body as T;
    } else {
      throw HttpException(_parseErrorFromStatus(statusCode, body));
    }
  }

  // Parse errors from status code and response body
  String _parseErrorFromStatus(int statusCode, String body) {
    final errorMessage = switch (statusCode) {
      400 => 'Bad request: $body',
      401 => 'Unauthorized: $body',
      403 => 'Forbidden: $body',
      404 => 'Not found: $body',
      500 => 'Server error: $body',
      _ => 'HTTP error: $statusCode - $body',
    };

    // Log error details using logger
    logger.e('HTTP Error:');
    logger.e('  Status Code: $statusCode');
    logger.e('  Error Message: $errorMessage');

    return errorMessage;
  }

  // Parse general errors
  String _parseError(dynamic error, String endpoint) {
    final errorMessage = error is http.ClientException
        ? 'Network error: ${error.message}'
        : error is SocketException
            ? 'Network error: Failed to connect to server'
            : error is HttpException
                ? error.message
                : error is TimeoutException
                    ? 'Request timed out'
                    : 'Unexpected error: ${error.toString()}';

    // Log error details using logger
    logger.e('HTTP Request Error:');
    logger.e('  Endpoint: $endpoint');
    logger.e('  Error: $errorMessage');

    return errorMessage;
  }

  // Clean up client resources
  void dispose() {
    client.close();
    logger.d('HttpService disposed');
  }
}
