import 'package:flutter/material.dart';
import 'package:mini_shop/models/product_model.dart';
import 'package:mini_shop/routes/routes.dart';
import 'package:provider/provider.dart';
import 'exports/constants_exports.dart';
import 'exports/screens_export.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductsModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mini Store',
        theme: AppTheme.lightTheme,
        // darkTheme: AppTheme.darkTheme,
        initialRoute: HomeScreen.routeName,
        routes: routes,
        // home: const CategoryScreen(),
      ),
    );
  }
}
