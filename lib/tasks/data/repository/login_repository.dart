import 'package:imake/tasks/data/local/data_sources/login_data_provider.dart';

class LoginRepository {
  final LoginDataProvider loginDataProvider;

  LoginRepository({required this.loginDataProvider});

  Future<void> checkLogin() async {
    return await loginDataProvider.checkLogin();
  }
}
