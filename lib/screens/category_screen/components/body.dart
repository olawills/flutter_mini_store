import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:mini_shop/exports/constants_exports.dart';
import 'package:mini_shop/models/category_model.dart';

import 'package:provider/provider.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CategoryModel categoryModel = Provider.of<CategoryModel>(context);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          // Navigator.push(
          //   context,
          //   PageTransition(
          //     child: const CategoryView(),
          //     type: PageTransitionType.fade,
          //   ),
          // );
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: FancyShimmerImage(
                height: size.height * 0.45,
                width: size.width * 0.45,
                imageUrl: categoryModel.image.toString(),
                errorWidget: const Icon(
                  IconlyBold.danger,
                  color: Colors.red,
                ),
                boxFit: BoxFit.fill,
              ),
            ),
            Text(
              categoryModel.name.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                backgroundColor: lightCardColor.withOpacity(0.5),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
