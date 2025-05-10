import 'package:konkan_bite_food/core1/use_cases/usecase.dart';
import 'package:konkan_bite_food/core1/utils/typedef.dart';
import 'package:konkan_bite_food/feature1/authentication/domain/entities/login_entity.dart';

import '../repositories/auth_repository.dart';

class LoginWithOtpUsecase extends UsecaseWithParams<OtpResponseEntity, String> {
  final AuthenticationRepository _repository;

  LoginWithOtpUsecase(this._repository);

  @override
  ResultFuture<OtpResponseEntity> call(params) async =>
      _repository.loginWithOtp(mobNo: params);
}

//if there is primary data type like string, int, double, bool, etc. then we directly pass params in case of multiple params we will ue like below

// class LoginWithOtpParams {
//   final String mobNo;

//   const LoginWithOtpParams({required this.mobNo});
// }
