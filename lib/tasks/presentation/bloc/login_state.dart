import 'package:flutter/foundation.dart';

@immutable
sealed class LoginState {}

final class CheckLoginSuccess extends LoginState {}

final class LoginLoading extends LoginState {}

final class CheckLoginFailure extends LoginState {
  final String error;

  CheckLoginFailure({required this.error});
}
