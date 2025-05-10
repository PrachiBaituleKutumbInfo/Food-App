import 'package:konkan_bite_food/core1/errors/exceptions.dart';
import 'package:konkan_bite_food/core1/resources/api_endponts.dart';
import 'package:konkan_bite_food/core1/services/api_services.dart';
import 'package:konkan_bite_food/feature1/authentication/data/models/login_model.dart';
import 'package:konkan_bite_food/feature1/authentication/data/models/verify_otp_model.dart';

abstract class AuthRemoteDataSrc {
  Future<OtpResponseModel> loginWithOtp({required String mobNo});
  Future<VerifyOtpModel> verifyOtp(
      {required String otp, required String mobileNumber});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSrc {
  const AuthRemoteDataSourceImpl(this._httpService);

  final HttpService _httpService;

  @override
  Future<OtpResponseModel> loginWithOtp({required String mobNo}) async {
    try {
      final endpoint = '${ApiEndpoints.getLoginOtp}$mobNo';
      final response = await _httpService.get(
        endpoint,
        parser: (data) => OtpResponseModel.fromJson(data),
        isPublic: true, // Mark as public endpoint
      );
      return response;
    } on HttpException catch (e) {
      throw APIException(
        message: e.message,
        statusCode: _extractStatusCode(e.message),
      );
    } catch (e) {
      throw APIException(message: 'Unexpected error: $e', statusCode: 500);
    }
  }

  int _extractStatusCode(String message) {
    final match = RegExp(r'(\d{3})').firstMatch(message);
    return match != null ? int.parse(match.group(0)!) : 500;
  }

  @override
  Future<VerifyOtpModel> verifyOtp(
      {required String otp, required String mobileNumber}) async {
    try {
      final endpoint = '${ApiEndpoints.verifyOtp}$mobileNumber&otp=$otp';

      final response = await _httpService.get(
        endpoint,
        parser: (data) => VerifyOtpModel.fromJson(data),
        isPublic: true, // Mark as public endpoint
      );
      return response;
    } on HttpException catch (e) {
      throw APIException(
        message: e.message,
        statusCode: _extractStatusCode(e.message),
      );
    } catch (e) {
      throw APIException(message: 'Unexpected error: $e', statusCode: 500);
    }
  }
}
