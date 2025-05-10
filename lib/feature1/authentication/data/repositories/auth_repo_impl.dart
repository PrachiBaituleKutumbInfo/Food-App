import 'package:dartz/dartz.dart';
import 'package:konkan_bite_food/core1/errors/exceptions.dart';
import 'package:konkan_bite_food/core1/errors/failures.dart';
import 'package:konkan_bite_food/core1/utils/typedef.dart';
import 'package:konkan_bite_food/feature1/authentication/data/datasources/auth_remote_data_source.dart';
import 'package:konkan_bite_food/feature1/authentication/domain/entities/login_entity.dart';
import 'package:konkan_bite_food/feature1/authentication/domain/entities/verify_otp_entity.dart';
import 'package:konkan_bite_food/feature1/authentication/domain/repositories/auth_repository.dart';

class AuthRepoImpl implements AuthenticationRepository {
  const AuthRepoImpl(
    this._remoteDataSource,
  );

  final AuthRemoteDataSrc _remoteDataSource;

  @override
  ResultFuture<OtpResponseEntity> loginWithOtp({
    required String mobNo,
  }) async {
    try {
      final result = await _remoteDataSource.loginWithOtp(mobNo: mobNo);
      return Right(result);
    } on APIException catch (e) {
      return Left(
        ApiFailure.fromException(e),
      );
    } catch (e) {
      return Left(Failure(message: 'Unexpected error: $e', statusCode: 0));
    }
  }

  @override
  ResultFuture<VerifyOtpEntity> verifyOtp(
      {required String otp, required String mobileNumber}) async {
    try {
      final result = await _remoteDataSource.verifyOtp(
        otp: otp,
        mobileNumber: mobileNumber,
      );
      return Right(result);
    } on APIException catch (e) {
      return Left(
        ApiFailure.fromException(e),
      );
    } catch (e) {
      return Left(Failure(message: 'Unexpected error: $e', statusCode: 0));
    }
  }
}
