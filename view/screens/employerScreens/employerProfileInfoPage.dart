import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/employerProfileInfoController.dart';
import '../../../core/class/handlingDataRequest.dart';
import '../../wedgits/jobSeekerWedgits/profileInfoTextField.dart';

class EmployerProfileInfoPage extends StatelessWidget {
  const EmployerProfileInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EmployerProfileInfoControllerImpl());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: GetBuilder<EmployerProfileInfoControllerImpl>(
              builder: (EmployerProfileInfoControllerImpl profileInfoControllerImpl) {
                return HandlingDataRequest(
                  requestStatus: profileInfoControllerImpl.requestStatus,
                  widget: Form(
                    key: profileInfoControllerImpl.profileFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          child: Text("About Us", style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.deepPurple,
                          )),
                        ),
                        SizedBox(height: 8),
                        ProfileInfoTextField(hintText: 'Write Something About You...',controller: profileInfoControllerImpl.aboutController,maxLines: 4, validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        }),
                        SizedBox(height: 20),
                        Container(
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            child: Text("Location", style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepPurple,
                            ))
                        ),
                        SizedBox(height: 8),
                        ProfileInfoTextField(hintText: 'Enter The Location',controller: profileInfoControllerImpl.locationController, validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your location';
                          }
                          return null;
                        }),
                        SizedBox(height: 40),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              profileInfoControllerImpl.saveInfo();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 15),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              "Save & Continue",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
          )
      ),
    );
  }
}