import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:learn_flutter_getx_cli/app/data/providers/product_provider.dart';
import '/app/data/models/product_model.dart';

class HomeController extends GetxController {
  var products = List<Product>.empty().obs;

  void dialogError(String message) {
    Get.defaultDialog(
      title: 'Terjadi Kesalahan',
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
    );
  }

  void add(String nama) {
    if (nama != '') {
      final date = DateFormat.Hm().format(DateTime.now());
      ProductProvider().postProduct(nama, date).then((response) {
        final data = Product(
          id: response["name"],
          nama: nama,
          createAt: date,
        );
        Get.back();
        return products.add(data);
      });
    } else {
      dialogError('Pastikan semua data tidak kosong!');
    }
  }

  Product findById(String id) {
    return products.firstWhere((element) => element.id == id);
  }

  void edit(String id, String nama) {
    final data = findById(id);
    ProductProvider().editProduct(nama, id).then((_) {
      data.nama = nama;
      products.refresh();
      Get.back();
    });
  }

  void delete(String id) {
    ProductProvider()
        .deleteProduct(id)
        .then((_) => products.removeWhere((element) => element.id == id));
  }
}
