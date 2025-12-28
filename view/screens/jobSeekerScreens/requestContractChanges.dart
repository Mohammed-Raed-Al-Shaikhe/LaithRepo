import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/requestContractChangesController.dart';
import '../../wedgits/auth/customMaterialButton.dart';

class RequestContractChanges extends StatelessWidget {
  const RequestContractChanges({super.key});

  @override
  Widget build(BuildContext context) {
    final contractId = Get.arguments["contract_id"];
    print("$contractId  I am hereeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
    RequestContractChangesController requestContractChangesController = Get.put(RequestContractChangesController());
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title:  Text("Request Contract Changes",style: TextStyle(fontWeight: FontWeight.bold)),
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
                          child: Text("Contract Changes", style: TextStyle(
                            fontSize: 23,
                            fontWeight: FontWeight.w700,
                          ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Text("Contract Changes",style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  ),
                  SizedBox(height: 14),
                  TextField(
                    controller: requestContractChangesController.changesController,
                    maxLines: 10,
                    decoration: InputDecoration(
                      hintText: "Enter the changes you want to request",
                      prefixIcon: Icon(Icons.edit),
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
                    child: CustomMaterialButton(text: 'Request',buttonColor:Colors.amberAccent,textColor:Colors.black,onPressed: (){
                      requestContractChangesController.requestChanges(contractId);
                    }),
                  ),
                  SizedBox(height: 240),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
