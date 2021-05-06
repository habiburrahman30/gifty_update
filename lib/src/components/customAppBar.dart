import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final Icon icon;
  const CustomAppBar({
    this.title = '',
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      title: Text(
        title ?? 'Page Title',
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      centerTitle: true,
      actions: [
        icon,
        SizedBox(
          width: 20.0,
        ),
      ],
    );
  }
}
