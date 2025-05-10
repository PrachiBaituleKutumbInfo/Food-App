import 'package:equatable/equatable.dart';

/// Domain entity representing the result of OTP verification.
class VerifyOtpEntity extends Equatable {
  final String responseStatus;
  final String responseCode;
  final String responseMessage;
  final String token;

  const VerifyOtpEntity({
    required this.responseStatus,
    required this.responseCode,
    required this.responseMessage,
    required this.token,
  });

  @override
  List<Object> get props => [
        responseStatus,
        responseCode,
        responseMessage,
        token,
      ];

  @override
  String toString() {
    return 'VerifyOtpEntity(responseStatus: $responseStatus, responseCode: $responseCode, responseMessage: $responseMessage, token: $token)';
  }
}
