part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

/// Initial state when the authentication process has not started.
final class AuthInitial extends AuthState {}

/// State when authentication is in progress.
final class AuthLoading extends AuthState {}

/// State when authentication is successful.
final class AuthAuthenticated extends AuthState {
  AuthAuthenticated();
}

/// State when authentication fails.
final class AuthFailure extends AuthState {
  final String errorMessage;

  AuthFailure(this.errorMessage);
}

/// State when the user is logged out.
final class AuthLoggedOut extends AuthState {}

final class AuthOtpReceivedSuccessState extends AuthState {
  AuthOtpReceivedSuccessState();
}

final class AuthOtpReceivedFailureState extends AuthState {
  final String errorMessage;

  AuthOtpReceivedFailureState(this.errorMessage);
}

final class AuthOtpVerificationSuccessState extends AuthState {
  AuthOtpVerificationSuccessState();
}
