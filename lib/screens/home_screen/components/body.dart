import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:mini_shop/models/product_model.dart';
import 'package:mini_shop/screens/home_screen/components/custom_slider.dart';
import 'package:mini_shop/screens/home_screen/components/custom_text_field.dart';
import 'package:mini_shop/services/api_handler.dart';
import 'package:mini_shop/widgets/product_catalog_grid.dart';
import 'package:mini_shop/widgets/widget_exports.dart';
import 'package:page_transition/page_transition.dart';
import '../../../exports/constants_exports.dart';
import '../../../exports/screens_export.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({Key? key}) : super(key: key);

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  late TextEditingController _textEditingController;
  // List<ProductsModel> productsList = [];
  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          const SizedBox(height: 10),
          CustomTextField(textEditingController: _textEditingController),
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.25,
                    child: Swiper(
                      itemCount: 3,
                      autoplay: true,
                      itemBuilder: (ctx, index) {
                        return const CustomSlider();
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        const Text(
                          'Latest Product',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Spacer(),
                        CustomAppbar(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                child: const ProductsScreen(),
                                type: PageTransitionType.fade,
                              ),
                            );
                          },
                          icon: IconlyBold.arrowRight,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  FutureBuilder<List<ProductsModel>>(
                    future: ApiHandler.getProduct(limit: "10"),
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
                      return GridviewProductCatalog(
                        productsList: snapshot.data!,
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
