part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterRegistering extends RegisterState {}

class RegisterFailed extends RegisterState {}

class RegisterSuccess extends RegisterState {}
