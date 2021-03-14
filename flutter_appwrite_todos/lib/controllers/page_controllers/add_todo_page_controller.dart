import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTodoPageController extends GetxController {
  TextEditingController todoTitleFieldController;

  @override
  onInit() {
    super.onInit();

    todoTitleFieldController = TextEditingController();
  }

  @override
  void onReady() {
    // called after the widget is rendered on screen
    super.onReady();
  }

  @override
  void onClose() {
    todoTitleFieldController?.dispose();

    super.onClose();
  }
}
