import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AddController extends GetxController {
  late TextEditingController nama;

  @override
  void onInit() {
    super.onInit();
    nama = TextEditingController();
  }

  @override
  void onClose() {
    nama.dispose();
    super.onClose();
  }
}
