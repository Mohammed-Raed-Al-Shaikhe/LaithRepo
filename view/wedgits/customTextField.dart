import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final Widget suffixIcon;
  final bool? obscuredText;
  final TextEditingController myController;
  final String? Function(String?)? validator;

  const CustomTextField({super.key,required this.labelText,required this.suffixIcon, this.obscuredText,required this.myController,required this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: myController,
      validator: validator,
      obscureText: obscuredText == null || false ? false : true,
      obscuringCharacter: "*",style: TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.grey.shade600,
        ),
        suffixIcon: suffixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            color: Colors.black, // default border color
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: BorderSide(
            color: Colors.indigo, // border color when focused
            width: 2,
          ),
        ),
      ),
    );
  }
}