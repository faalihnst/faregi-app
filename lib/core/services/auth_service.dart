import 'package:dio/dio.dart';
import 'package:faregi_app/core/models/user.dart';
import 'package:faregi_app/core/result.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  User currentUser;
  Cookie currentCookie;

  Future<String> get sessionId async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('session_id');
  }

  void updateCookie(Headers headers) async {
    String rawCookie = headers['Set-Cookie'][0];
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (rawCookie != null) {
      int index = rawCookie.indexOf(';');
      String cookie = (index == -1) ? rawCookie : rawCookie.substring(0, index);
      prefs.setString('session_id', cookie);
      print('session stored : $cookie');
    }
  }

  void freshLogin(User user) async {
    this.currentUser = user;
  }

//  Future storeSession(String sessionId) async {
//    SharedPreferences prefs = await SharedPreferences.getInstance();
//    prefs.setString('session_id', sessionId);
//  }

  Future clearSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('session_id');
  }

  Future verifySession() async {
    //TODO: check if session is still active
  }

  Future logout() async {
    currentUser = null;
    return Result(ResultType.Success, 'Berhasil logout');
  }
}
