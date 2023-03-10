import 'package:flutter/material.dart';
import 'package:mini_shop/services/api_handler.dart';
import 'package:mini_shop/models/product_model.dart';
import 'package:mini_shop/widgets/product_catalog_grid.dart';

class ProductsBodyScreen extends StatefulWidget {
  const ProductsBodyScreen({Key? key}) : super(key: key);

  @override
  State<ProductsBodyScreen> createState() => _ProductsBodyScreenState();
}

class _ProductsBodyScreenState extends State<ProductsBodyScreen> {
  final ScrollController _scrollController = ScrollController();
  List<ProductsModel> productsList = [];
  int limit = 10;
  // bool _isLoading = false;
  bool _isLimit = true;

  @override
  void initState() {
    getProducts();
    super.initState();
  }

  @override
  void didChangeDependencies() {
     super.didChangeDependencies();
    _scrollController.addListener(() async {
      if (limit == 50) {
        _isLimit = true;
        setState(() {});
        return;
      }
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _isLoading = true;
        limit += 10;

       // log('limit $limit');
        await getProducts();
        // _isLoading = false;
      }
    });
   
  }

  Future<void> getProducts() async {
    productsList = await ApiHandler.getProduct(limit: limit.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: productsList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                children: [
                  GridviewProductCatalog(
                    productsList: productsList,
                  ),
                  if (_isLimit)
                    const Center(
                      child: CircularProgressIndicator(),
                    )
                ],
              ),
            ),
    );
  }
}
