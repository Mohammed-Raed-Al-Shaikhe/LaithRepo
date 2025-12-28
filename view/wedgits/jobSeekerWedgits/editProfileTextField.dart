import 'package:flutter/material.dart';

class EditTextField extends StatelessWidget {
  final TextEditingController controller;
  final int? maxLines;
  const EditTextField({super.key, required this.controller, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide(
                  color: Colors.deepPurple
              ),
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                borderSide: BorderSide(
                    color: Colors.black,
                    width: 3
                )
            )
        ),
      ),
    );
  }
}