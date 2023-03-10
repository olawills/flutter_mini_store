import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:mini_shop/exports/constants_exports.dart';
import 'package:mini_shop/models/users_model.dart';
import 'package:provider/provider.dart';

class UsersBodyScreen extends StatelessWidget {
  const UsersBodyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final UsersModel usersModelProvider = Provider.of<UsersModel>(context);
    return ListTile(
      leading: FancyShimmerImage(
        height: size.height * 0.15,
        width: size.width * 0.15,
        imageUrl: usersModelProvider.avatar.toString(),
        boxFit: BoxFit.fill,
        errorWidget: const Icon(
          IconlyBold.danger,
          color: Colors.red,
        ),
      ),
      title: Text(
        usersModelProvider.name.toString(),
        style: const TextStyle(fontSize: 17),
      ),
      subtitle: Text(
        usersModelProvider.email.toString(),
      ),
      trailing: Text(
        usersModelProvider.role.toString(),
        style: TextStyle(
          color: lightIconsColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
