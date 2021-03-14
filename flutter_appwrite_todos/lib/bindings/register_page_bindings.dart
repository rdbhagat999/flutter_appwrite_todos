import 'package:flutter_appwrite_todos/controllers/controllers.dart';
import 'package:get/get.dart';

class RegisterPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<RegisterPageController>(RegisterPageController(), permanent: false);
  }
}
