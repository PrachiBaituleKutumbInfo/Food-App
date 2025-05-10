/// Defines relative API endpoint paths for the application.
///
/// These paths are concatenated with [AppConfig.baseUrl] in [HttpService]
/// to form complete URLs for API requests.
class ApiEndpoints {
  ApiEndpoints._(); // Private constructor to prevent instantiation

  static const String getLoginOtp = '/auth/send-otp?mobileNumber=';
  static const String verifyOtp =
      '/auth/verify-otp?mobileNumber='; // OTP verification endpoint /auth/verify-otp?mobileNumber=1234567890&otp=355189
}
