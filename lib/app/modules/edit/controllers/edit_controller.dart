import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditController extends GetxController {
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
