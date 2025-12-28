import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/createContractController.dart';
import '../../../core/services/myService.dart';

class CreateContractPage extends StatelessWidget {
  CreateContractPage({super.key});

  final args = Get.arguments;
  late final int jobSeekerId = args['seeker_id'];
  late final int jobId = args['job_id'];
  final controller = Get.put(CreateContractController());

  @override
  Widget build(BuildContext context) {
    final MyServices myService = Get.find();
    myService.sharedPreferences.setString("contract_seeker_id", jobSeekerId.toString());
    myService.sharedPreferences.setString("contract_job_id", jobId.toString());
    return Scaffold(
      backgroundColor: Color(0xFFF4F0FF),
      appBar: AppBar(
        title: Text("Create Contract",style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepPurpleAccent, Colors.deepPurple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.deepPurple.withOpacity(0.25),
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Icon(Icons.description, color: Colors.white, size: 40),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "Fill contract details clearly and professionally.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Container(
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildInput(
                    label: "Contract Title",
                    controller: controller.titleController,
                    icon: Icons.title,
                  ),
                  SizedBox(height: 15),
                  _buildLargeInput(
                    label: "Contract Body",
                    controller: controller.bodyController,
                    icon: Icons.article,
                  ),
                  SizedBox(height: 15),
                  _buildInput(
                    label: "Salary",
                    controller: controller.salaryController,
                    icon: Icons.monetization_on,
                    inputType: TextInputType.number,
                  ),
                  SizedBox(height: 20),
                  Obx(() {
                    return Row(
                      children: [
                        Expanded(
                          child: _dateButton(
                            title: controller.startDate.value == null
                                ? "Start Date"
                                : "Start: ${controller.startDate.value!.toLocal().toString().split(' ')[0]}",
                            icon: Icons.calendar_month,
                            onTap: () => controller.pickDate(true, context),
                          ),
                        ),
                        Expanded(
                          child: _dateButton(
                            title: controller.endDate.value == null
                                ? "End Date"
                                : "End: ${controller.endDate.value!.toLocal().toString().split(' ')[0]}",
                            icon: Icons.calendar_today,
                            onTap: () => controller.pickDate(false, context),
                          ),
                        ),
                      ],
                    );
                  }),
                  SizedBox(height: 30),
                  Obx(() {
                    return controller.isLoading.value
                        ? CircularProgressIndicator()
                        : SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                         onPressed: () {
                           controller.createContract();
                         },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurpleAccent,
                          padding: EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 4,
                        ),
                        child: Text("Create And Send Contract",style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInput({
    required String label,
    required TextEditingController controller,
    required IconData icon,
    TextInputType inputType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: label,
        prefixIcon: Icon(icon, color: Colors.deepPurple),
        filled: true,
        fillColor: Color(0xFFF7F3FF),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildLargeInput({
    required String label,
    required TextEditingController controller,
    required IconData icon,
  }) {
    return TextField(
      controller: controller,
      maxLines: 5,
      decoration: InputDecoration(
        hintText: label,
        prefixIcon: Icon(icon, color: Colors.deepPurple),
        alignLabelWithHint: true,
        filled: true,
        fillColor: Color(0xFFF7F3FF),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _dateButton({
    required String title,
    required IconData icon,
    required Function() onTap,
  }) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFF7F3FF),
        elevation: 1,
        padding: EdgeInsets.symmetric(vertical: 13),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.deepPurple),
          SizedBox(width: 6),
          Text(
            title,
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}