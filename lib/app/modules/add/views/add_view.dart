import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '/app/modules/home/controllers/home_controller.dart';

import '../controllers/add_controller.dart';

class AddView extends GetView<AddController> {
  final homeC = Get.find<HomeController>();
  AddView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
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
                onEditingComplete: () => homeC.add(controller.nama.text),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => homeC.add(controller.nama.text),
                child: const Text('Add'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
