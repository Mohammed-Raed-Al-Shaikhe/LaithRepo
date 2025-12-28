import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/uploadJobSeekerImageController.dart';
import '../../../core/class/requestStatus.dart';

class UploadImagePage extends StatelessWidget {
  const UploadImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final UploadJobSeekerImageController uploadImageController = Get.put(UploadJobSeekerImageController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height:120),
             Text(
                "Upload Your Profile Picture",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(height: 70),
              Obx(() {
                if (uploadImageController.selectedImage.value != null) {
                  return CircleAvatar(
                    radius: 120,
                    backgroundImage: FileImage(uploadImageController.selectedImage.value!),
                  );
                } else {
                  return CircleAvatar(
                    radius: 120,
                    backgroundColor: Colors.deepPurple.shade100,
                    child: Icon(Icons.person, size: 100, color: Colors.deepPurple),
                  );
                }
              }),
              SizedBox(height: 50),
              ElevatedButton.icon(
                onPressed: (){
                  uploadImageController.pickImage();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                icon: Icon(Icons.photo),
                label: Text("Choose from Gallery",style:TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),
              ),
              SizedBox(height: 35),
              Obx(() {
                if (uploadImageController.requestStatus.value == RequestStatus.loading) {
                  return CircularProgressIndicator(color: Colors.deepPurple);
                }
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: ElevatedButton(
                    onPressed: (){
                      uploadImageController.uploadImage();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      minimumSize: Size(double.infinity, 50),
                    ),
                    child: Text("Next"),
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}