import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/uploadEmployerImageController.dart';
import '../../../core/class/requestStatus.dart';

class UploadEmployerImagePage extends StatelessWidget {
  const UploadEmployerImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final UploadEmployerImageController uploadEmployerImageController = Get.put(UploadEmployerImageController());

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
                if (uploadEmployerImageController.selectedImage.value != null) {
                  return CircleAvatar(
                    radius: 120,
                    backgroundImage: FileImage(uploadEmployerImageController.selectedImage.value!),
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
                  uploadEmployerImageController.pickImage();
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
                if (uploadEmployerImageController.requestStatus.value == RequestStatus.loading) {
                  return CircularProgressIndicator(color: Colors.deepPurple);
                }
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 60),
                  child: ElevatedButton(
                    onPressed: (){
                      uploadEmployerImageController.uploadImage();
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