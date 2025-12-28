import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dio/dio.dart';
import 'package:job_flix_application/controller/jobSeekerHomePageController.dart';
import '../../../controller/applyJobPageController.dart';
import '../../../data/auth/jobSeekerData/applyJobModel.dart';

class ApplyJobPage extends StatelessWidget {

  ApplyJobPage({super.key});

  final ApplyJobController controller = Get.put(
    ApplyJobController(ApplyJobModel(Dio())),
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    JobSeekerHomePageControllerImpl jobSeekerHomePageControllerImpl = Get.put(JobSeekerHomePageControllerImpl());
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F7),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 70),
            Text("Upload Your CV",
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['pdf', 'doc', 'docx'],
                );
                if (result != null && result.files.single.path != null) {
                  controller.pickFile(File(result.files.single.path!));
                }
              },
              child: Obx(
                    () => Container(
                  height: 140,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 1.2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Center(
                    child: controller.selectedFile.value == null
                        ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.upload_file,
                            size: 50, color: Colors.deepPurpleAccent.shade400),
                        SizedBox(height: 10),
                        Text(
                          "Tap to upload CV (PDF or DOC)",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    )
                        : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.check_circle,
                            size: 50, color: Colors.green.shade400),
                        SizedBox(height: 10),
                        Text(
                          controller.selectedFile.value!.path.split('/').last,
                          style: TextStyle(
                              color: Colors.black87, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Add Cover Letter (Optional)",
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  )
                ],
              ),
              child: TextField(
                controller: controller.coverLetterController,
                maxLines: 6,
                decoration: InputDecoration(
                  hintText: "Write your cover letter here...",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(16),
                ),
              ),
            ),
            SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 55,
              child:Obx(() {
                return SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: controller.alreadyApplied.value
                        ? null
                        : () => controller.submitApplication(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: controller.alreadyApplied.value
                          ? Colors.grey
                          : Colors.deepPurpleAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: Text(
                      controller.alreadyApplied.value
                          ? "Already Applied"
                          : "Submit Application",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              })
            ),
          ],
        ),
      ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.deepPurple,
          shape: CircularNotchedRectangle(),
          notchMargin: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(iconSize: 30,
                  icon: Icon(Icons.person),
                  color: Colors.white,
                  onPressed: () {
                    jobSeekerHomePageControllerImpl.goToJobSeekerProfile();
                  }),
              IconButton(iconSize: 30,
                  icon: Icon(Icons.message),
                  color: Colors.white,
                  onPressed: () {}),
              IconButton(iconSize: 30,
                  icon: Icon(Icons.article),
                  color: Colors.white,
                  onPressed: () {
                    jobSeekerHomePageControllerImpl.getJobSeekerContracts();
                    jobSeekerHomePageControllerImpl.goToJobSeekerContracts();
                  }),
              IconButton(iconSize: 30,
                  icon: Icon(Icons.home),
                  color: Colors.white,
                  onPressed: () {
                    jobSeekerHomePageControllerImpl.goToJobSeekerHome();
                  }),
            ],
          ),
        )
    );
  }
}