import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Enum to define all possible storage keys
enum StorageKey {
  authToken,
  userProfile,
  isLoggedIn,
}

/// Secure Storage Service
class SecureStorageService {
  // Singleton instance
  static final SecureStorageService _instance =
      SecureStorageService._internal();
  factory SecureStorageService() => _instance;

  // Internal constructor
  SecureStorageService._internal();

  // Secure storage instance
  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  /// Write a string value
  Future<void> write(StorageKey key, String value) async {
    try {
      await _secureStorage.write(key: key.name, value: value);
    } catch (e) {
      debugPrint('Error writing to secure storage: $e');
    }
  }

  /// Read a string value
  Future<String?> read(StorageKey key) async {
    try {
      return await _secureStorage.read(key: key.name);
    } catch (e) {
      debugPrint('Error reading from secure storage: $e');
      return null;
    }
  }

  /// Write a JSON object
  Future<void> writeJson(StorageKey key, Map<String, dynamic> value) async {
    try {
      String jsonValue = json.encode(value);
      await _secureStorage.write(key: key.name, value: jsonValue);
    } catch (e) {
      debugPrint('Error writing JSON to secure storage: $e');
    }
  }

  /// Read a JSON object
  Future<Map<String, dynamic>?> readJson(StorageKey key) async {
    try {
      String? jsonString = await _secureStorage.read(key: key.name);
      return jsonString != null
          ? json.decode(jsonString) as Map<String, dynamic>
          : null;
    } catch (e) {
      debugPrint('Error reading JSON from secure storage: $e');
      return null;
    }
  }

  /// Delete a value
  Future<void> delete(StorageKey key) async {
    try {
      await _secureStorage.delete(key: key.name);
    } catch (e) {
      debugPrint('Error deleting from secure storage: $e');
    }
  }

  /// Clear all stored values
  Future<void> clear() async {
    try {
      await _secureStorage.deleteAll();
    } catch (e) {
      debugPrint('Error clearing secure storage: $e');
    }
  }

  /// Check if a key exists
  Future<bool> containsKey(StorageKey key) async {
    try {
      String? value = await _secureStorage.read(key: key.name);
      return value != null;
    } catch (e) {
      debugPrint('Error checking key in secure storage: $e');
      return false;
    }
  }
}
