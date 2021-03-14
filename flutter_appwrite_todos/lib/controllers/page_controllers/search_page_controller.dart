import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPageController extends GetxController {
  TextEditingController searchFieldController;
  Timer searchDebounce;

  @override
  onInit() {
    super.onInit();
    searchFieldController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    searchFieldController?.dispose();
    searchDebounce.cancel();
    super.onClose();
  }
}
