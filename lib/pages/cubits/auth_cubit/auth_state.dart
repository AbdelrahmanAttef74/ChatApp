part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class RegistLoading extends AuthState {}

class RegisterSuccess extends AuthState {}

class RegisterFailure extends AuthState {
  final String errorMessage;
  RegisterFailure({required this.errorMessage});
}

class LoginSuccess extends AuthState {}

class LoginLoading extends AuthState {}

class LoginFailure extends AuthState {
  final String errorMessage;
  LoginFailure({required this.errorMessage});
}
