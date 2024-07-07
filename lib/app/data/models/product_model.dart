class Product {
  String? id;
  String? nama;
  String? createAt;

  Product({this.id, this.nama, this.createAt});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nama = json['name'];
    createAt = json['createAt'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = nama;
    data['createAt'] = createAt;
    return data;
  }
}
