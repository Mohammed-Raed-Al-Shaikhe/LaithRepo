import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_flix_application/core/class/handlingDataRequest.dart';
import '../../../controller/editEmployerProfileController.dart';
import '../../wedgits/jobSeekerWedgits/editProfileTextField.dart';

class EditEmployerProfile extends StatelessWidget {

  const EditEmployerProfile({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(EditEmployerProfilePageImpl());
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
        body: GetBuilder<EditEmployerProfilePageImpl>(
            builder: (EditEmployerProfilePageImpl editEmployerProfilePage) {
              return HandlingDataRequest(
                requestStatus: editEmployerProfilePage.requestStatus,
                widget: ListView(
                  children: [
                    SizedBox(height: 30),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Text("About Us :", style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold))
                    ),
                    SizedBox(height: 5),
                    EditTextField(controller: editEmployerProfilePage.editAboutController,maxLines: 4),
                    SizedBox(height:10),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Text("Location :", style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold))
                    ),
                    SizedBox(height: 5),
                    EditTextField(controller: editEmployerProfilePage.editLocationController),
                    SizedBox(height:10),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Text("Email :", style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold))
                    ),
                    SizedBox(height: 5),
                    EditTextField(controller: editEmployerProfilePage.editEmailController),
                    SizedBox(height:10),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Text("Phone :", style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold))
                    ),
                    SizedBox(height: 5),
                    EditTextField(controller: editEmployerProfilePage.editPhoneController),
                    SizedBox(height: 30),
                    Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 35),
                      child: MaterialButton(
                        onPressed: (){
                          editEmployerProfilePage.saveChanges();
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