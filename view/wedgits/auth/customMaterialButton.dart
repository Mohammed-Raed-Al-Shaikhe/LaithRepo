import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final Color textColor;
  final void Function()? onPressed;
  const CustomMaterialButton({super.key, required this.text, required this.buttonColor, required this.textColor,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: 60,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25)
      ),
      onPressed: onPressed,
      color: buttonColor,
      child:Text(text,style:TextStyle(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.bold
      )) ,
    );
  }
}
