import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:mini_shop/screens/all_users/all_user_screen.dart';
import 'package:mini_shop/screens/category_screen/category_screen.dart';
import 'package:mini_shop/screens/home_screen/components/body.dart';
import 'package:page_transition/page_transition.dart';

import '../../widgets/widget_exports.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home_screen';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Home',
          ),
          leading: CustomAppbar(
            onTap: () {
              // nextPage(
              //   context: context,
              //   screen: const CategoryScreen(),
              // );
              Navigator.push(
                context,
                PageTransition(
                  child: const CategoryScreen(),
                  type: PageTransitionType.fade,
                ),
              );
            },
            icon: IconlyBold.category,
          ),
          actions: [
            CustomAppbar(
              onTap: () {
                // nextPage(
                //   context: context,
                //   screen: const UsersScreen(),
                // );
                Navigator.push(
                  context,
                  PageTransition(
                    child: const UsersScreen(),
                    type: PageTransitionType.fade,
                  ),
                );
              },
              icon: IconlyBold.user3,
            ),
          ],
        ),
        body: const HomeScreenBody(),
      ),
    );
  }
}
