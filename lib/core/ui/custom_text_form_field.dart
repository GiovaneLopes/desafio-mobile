import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final TextInputType? textInputType;
  final bool? obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final int? maxLength;
  final Widget? suffixIcon;
  final bool? readOnly;
  final Function(String)? onChanged;
  const CustomTextFormField({
    Key? key,
    required this.controller,
    this.hintText = '',
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.inputFormatters,
    this.validator,
    this.maxLength,
    this.suffixIcon,
    this.readOnly = false,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      keyboardType: textInputType,
      obscureText: obscureText!,
      readOnly: readOnly!,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelStyle: TextStyle(
          color: Colors.teal[300],
        ),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.teal)),
        hintText: hintText,
        suffixIcon: suffixIcon,
        label: Text(hintText!),
        focusColor: Colors.teal[300],
      ),
    );
  }
}
