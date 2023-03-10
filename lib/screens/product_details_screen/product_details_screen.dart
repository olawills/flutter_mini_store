import 'package:flutter/material.dart';
import 'package:mini_shop/models/product_model.dart';
import 'package:mini_shop/screens/product_details_screen/components/body.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  static String routeName = '/product_details_screen';
  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductsModel productsModel = Provider.of<ProductsModel>(context);
    return Scaffold(
      body: ProductDetails(
        id: productsModel.id.toString(),
      ),
    );
  }
}
