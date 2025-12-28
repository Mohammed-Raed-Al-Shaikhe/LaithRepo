import 'package:flutter/material.dart';

class SuspendPage extends StatelessWidget {
  const SuspendPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Suspended",style:TextStyle(
          color: Colors.white,
          fontSize: 25,
          fontWeight: FontWeight.bold,
        )),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 130),
            Icon(Icons.block,size:250,color: Colors.red,),
            SizedBox(height: 25),
            Text("Your account has been suspended",style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
            ),
            SizedBox(height: 25),
            Text("Please contact with admin to get help",style: TextStyle(
              fontSize: 20,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
            ),
            SizedBox(height: 25),
            Text("Admin Email : mohammedAd@gmail.com",style: TextStyle(
              fontSize: 20,
              color: Colors.grey.shade800,
              fontWeight: FontWeight.bold,
            ),)
          ],
        ),
      )
    );
  }
}
