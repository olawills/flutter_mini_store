import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:mini_shop/exports/constants_exports.dart';
import 'package:mini_shop/models/product_model.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '../../product_details_screen/product_details_screen.dart';

class ProductsCatalog extends StatelessWidget {
  const ProductsCatalog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProductsModel productsModel = Provider.of<ProductsModel>(context);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).cardColor,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                child: const ProductDetailsScreen(),
                type: PageTransitionType.fade,
              ),
            );
          },
          borderRadius: BorderRadius.circular(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          text: '\$',
                          style: TextStyle(
                            color: priceColor,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '${productsModel.price}',
                              style: TextStyle(
                                color: lightTextColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Icon(IconlyBold.heart),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FancyShimmerImage(
                  height: size.height * 0.2,
                  width: double.infinity,
                  imageUrl: productsModel.images![0],
                  errorWidget: const Icon(
                    IconlyBold.danger,
                    color: Colors.red,
                  ),
                  boxFit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  productsModel.title!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.01),
            ],
          ),
        ),
      ),
    );
  }
}
