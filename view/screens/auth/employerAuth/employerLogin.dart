import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_flix_application/view/wedgits/auth/customMaterialButton.dart';
import '../../../../controller/auth/employerLoginController.dart';
import '../../../../core/class/handlingDataRequest.dart';
import '../../../wedgits/auth/customTextFormField.dart';

class EmployerLogin extends StatelessWidget {
  const EmployerLogin({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EmployerLoginControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title: Text("Company Login"),
        centerTitle: true,
      ),
      body: GetBuilder<EmployerLoginControllerImpl>(
        builder: (EmployerLoginControllerImpl employerLoginControllerImpl) {
          return HandlingDataRequest(
            requestStatus: employerLoginControllerImpl.requestStatus,
            widget:  Form(
              key: employerLoginControllerImpl.formKey2,
              child: Column(
                children: [
                  SizedBox(height: 50),
                  Container(
                    padding: EdgeInsets.only(right: 240),
                    child: Text("Sign In",style:TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                    padding: EdgeInsets.only(right: 100),
                    child: Text("Please sign in to your registered \naccount",style:TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade600,
                    )),
                  ),
                  SizedBox(height: 40),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: CustomTextFormField(hintText: 'Email',myController: employerLoginControllerImpl.email,suffixIcon: Icon(Icons.email),keyboardType: 'email',myValidator: (value){
                      if(value!.isEmpty){
                        return 'Please enter your email';
                      }
                      if(!value.contains('@')){
                        return 'Please enter a valid email';
                      }
                      return null;
                    }),
                  ),
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: Obx((){
                      return CustomTextFormField(hintText: 'Password',suffixIcon: IconButton(onPressed: employerLoginControllerImpl.togglePasswordVisibility, icon: Icon(employerLoginControllerImpl.isPasswordHidden.value ? Icons.visibility : Icons.visibility_off)),prefixIcon: Icon(Icons.lock),myController: employerLoginControllerImpl.password,keyboardType: 'password',myValidator: (value){
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                        obscureText: employerLoginControllerImpl.isPasswordHidden.value,
                      );
                    }),
                  ),
                  SizedBox(height: 30),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 35),
                      child: CustomMaterialButton(text: 'LOGIN', buttonColor: Colors.indigo, textColor: Colors.white, onPressed: (){
                        employerLoginControllerImpl.login();
                      })
                  ),
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    child: Row(
                      children: [
                        Text("Forget your password? ",style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade900,
                        )),
                        InkWell(
                          onTap: (){
                            employerLoginControllerImpl.goToForgetPassword();
                          },
                          child: Text("Click here",style: TextStyle(
                            fontSize: 16,
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold,
                          ),),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 170),
                  Center(
                    child: Text("Do not have an account ?",style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade800
                    ),),
                  ),
                  SizedBox(height: 15),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 35),
                    child: CustomMaterialButton(text: 'CREATE ACCOUNT',buttonColor:Colors.grey.shade400,textColor:Colors.indigo,onPressed: (){
                      employerLoginControllerImpl.goToSignUp();
                    }),
                  ),
                ],
              ),
            )
          );
        }),
    );
  }
}
