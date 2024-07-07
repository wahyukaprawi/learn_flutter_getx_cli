import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '/app/modules/home/controllers/home_controller.dart';

import '../controllers/edit_controller.dart';

class EditView extends GetView<EditController> {
  final homeC = Get.find<HomeController>();
  EditView({super.key});
  @override
  Widget build(BuildContext context) {
    final data = homeC.findById(Get.arguments);
    controller.nama.text = data.nama!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Product'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: controller.nama,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Nama'),
                  hintText: 'Masukan nama product di sini...',
                ),
                onEditingComplete: () => homeC.edit(Get.arguments, controller.nama.text),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => homeC.edit(Get.arguments, controller.nama.text),
                child: const Text('Edit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
