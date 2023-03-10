import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:mini_shop/models/category_model.dart';
import 'package:mini_shop/models/product_model.dart';
import 'package:mini_shop/models/users_model.dart';
import 'package:mini_shop/services/api_key.dart';

class ApiHandler {
  static Future<List<dynamic>> getData(
      {required String urlTarget, String? limit}) async {
    try {
      var baseUrl = Uri.https(
          productkey,
          "api/v1/$urlTarget",
          urlTarget == "products"
              ? {
                  "offset": "0",
                  "limit": limit,
                }
              : {});
      var response = await http.get(baseUrl);
    
      var data = jsonDecode(response.body);
      List tempList = [];
      if (response.statusCode != 200) {
        throw data['message'];
      }
      for (var value in data) {
        tempList.add(value);
        //print("Value $value \n\n");
      }
      return tempList;
    } catch (error) {
      log('An error occured $error');
      throw error.toString();
    }
  }

  static Future<ProductsModel> getProductById({required String id}) async {
    try {
      var baseUrl = Uri.https(productkey, "api/v1/products/$id");
      var response = await http.get(baseUrl);

      var data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw data['message'];
      }

      return ProductsModel.fromJson(data);
    } catch (error) {
      // log('An error occured while getting product info $error');
      throw error.toString();
    }
  }

  static Future<List<ProductsModel>> getProduct({required String limit}) async {
    List temp = await getData(urlTarget: "products", limit: limit);
    return ProductsModel.fromSnapshot(temp);
  }

  static Future<List<CategoryModel>> getCategory() async {
    List temp = await getData(urlTarget: "categories");
    return CategoryModel.fromSnapshot(temp);
  }

  static Future<List<UsersModel>> getUsers() async {
    List temp = await getData(urlTarget: "users");
    return UsersModel.fromSnapshot(temp);
  }
}
