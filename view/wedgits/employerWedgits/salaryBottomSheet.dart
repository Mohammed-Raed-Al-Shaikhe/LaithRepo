import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/jobPostDetailsController.dart';

class SalaryBottomSheet extends StatelessWidget {
  const SalaryBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {

    return GetBuilder<JobPostDetailsControllerImpl>(
      builder: (JobPostDetailsControllerImpl controller) {
        return Padding(
          padding: EdgeInsets.all(16),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 50,
                  height: 5,
                  margin: EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Text("Set Job Salary And Payment Type",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
                SizedBox(height: 5),
                Text("Choose the job salary and payment type you offer to job seekers",textAlign: TextAlign.center,style: TextStyle(
                  fontSize: 17,
                  color: Colors.grey.shade900,
                )),
                SizedBox(height: 15),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Enter Salary Here',
                    hintStyle: TextStyle(fontSize: 17,color: Colors.grey.shade900),
                    prefixIcon: Icon(Icons.attach_money,color: Colors.deepPurpleAccent),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                  onChanged: (value) {
                    controller.salary.value = value;
                  },
                ),
                SizedBox(height: 20),
                Obx(() => DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Currency',
                      hintStyle: TextStyle(fontSize: 18,color: Colors.grey.shade900),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    value: controller.currencies.contains(controller.selectedCurrency.value) ? controller.selectedCurrency.value : null,
                    items: controller.currencies.map((currency) {
                      return DropdownMenuItem<String>(
                        value: currency,
                        child: Text(currency),
                      );
                    }).toList(),
                    onChanged: (value) {
                      controller.selectedCurrency.value = value!;
                    },
                )
                ),
                SizedBox(height: 18),
                ...controller.paymentMethods.map((paymentMethod) {
                  return Obx(() => RadioListTile<String>(
                      title: Text(paymentMethod,style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                      value: paymentMethod,
                      activeColor: Colors.green,
                      controlAffinity: ListTileControlAffinity.trailing,
                      groupValue: controller.selectedJobType.value,
                      onChanged: (value) {
                        controller.selectedPaymentMethod.value = value!;
                        Get.back();
                      }
                  ));
                }
                )
              ]
          ),
        );
      });
  }
}