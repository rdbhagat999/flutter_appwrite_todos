import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPageController extends GetxController {
  TextEditingController emailFieldController;
  TextEditingController passwordFieldController;
  TextEditingController nameFieldController;

  @override
  onInit() {
    super.onInit();

    emailFieldController = TextEditingController();
    passwordFieldController = TextEditingController();
    nameFieldController = TextEditingController();
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
    nameFieldController?.dispose();

    super.onClose();
  }
}
