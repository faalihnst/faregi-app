import 'package:faregi_app/core/locator.dart';
import 'package:faregi_app/core/result.dart';
import 'package:faregi_app/core/services/api.dart';
import 'package:faregi_app/core/view_model/base_viewmodel.dart';

class AuthViewModel extends BaseModel {
  Api _api = locator<Api>();
  String username;
  String password;
  String confirmPassword;
  String name;
  String errorMessage;

  void init() async {
    setBusy(true);
    errorMessage = '';
    setBusy(false);
  }

  Future register() async {
    Result result;
    errorMessage = '';
    setBusy(true);
    if (username == null)
      result = Result(ResultType.Warning, 'Email harus diisi');
    else if (password == null)
      result = Result(ResultType.Warning, 'Password harus diisi');
    else if (confirmPassword == null)
      result = Result(ResultType.Warning, 'Masukkan ulang password');
    else if (name == null)
      result = Result(ResultType.Warning, 'Nama harus diisi');
    else
      result = await _api.register(username, password, name, confirmPassword);
    setBusy(false);
    return result;
  }

  Future login() async {
    Result result;
    errorMessage = '';
    setBusy(true);
    if (username == null)
      result = Result(ResultType.Warning, 'Username harus diisi');
    else if (password == null)
      result = Result(ResultType.Warning, 'Password harus diisi');
    else
      result = await _api.login(username, password);
    setBusy(false);
    return result;
  }
}
