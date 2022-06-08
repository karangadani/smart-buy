class ShopModel {
  List<Product>? data;

  ShopModel({this.data});

  ShopModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Product>[];
      json['data'].forEach((v) {
        data!.add(new Product.fromJson(v));
      });
    }
  }
}

class Product {
  String? name;
  int? id;
  String? description;
  String? price;
  String? image;

  Product({this.name, this.id, this.description, this.price, this.image});

  Product.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
  }
}
