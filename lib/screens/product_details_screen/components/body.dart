import 'dart:developer';
import 'package:card_swiper/card_swiper.dart';
import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:mini_shop/models/product_model.dart';
import 'package:mini_shop/services/api_handler.dart';
import '../../../exports/constants_exports.dart';

class ProductDetails extends StatefulWidget {
  final String id;
  const ProductDetails({Key? key, required this.id}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  ProductsModel? productsModel;

  bool isError = false;
  String errorStr = '';
  @override
  void didChangeDependencies() {
    getProductInfo();
    super.didChangeDependencies();
  }

  Future<void> getProductInfo() async {
    try {
      productsModel = await ApiHandler.getProductById(id: widget.id);
    } catch (error) {
      isError = true;
      errorStr = error.toString();
      log('error $error');
      // throw error.toString();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const titleStyle = TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: isError
            ? Center(
                child: Text(
                  'An Error Occured $errorStr',
                  style: const TextStyle(
                      fontSize: 25, fontWeight: FontWeight.w500),
                ),
              )
            : productsModel == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 18),
                        const BackButton(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                productsModel!.category!.name.toString(),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 18),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 3,
                                    child: Text(
                                      productsModel!.title!,
                                      textAlign: TextAlign.start,
                                      style: titleStyle,
                                    ),
                                  ),
                                  Flexible(
                                    flex: 1,
                                    child: RichText(
                                      text: TextSpan(
                                        text: '\$',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: priceColor,
                                        ),
                                        children: [
                                          TextSpan(
                                            text:
                                                productsModel!.price.toString(),
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: lightTextColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 18),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.4,
                          child: Swiper(
                            itemCount: 3,
                            autoplay: true,
                            itemBuilder: (ctx, index) {
                              return FancyShimmerImage(
                                width: double.infinity,
                                imageUrl:
                                    productsModel!.images![index].toString(),
                                boxFit: BoxFit.fill,
                              );
                            },
                            pagination: SwiperPagination(
                              alignment: Alignment.bottomCenter,
                              builder: DotSwiperPaginationBuilder(
                                color: whiteColor,
                                activeColor: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 18),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Description',
                                style: titleStyle,
                              ),
                              const SizedBox(height: 18),
                              Text(
                                productsModel!.description.toString(),
                                textAlign: TextAlign.start,
                                style: const TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
      ),
    );
  }
}
