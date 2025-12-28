import 'package:flutter/material.dart';

class JobTypeCard extends StatelessWidget {
  final String title;
  final String jobs;
  final bool selected;
  final Widget myIcon;

  const JobTypeCard({super.key, required this.title, required this.jobs, this.selected = false, required this.myIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: selected ? Colors.deepPurple : Colors.purple.shade50,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              backgroundColor:selected ? Colors.white : Colors.deepPurple.shade100,
              child: myIcon,
            ),
            SizedBox(height: 10),
            Text(title,style: TextStyle(
                color: selected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(jobs, style: TextStyle(
                color: selected ? Colors.white70 : Colors.black54,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}