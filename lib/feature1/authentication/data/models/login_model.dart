import 'package:konkan_bite_food/feature1/authentication/domain/entities/login_entity.dart';

class OtpResponseModel extends OtpResponseEntity {
  const OtpResponseModel({
    required super.responseStatus,
    required super.responseCode,
    required super.responseMessage,
    required super.responseData,
  });

  factory OtpResponseModel.fromJson(Map<String, dynamic> json) {
    return OtpResponseModel(
      responseStatus: json['responseStatus'] as String,
      responseCode: json['responseCode'] as String,
      responseMessage: json['responseMessage'] as String,
      responseData: List<String>.from(json['responseData']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'responseStatus': responseStatus,
      'responseCode': responseCode,
      'responseMessage': responseMessage,
      'responseData': responseData,
    };
  }

  OtpResponseModel copyWith({
    String? responseStatus,
    String? responseCode,
    String? responseMessage,
    List<String>? responseData,
  }) {
    return OtpResponseModel(
      responseStatus: responseStatus ?? this.responseStatus,
      responseCode: responseCode ?? this.responseCode,
      responseMessage: responseMessage ?? this.responseMessage,
      responseData: responseData ?? this.responseData,
    );
  }
}

/*


{
    "responseStatus": "SUCCESS",
    "responseCode": "200",
    "responseMessage": "OTP Send Succcessfully",
    "responseData": [
        "666636"
    ]
}   


 */
