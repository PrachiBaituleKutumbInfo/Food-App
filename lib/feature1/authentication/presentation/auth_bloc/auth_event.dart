part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

/// Event to check if the user is authenticated.
final class AuthCheckEvent extends AuthEvent {}

/// Event to log in the user.
final class AuthLoginEvent extends AuthEvent {
  final String username;
  final String password;

  AuthLoginEvent(this.username, this.password);
}

/// Event to log out the user.
final class AuthLogoutEvent extends AuthEvent {}

/// Event to handle authentication failure.
final class AuthFailureEvent extends AuthEvent {
  final String errorMessage;

  AuthFailureEvent(this.errorMessage);
}

/// Event to log in with OTP.
final class LoginWithOtpEvent extends AuthEvent {
  final String mobileNumber;

  LoginWithOtpEvent(this.mobileNumber);
}

final class VerifyOtpEvent extends AuthEvent {
  final String otp;

  VerifyOtpEvent(this.otp);
}
