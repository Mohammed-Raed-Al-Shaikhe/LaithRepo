import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/jobPostDetailsController.dart';

class JobTypeBottomSheet extends StatelessWidget {

  const JobTypeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<JobPostDetailsControllerImpl>(
      builder: (JobPostDetailsControllerImpl controller) {
        return Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 50,
                  height: 5,
                  margin: EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Text("Choose Job Type",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
                SizedBox(height: 5),
                Text("Choose the type of work according to\nwhat you want",textAlign: TextAlign.center,style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade900,
                )),
                SizedBox(height: 20),
                ...controller.jobTypes.map((jobType) {
                  return Obx(() => RadioListTile<String>(
                      title: Text(jobType,style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                      value: jobType,
                      activeColor: Colors.green,
                      controlAffinity: ListTileControlAffinity.trailing,
                      groupValue: controller.selectedJobType.value,
                      onChanged: (value) {
                        controller.selectedJobType.value = value!;
                        Get.back();
                      }
                  ));
                 }
                )
              ]
            ),
        );
      });
  }
}
