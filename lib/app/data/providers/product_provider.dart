import 'package:get/get.dart';

class ProductProvider extends GetConnect {
  final url =
      "https://getcli-a9f28-default-rtdb.asia-southeast1.firebasedatabase.app";

  Future<void> editProduct(String nama, String id) async {
    await patch('$url/products/$id.json', {
      "name": nama,
    });
  }

  Future<dynamic> postProduct(String nama, String date) async {
    final response = await post('$url/products.json', {
      "name": nama,
      "createdat": date,
    });
    return response.body;
  }

  Future<void> deleteProduct(String id) async =>
      await delete('$url/products/$id.json');
}
