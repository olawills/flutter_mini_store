import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  const CustomAppbar({Key? key, required this.onTap, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(icon),
          ),
        ),
      ),
    );
  }
}
