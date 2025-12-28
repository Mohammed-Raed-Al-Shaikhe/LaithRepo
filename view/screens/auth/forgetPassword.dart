import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/auth/forgetPasswordController.dart';
import '../../wedgits/auth/customMaterialButton.dart';
import '../../wedgits/auth/customTextFormField.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImpl forgetPasswordController = Get.put(ForgetPasswordControllerImpl());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text("Forget Password",style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic
          )),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 35,vertical: 15),
          child: Form(
            key: forgetPasswordController.formKey5,
            child: ListView(
              children: [
                SizedBox(height: 50),
                Text("Check Email",style:TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),
                Text("Enter your email and we will send \n you a link to return to your account",style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade600,
                ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 80),
                CustomTextFormField(hintText: 'Email',myController: forgetPasswordController.emailController,keyboardType: 'email',suffixIcon: Icon(Icons.email),myValidator: (value){
                  if(value!.isEmpty){
                    return 'Please enter your email';
                  }
                  if(!value.contains('@')){
                    return 'Please enter a valid email';
                  }
                  return null;
                },),

                SizedBox(height: 50),
                CustomMaterialButton(text: 'SEND', buttonColor: Colors.indigo, textColor: Colors.white, onPressed: (){
                  forgetPasswordController.goToVerifyCode();
                })
              ],
            ),
          ),
        )
    );
  }
}

