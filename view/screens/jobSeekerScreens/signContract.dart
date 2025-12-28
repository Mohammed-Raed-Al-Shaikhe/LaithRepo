import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/signContractController.dart';
import '../../wedgits/auth/customMaterialButton.dart';

class SignContractPage extends StatelessWidget {
  const SignContractPage({super.key});

  @override
  Widget build(BuildContext context) {
    final contractId = Get.arguments["contract_id"];
    SignContractController signContractController = Get.put(SignContractController());
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title:  Text("Sign Contract",style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.deepPurple.shade400,
                  Colors.deepPurple.shade200,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 12,
                  offset: Offset(0, 6),
                ),
              ],
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text("Job Agreement", style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(height: 14),
                          Text("By signing this contract, the job seeker confirms that "
                                "he/she has read and agreed to all terms, conditions, "
                                "and responsibilities related to this job. "
                                "This agreement becomes legally binding once signed.",
                            style: TextStyle(
                              fontSize: 16,
                              height: 1.6,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  SizedBox(height: 30),
                  Text("Signer Information",style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 14),
                  TextField(
                    controller: signContractController.firstNameController,
                    decoration: InputDecoration(
                      labelText: "First Name",
                      hintText: "Enter your first name",
                      prefixIcon: Icon(Icons.person),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    controller: signContractController.lastNameController,
                    decoration: InputDecoration(
                      labelText: "Last Name",
                      hintText: "Enter your last name",
                      prefixIcon: Icon(Icons.person),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: CustomMaterialButton(text: 'Sign Contract',buttonColor:Colors.green,textColor:Colors.black,onPressed: (){
                      signContractController.sign(contractId);
                    }),
                  ),
                   SizedBox(height: 20),
                   Text("By clicking \"Sign Contract\", you electronically agree "
                        "to the terms of this agreement.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 170),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}