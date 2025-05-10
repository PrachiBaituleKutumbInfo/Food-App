import 'package:konkan_bite_food/core1/use_cases/usecase.dart';
import 'package:konkan_bite_food/core1/utils/typedef.dart';
import 'package:konkan_bite_food/feature1/authentication/domain/entities/verify_otp_entity.dart';
import 'package:konkan_bite_food/feature1/authentication/domain/repositories/auth_repository.dart';

class VerifyOtpParams {
  final String otp;
  final String mobileNumber;

  const VerifyOtpParams({
    required this.otp,
    required this.mobileNumber,
  });
}

class VerifyOtpUsecase
    extends UsecaseWithParams<VerifyOtpEntity, VerifyOtpParams> {
  final AuthenticationRepository _repository;

  VerifyOtpUsecase(this._repository);

  @override
  ResultFuture<VerifyOtpEntity> call(VerifyOtpParams params) async =>
      _repository.verifyOtp(
        otp: params.otp,
        mobileNumber: params.mobileNumber,
      );
}
