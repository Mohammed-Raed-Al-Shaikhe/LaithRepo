import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final String? keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextEditingController? myController;
  final String? Function(String?)? myValidator;
  final bool? obscureText;
  const CustomTextFormField({super.key, required this.hintText,this.suffixIcon,this.prefixIcon, this.myController, this.keyboardType, this.myValidator, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText!,
      obscuringCharacter: '*',
      keyboardType: keyboardType == 'email' ? TextInputType.emailAddress : keyboardType == 'phone' ? TextInputType.phone : TextInputType.text,
      controller: myController,
      validator: myValidator,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
        borderRadius:keyboardType == 'password'? BorderRadius.circular(100): BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.purple,
            width: 2.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius:keyboardType == 'password'? BorderRadius.circular(100): BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:keyboardType == 'password'? BorderRadius.circular(100): BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.green,
            width: 2.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius:keyboardType == 'password'? BorderRadius.circular(100): BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.5,
          ),
        ),
      ),
    );
  }
}
