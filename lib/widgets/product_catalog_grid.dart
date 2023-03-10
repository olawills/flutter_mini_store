import 'package:flutter/material.dart';
import 'package:mini_shop/models/product_model.dart';
import 'package:mini_shop/screens/home_screen/components/products_catalog.dart';
import 'package:provider/provider.dart';

class GridviewProductCatalog extends StatelessWidget {
  final ScrollController? scrollController;
  const GridviewProductCatalog({Key? key, required this.productsList,  this.scrollController})
      : super(key: key);

  final List<ProductsModel> productsList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: scrollController,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: productsList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        childAspectRatio: 0.6,
      ),
      itemBuilder: (ctx, index) {
        return ChangeNotifierProvider.value(
            value: productsList[index], child: const ProductsCatalog());
      },
    );
  }
}
