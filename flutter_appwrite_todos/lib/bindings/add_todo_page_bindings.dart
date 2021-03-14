import 'package:flutter_appwrite_todos/controllers/controllers.dart';
import 'package:get/get.dart';

class AddTodoPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<AddTodoPageController>(AddTodoPageController(), permanent: false);
    Get.put<TodoController>(TodoController(), permanent: false);
  }
}
