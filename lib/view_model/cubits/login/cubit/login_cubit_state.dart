part of 'login_cubit_cubit.dart';

@immutable
abstract class LoginCubitState {}

class LoginCubitInitial extends LoginCubitState {}

class LoginCubitLoginSuccess extends LoginCubitState {}

class LoginCubitLoginProgress extends LoginCubitState {}

class LoginCubitLoginFailed extends LoginCubitState {}

class LoginCubitLoginError extends LoginCubitState {}
