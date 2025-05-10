// lib/core/config/config.dart
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConfig {
  static Future<void> init(String env) async {
    // Load the appropriate .env file based on the environment
    await dotenv.load(fileName: '.env.$env');
  }

  // API Configuration
  static String get baseUrl => dotenv.env['BASE_URL']!;
  static int get connectTimeout => int.parse(dotenv.env['CONNECT_TIMEOUT']!);
  static int get receiveTimeout => int.parse(dotenv.env['RECEIVE_TIMEOUT']!);

  // App Configuration
  static String get appName => dotenv.env['APP_NAME']!;
}
