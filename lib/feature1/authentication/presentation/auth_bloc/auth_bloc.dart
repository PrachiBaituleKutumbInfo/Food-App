import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:konkan_bite_food/core1/services/secure_storage_service.dart';
import 'package:konkan_bite_food/feature1/authentication/domain/repositories/auth_repository.dart';
import 'package:konkan_bite_food/feature1/authentication/domain/usecases/verify_otp_usecase.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SecureStorageService secureStorage;
  final AuthenticationRepository repository;
  final VerifyOtpUsecase verifyOtpUsecase;

  AuthBloc({
    required this.secureStorage,
    required this.repository,
    required this.verifyOtpUsecase,
  }) : super(AuthInitial()) {
    on<AuthCheckEvent>(_onAuthCheck);
    on<LoginWithOtpEvent>(_onLoginWithOtp);
    on<VerifyOtpEvent>(_onVerifyOtp);
  }

  Future<void> _onAuthCheck(
      AuthCheckEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final isLoggedIn = await secureStorage.read(StorageKey.isLoggedIn);
      if (isLoggedIn == 'false') {
        // Optionally validate token or fetch user data via repository
        emit(AuthAuthenticated());
      } else {
        emit(AuthFailure('Not logged in'));
      }
    } catch (e) {
      emit(AuthFailure('Error checking auth status: $e'));
    }
  }

  Future<void> _onLoginWithOtp(
      LoginWithOtpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final result = await repository.loginWithOtp(mobNo: event.mobileNumber);
      await result.fold(
        (failure) async => emit(AuthOtpReceivedFailureState(failure.message)),
        (response) async {
          // emit(AuthAuthenticated(response: response));

          emit(AuthOtpReceivedSuccessState());
        },
      );
    } catch (e) {
      emit(AuthFailure('Login error: $e'));
    }
  }

  FutureOr<void> _onVerifyOtp(
      VerifyOtpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final result = await verifyOtpUsecase(VerifyOtpParams(
        otp: event.otp,
        mobileNumber: '1234567890', // Replace with actual mobile number
      ));
      await result.fold(
        (failure) async => emit(AuthOtpReceivedFailureState(failure.message)),
        (response) async {
          await secureStorage.write(StorageKey.isLoggedIn, 'true');
          await secureStorage.write(StorageKey.authToken, response.token);
          emit(AuthOtpVerificationSuccessState());
        },
      );
    } on TimeoutException {
      emit(AuthFailure('Request timed out. Please check your network.'));
    } catch (e) {
      emit(AuthFailure('OTP verification error: $e'));
    }
  }
}
