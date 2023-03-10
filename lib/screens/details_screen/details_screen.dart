import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:mini_shop/screens/details_screen/components/body.dart';

import '../../widgets/widget_exports.dart';

class ProductsScreen extends StatelessWidget {
  static String routeName = '/details_screen';
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'All Products',
        ),
        leading: CustomAppbar(
          onTap: () => Navigator.pop(context),
          icon: IconlyBold.arrowLeft,
        ),
      ),
      body: const ProductsBodyScreen(),
    );
  }
}
