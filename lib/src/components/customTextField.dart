import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key key,
    this.onChanged,
    this.errorText,
    @required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    @required this.keyboardType,
    @required this.textInputAction,
    this.hasMaxLines = false,
    this.maxLines,
    this.controller,
    this.initalText,
    this.readOnly = false,
    this.hintTextStyle,
  }) : super(key: key);

  final Function onChanged;
  final String errorText;
  final String hintText;
  final String initalText;
  final Icon suffixIcon;
  final Icon prefixIcon;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final int maxLines;
  final bool hasMaxLines;
  final bool readOnly;
  final TextEditingController controller;
  final TextStyle hintTextStyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initalText != null ? initalText : '',
      onChanged: onChanged,
      maxLines: maxLines,
      controller: controller,
      readOnly: readOnly,
      decoration: InputDecoration(
        errorText: errorText,
        filled: true,
        hintText: hintText ?? 'Text',
        hintStyle: hintTextStyle,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        contentPadding: EdgeInsets.fromLTRB(20, hasMaxLines ? 25 : 5, 0, 0),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(25.7),
        ),
      ),
      keyboardType: keyboardType,
      textInputAction: textInputAction,
    );
  }
}
