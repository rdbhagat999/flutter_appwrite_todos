import 'package:appwrite/appwrite.dart';
import 'package:flutter_appwrite_todos/models/models.dart';
import 'package:flutter_appwrite_todos/services/base_service.dart';

class AuthService {
  BaseService _base = BaseService();

  loginAction({String email = '', String password = ''}) async {
    try {
      Response response = await _base.account.createSession(
        email: email,
        password: password,
      );
    } catch (e) {
      print('loginAction exception');
      print(e.message);
      throw (e);
    }
  }

  registerAction(
      {String name = '', String email = '', String password = ''}) async {
    try {
      Response response = await _base.account.create(
        email: email,
        password: password,
        name: name,
      );
    } catch (e) {
      print('registerAction exception');
      print(e.message);
      throw (e);
    }
  }

  Future<User> getProfileAction() async {
    try {
      Response response = await _base.account.get();
      if (response.statusCode == 200) {
        return User.fromJson(response.data);
      }
      return null;
    } catch (e) {
      print('getProfileAction exception');
      print(e.message);
      throw (e);
    }
  }

  Future<void> logoutAction() async {
    try {
      Response response =
          await _base.account.deleteSession(sessionId: 'current');
    } catch (e) {
      print('getProfileAction exception');
      print(e.message);
      throw (e);
    }
  }
}
