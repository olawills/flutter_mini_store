import 'package:flutter/material.dart';
import 'package:mini_shop/models/users_model.dart';
import 'package:mini_shop/screens/all_users/components/body.dart';
import 'package:mini_shop/services/api_handler.dart';
import 'package:provider/provider.dart';
import '../../widgets/widget_exports.dart';

class UsersScreen extends StatelessWidget {
  static String routeName = '/users_screen';
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'All Users',
          style: TextStyle(),
        ),
        leading: CustomAppbar(
          onTap: () => Navigator.pop(context),
          icon: Icons.arrow_back,
        ),
      ),
      body: FutureBuilder<List<UsersModel>>(
        future: ApiHandler.getUsers(),
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
              child: Text("No users has beeen added"),
            );
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (ctx, index) {
              return ChangeNotifierProvider.value(
                value: snapshot.data![index],
                child: const UsersBodyScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
