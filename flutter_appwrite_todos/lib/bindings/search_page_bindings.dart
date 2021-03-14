import 'package:flutter_appwrite_todos/controllers/controllers.dart';
import 'package:get/get.dart';

class SearchPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<TodoController>(TodoController(), permanent: false);
    Get.put<SearchPageController>(SearchPageController(), permanent: false);
  }
}
