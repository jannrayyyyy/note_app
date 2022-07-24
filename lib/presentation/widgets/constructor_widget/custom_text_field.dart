// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final double? hintSize;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool readonly;
  final String? Function(String?)? validator;
  const CustomTextFormField(
      {Key? key,
      this.controller,
      this.labelText,
      this.hintSize,
      this.fontSize,
      this.fontWeight,
      this.validator,
      required this.readonly})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      readOnly: readonly,
      style: TextStyle(fontSize: fontSize),
      decoration: InputDecoration.collapsed(
        hintText: labelText,
        hintStyle: TextStyle(fontSize: hintSize),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final double? hintSize;
  final double? fontSize;
  final FontWeight? fontWeight;
  final bool readOnly;
  const CustomTextField(
      {Key? key,
      this.controller,
      this.labelText,
      this.hintSize,
      this.fontSize,
      this.fontWeight,
      required this.readOnly})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      style: TextStyle(fontSize: fontSize, fontWeight: fontWeight),
      maxLines: 30,
      minLines: 1,
      decoration: InputDecoration(
        hintText: labelText,
        hintStyle: TextStyle(fontSize: hintSize),
      ),
    );
  }
}
