import 'package:konkan_bite_food/feature1/authentication/domain/entities/verify_otp_entity.dart';

class VerifyOtpModel extends VerifyOtpEntity {
  VerifyOtpModel({
    required String responseStatus,
    required String responseCode,
    required String responseMessage,
    required String token,
  }) : super(
          responseStatus: responseStatus,
          responseCode: responseCode,
          responseMessage: responseMessage,
          token: token,
        );

  factory VerifyOtpModel.fromJson(Map<String, dynamic> json) {
    final responseData = json['responseData'] as List<dynamic>;
    final token = responseData.isNotEmpty ? responseData[0] as String : '';
    return VerifyOtpModel(
      responseStatus: json['responseStatus'] as String,
      responseCode: json['responseCode'] as String,
      responseMessage: json['responseMessage'] as String,
      token: token,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'responseStatus': responseStatus,
      'responseCode': responseCode,
      'responseMessage': responseMessage,
      'responseData': [token],
    };
  }
}
