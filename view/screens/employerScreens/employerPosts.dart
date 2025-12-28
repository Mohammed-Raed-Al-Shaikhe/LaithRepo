import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/employerProfileController.dart';
import '../../../core/constant/routesNames.dart';

class EmployerPosts extends StatelessWidget {
  const EmployerPosts({super.key});

  @override
  Widget build(BuildContext context) {
    EmployerProfileControllerImpl employerProfileController = Get.find<EmployerProfileControllerImpl>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Employer Posts"),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Obx(() => ListView.builder(
        itemCount: employerProfileController.data.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            color: Colors.grey.shade400,
            child: InkWell(
              onTap: (){
                Get.toNamed(AppRoutes.viewPostDetails,arguments: employerProfileController.data[index]);
              },
              child: ListTile(
                title: Text(employerProfileController.data[index]['job_name']??"title",style:TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.deepPurpleAccent,
                )),
                trailing: Column(
                  children: [
                    Expanded(child: IconButton(onPressed: (){
                      employerProfileController.deletePost(employerProfileController.data[index]['job_id']);
                    }, icon: Icon(Icons.delete),color: Colors.red)),
                  ],
                ),
              ),
            ),
          );
        },
      )),
    );
  }
}
