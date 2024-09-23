part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class LoginLoading extends AuthState {}

class LoginSucsess extends AuthState {}

class LoginFailure extends AuthState {
  final String message;
  LoginFailure({required this.message});
}

// register states

class RegisterLoading extends AuthState {}

class RegisterSucesess extends AuthState {}

class RegisterFailure extends AuthState {
  final String message;
  RegisterFailure({required this.message});
}
