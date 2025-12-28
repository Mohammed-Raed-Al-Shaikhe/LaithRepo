import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../../controller/auth/resetPasswordVerifyCodeController.dart';

class ResetPasswordVerificationCode extends StatelessWidget {
  const ResetPasswordVerificationCode({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordVerifyCodeControllerImpl resetPasswordVerifyCodeControllerImpl = Get.put(ResetPasswordVerifyCodeControllerImpl());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("Verification Code"
          ),),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 35,vertical: 15),
          child: ListView(
            children: [
              SizedBox(height: 50),
              Text("Enter The Email \nVerification Code Here",style:TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 15),
              Text("a verification code has been sent \nto your email to verify your Identity",style: TextStyle(
                fontSize: 17,
                color: Colors.grey.shade600,
              ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 80),
              OtpTextField(
                filled: true,
                fillColor: Colors.grey.shade400,
                borderWidth: 4,
                numberOfFields: 5,
                borderColor: Colors.black12,
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode){
                  resetPasswordVerifyCodeControllerImpl.goToResetPassword();
                }, // end onSubmit
              ),
            ],
          ),
        )
    );
  }
}
