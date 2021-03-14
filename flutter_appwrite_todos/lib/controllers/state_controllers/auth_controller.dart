import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appwrite_todos/models/models.dart';
import 'package:flutter_appwrite_todos/routes/app_constants.dart';
import 'package:flutter_appwrite_todos/services/services.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  AuthService _authService;

  Rx<User> user = User().obs;
  RxBool isLoggedIn = false.obs;

  @override
  onInit() {
    super.onInit();
    _authService = AuthService();
    checkLoggedIn();
  }

  @override
  void onReady() {
    // called after the widget is rendered on screen
    super.onReady();
  }

  setSession(User session) {
    print('session: ${session?.email}');
    user.value = session;
    isLoggedIn.value = (session.email.isEmail) ? true : false;

    if (isLoggedIn.value) {
      Get.offAllNamed(AppConstants.HomePageURL);
    } else {
      Get.offAllNamed(AppConstants.LoginPageURL);
    }
  }

  login({@required String email, @required String password}) async {
    try {
      var session = await _authService.loginAction(
        email: email,
        password: password,
      );
      checkLoggedIn();
    } catch (ex) {
      print('login exception');
      print(ex.message);
    }
  }

  register(
      {@required String name,
      @required String email,
      @required String password}) async {
    try {
      var user = await _authService.registerAction(
        email: email,
        password: password,
        name: name,
      );
      print('user');
      print(user);
    } catch (ex) {
      print('signup exception');
      print(ex.message);
    }
  }

  Future<void> checkLoggedIn() async {
    try {
      User profile = await _authService.getProfileAction();
      print('profile');
      print(profile.toJson());
      setSession(profile);
    } catch (ex) {
      print('currentProfile exception');
      print(ex);
    }
  }

  logout() async {
    try {
      await _authService.logoutAction();
      user.value = null;
      isLoggedIn.value = false;
      Get.offAllNamed(AppConstants.LoginPageURL);
    } catch (ex) {
      print('logout exception');
      print(ex);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
