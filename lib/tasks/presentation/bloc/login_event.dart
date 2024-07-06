import 'package:flutter/foundation.dart';
import 'package:imake/tasks/data/local/model/login_model.dart';

@immutable
sealed class LoginEvent {}

class CheckLogiEvent extends LoginEvent {
  final LoginModel loginModel;

  CheckLogiEvent({required this.loginModel});
}
