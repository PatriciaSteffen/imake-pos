import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imake/tasks/data/repository/login_repository.dart';
import 'package:imake/tasks/presentation/bloc/login_event.dart';
import 'package:imake/tasks/presentation/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;

  LoginBloc(this.loginRepository) : super(CheckLoginSuccess()) {
    on<CheckLogiEvent>(_checkLogin);
  }

  _checkLogin(CheckLogiEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      if (event.loginModel.email.trim().isEmpty) {
        return emit(CheckLoginFailure(error: 'E-mail é um campo obrigatório'));
      }
      if (event.loginModel.password.trim().isEmpty) {
        return emit(CheckLoginFailure(error: 'Senha é um campo obrigatório'));
      }
      await loginRepository.checkLogin();
      return emit(CheckLoginSuccess());
    } catch (exception) {
      emit(CheckLoginFailure(error: exception.toString()));
    }
  }
}
