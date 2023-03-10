import 'package:flutter/material.dart';
import 'package:mini_shop/models/category_model.dart';

class ProductsModel with ChangeNotifier{
  int? id;
  String? title;
  int? price;
  String? description;
  List<String>? images;
  String? creationAt;
  String? updatedAt;
  CategoryModel? category;

  ProductsModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.images,
      this.creationAt,
      this.updatedAt,
      this.category});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    images = json['images'].cast<String>();
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
    category = json['category'] != null
        ? CategoryModel.fromJson(json['category'])
        : null;
  }

  static List<ProductsModel> fromSnapshot(List productSnapshot) {
    //print("data ${productSnapshot[0]}");
    return productSnapshot.map((data) {
     // print("data $data");
      return ProductsModel.fromJson(data);
    }).toList();
  }
}
