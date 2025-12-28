import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/resetPasswordController.dart';
import '../../wedgits/auth/customMaterialButton.dart';
import '../../wedgits/auth/customTextFormField.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImpl resetPasswordController = Get.put(ResetPasswordControllerImpl());
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          centerTitle: true,
          title: Text("Reset Password",style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic
          )),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: Form(
            key: resetPasswordController.formKey6,
            child: ListView(
              children: [
                SizedBox(height: 50),
                Container(
                  padding: EdgeInsets.only(right: 100),
                  child: Text("Set Your New \nPassword",style:TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  ),
                ),
                SizedBox(height: 15),
                Text("Please, Set a New Password For Your \nAccount",style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey.shade800,
                ),
                ),
                SizedBox(height: 50),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  child: Obx((){
                    return CustomTextFormField(hintText: 'New Password',suffixIcon: IconButton(onPressed: resetPasswordController.togglePasswordVisibility, icon: Icon(resetPasswordController.isPasswordHidden.value ? Icons.visibility : Icons.visibility_off)),prefixIcon: Icon(Icons.lock),myController: resetPasswordController.newPasswordController,keyboardType: 'password',myValidator: (value){
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                      obscureText: resetPasswordController.isPasswordHidden.value,
                    );
                  }),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  child: Obx((){
                    return CustomTextFormField(hintText: 'Confirm Password',suffixIcon: IconButton(onPressed: resetPasswordController.togglePasswordVisibility, icon: Icon(resetPasswordController.isPasswordHidden.value ? Icons.visibility : Icons.visibility_off)),prefixIcon: Icon(Icons.lock),myController: resetPasswordController.confirmPasswordController,keyboardType: 'password',myValidator: (value){
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                      obscureText: resetPasswordController.isPasswordHidden.value,
                    );
                  }),
                ),
                SizedBox(height: 50),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 35),
                  child: CustomMaterialButton(text: "Continue",buttonColor: Colors.indigo,textColor: Colors.white,onPressed: (){
                    if(resetPasswordController.newPasswordController.text == resetPasswordController.confirmPasswordController.text){
                      resetPasswordController.reset();
                  }else{
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text("Error"),
                            content: Text("Password not match"),
                          ) );
                    }
                  }),
                ),
              ],
            ),
          ),
        )
    );
  }
}
