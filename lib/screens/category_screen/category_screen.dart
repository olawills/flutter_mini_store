import 'package:flutter/material.dart';
import 'package:mini_shop/models/category_model.dart';
import 'package:mini_shop/screens/category_screen/components/body.dart';
import 'package:mini_shop/services/api_handler.dart';
import 'package:provider/provider.dart';
import '../../widgets/widget_exports.dart';

class CategoryScreen extends StatelessWidget {
  static String routeName = '/category_screen';
  const CategoryScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Categories',
          style: TextStyle(),
        ),
        leading: CustomAppbar(
          onTap: () => Navigator.pop(context),
          icon: Icons.arrow_back,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: FutureBuilder<List<CategoryModel>>(
          future: ApiHandler.getCategory(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("An error occured ${snapshot.error}"),
              );
            } else if (snapshot.data == null) {
              return const Center(
                child: Text("No Products has beeen added"),
              );
            }
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: snapshot.data!.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,
                childAspectRatio: 1.2,
              ),
              itemBuilder: (ctx, index) {
                return ChangeNotifierProvider.value(
                  value: snapshot.data![index],
                  child: const CategoryBody(),
                );
              },
            );
          },
        )),
      ),
    );
  }
}
