import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Product'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
              onPressed: () => Get.toNamed(Routes.ADD),
              icon: const Icon(Icons.add))
        ],
      ),
      body: Obx(
        () => controller.products.isEmpty
            ? const Center(
                child: Text('Belum ada data'),
              )
            : ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  final data = controller.products[index];
                  return ListTile(
                    onTap: () => Get.toNamed(Routes.EDIT, arguments: data.id),
                    leading: const CircleAvatar(),
                    title: Text(data.nama!),
                    subtitle: Text(data.createAt!),
                    trailing: IconButton(
                      onPressed: () => controller.delete(data.id!),
                      icon: const Icon(Icons.delete),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
