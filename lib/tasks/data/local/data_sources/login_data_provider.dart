import 'package:imake/utils/exception_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:imake/tasks/data/local/model/login_model.dart';

class LoginDataProvider {
  List<LoginModel> login = [];
  SharedPreferences? prefs;

  LoginDataProvider(this.prefs);

  Future<void> checkLogin() async {
    try {
      return;
    } catch (e) {
      throw Exception(handleException(e));
    }
  }
}
