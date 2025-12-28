import 'package:flutter/material.dart';

class JobField extends StatelessWidget {
  final String title;
  final void Function() onPressed;
  const JobField({super.key, required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.deepPurple),
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(title,style:TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        ),
        trailing: IconButton(onPressed: onPressed, icon: Icon(Icons.add_circle),iconSize: 30,color: Colors.deepPurple)
      ),
    );
  }
}
