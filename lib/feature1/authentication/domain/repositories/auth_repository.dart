import 'package:konkan_bite_food/core1/utils/typedef.dart';
import 'package:konkan_bite_food/feature1/authentication/domain/entities/login_entity.dart';
import 'package:konkan_bite_food/feature1/authentication/domain/entities/verify_otp_entity.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();
  ResultFuture<OtpResponseEntity> loginWithOtp({
    required String mobNo,
  });

  ResultFuture<VerifyOtpEntity> verifyOtp({
    required String otp,
    required String mobileNumber,
  });
}
