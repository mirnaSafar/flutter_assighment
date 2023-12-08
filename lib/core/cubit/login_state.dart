part of 'login_cubit.dart';

@immutable
class LoginState {}

class LoginInitial extends LoginState {}

class UserLoggedIn extends LoginState {}

class UserLoggingFailed extends LoginState {}

class UserLoggingProgress extends LoginState {}
