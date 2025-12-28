import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_flix_application/core/class/handlingDataRequest.dart';
import '../../../controller/editJobSeekerProfileController.dart';
import '../../wedgits/jobSeekerWedgits/editProfileTextField.dart';

class EditJobSeekerProfilePage extends StatelessWidget {
  const EditJobSeekerProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(EditJobSeekerProfilePageImpl());
    return Scaffold(
      backgroundColor: Colors.deepPurpleAccent,
      appBar: AppBar(
        title: Text("Edit Profile", style: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold
        )),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: GetBuilder<EditJobSeekerProfilePageImpl>(
        builder: (EditJobSeekerProfilePageImpl editJobSeekerProfilePage) {
          return HandlingDataRequest(
              requestStatus: editJobSeekerProfilePage.requestStatus,
              widget: ListView(
                children: [
                  SizedBox(height: 30),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Text("About me :", style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold))
                  ),
                  SizedBox(height: 5),
                  EditTextField(controller: editJobSeekerProfilePage.editAboutController,maxLines: 4),
                  SizedBox(height:10),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Text("Location :", style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold))
                  ),
                  SizedBox(height: 5),
                  EditTextField(controller: editJobSeekerProfilePage.editLocationController),
                  SizedBox(height:10),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Text("Position :", style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold))
                  ),
                  SizedBox(height: 5),
                  EditTextField(controller: editJobSeekerProfilePage.editPositionController),
                  SizedBox(height:10),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Text("Email :", style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold))
                  ),
                  SizedBox(height: 5),
                  EditTextField(controller: editJobSeekerProfilePage.editEmailController),
                  SizedBox(height:10),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Text("Phone :", style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold))
                  ),
                  SizedBox(height: 5),
                  EditTextField(controller: editJobSeekerProfilePage.editPhoneController),
                  SizedBox(height:10),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Text("Years of Experience :", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
                  ),
                  SizedBox(height: 5),
                  EditTextField(controller: editJobSeekerProfilePage.editExperienceController),
                  SizedBox(height:10),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Text("Education :", style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold))
                  ),
                  SizedBox(height: 5),
                  EditTextField(controller: editJobSeekerProfilePage.editEducationController),
                  SizedBox(height:10),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: Text("Skills :", style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold))
                  ),
                  SizedBox(height: 5),
                  EditTextField(controller: editJobSeekerProfilePage.editSkillsController),
                  SizedBox(height: 30),
                  Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 35),
                    child: MaterialButton(
                      onPressed: (){
                        editJobSeekerProfilePage.saveChanges();
                      },
                      color: Colors.amber,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: Text("Save Changes", style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
          );
        }
      )
    );
  }
}