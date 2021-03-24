import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String hintText;
  final TextInputAction textInputAction;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final FocusNode focusNode;
  final bool obscureText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  CustomInput({
    this.hintText,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.focusNode,
    this.obscureText = false,
    this.controller,
    this.keyboardType,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFF2F2F2),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: TextField(
        obscureText: obscureText,
        textInputAction: textInputAction,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        focusNode: focusNode,
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 20),
          hintText: hintText ?? 'hintText...',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
