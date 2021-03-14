import 'package:flutter_appwrite_todos/controllers/controllers.dart';
import 'package:get/get.dart';

class LoginPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<LoginPageController>(LoginPageController(), permanent: false);
  }
}
