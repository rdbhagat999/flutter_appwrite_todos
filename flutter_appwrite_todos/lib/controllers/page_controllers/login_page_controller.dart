import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPageController extends GetxController {
  TextEditingController emailFieldController;
  TextEditingController passwordFieldController;

  @override
  onInit() {
    super.onInit();

    emailFieldController = TextEditingController();
    passwordFieldController = TextEditingController();
  }

  @override
  void onReady() {
    // called after the widget is rendered on screen
    super.onReady();
  }

  @override
  void onClose() {
    emailFieldController?.dispose();
    passwordFieldController?.dispose();

    super.onClose();
  }
}
