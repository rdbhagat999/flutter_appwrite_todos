import 'package:flutter_appwrite_todos/controllers/controllers.dart';
import 'package:get/get.dart';

class ProfilePageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}
