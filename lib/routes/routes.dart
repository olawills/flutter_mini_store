import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mini_shop/screens/all_users/all_user_screen.dart';
import 'package:mini_shop/screens/category_screen/category_screen.dart';
import 'package:mini_shop/screens/catgories_view/category_view.dart';
import 'package:mini_shop/screens/product_details_screen/product_details_screen.dart';
import 'package:mini_shop/screens/splash_screen/splash_screen.dart';
import '../exports/screens_export.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(),
  ProductsScreen.routeName: (context) => const ProductsScreen(),
  ProductDetailsScreen.routeName: (context) => const ProductDetailsScreen(),
  CategoryScreen.routeName: (context) => const CategoryScreen(),
  UsersScreen.routeName: (context) => const UsersScreen(),
  CategoryView.routeName: (context) => const CategoryView(),
};
