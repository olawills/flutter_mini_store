import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  const CustomTextField({Key? key, required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        filled: true,
        hintText: 'Search',
        fillColor: Theme.of(context).cardColor,
        suffixIcon: Icon(
          IconlyLight.search,
          color: Theme.of(context).iconTheme.color,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Theme.of(context).cardColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            width: 1,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}
