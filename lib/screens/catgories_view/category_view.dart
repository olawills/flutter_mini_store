import 'package:flutter/material.dart';
import 'package:mini_shop/models/product_model.dart';
import 'package:mini_shop/services/api_handler.dart';
import 'package:mini_shop/widgets/product_catalog_grid.dart';
import '../../widgets/widget_exports.dart';

class CategoryView extends StatefulWidget {
  static String routeName = '/category_view_screen';
  const CategoryView({Key? key}) : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List<ProductsModel> productsList = [];

  Future<void> getProducts() async {
    productsList = await ApiHandler.getProduct(limit: '5');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Funiture',
          style: TextStyle(),
        ),
        leading: CustomAppbar(
          onTap: () => Navigator.pop(context),
          icon: Icons.arrow_back,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: productsList.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : GridviewProductCatalog(
                    productsList: productsList,
                  ),
          ),
        ),
      ),
    );
  }
}
