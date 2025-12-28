import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/jobFiltersController.dart';

class JobFiltersPage extends StatelessWidget {
  JobFiltersPage({super.key});

  final JobFiltersController controller = Get.put(JobFiltersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter Jobs"),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Job Field", style: titleStyle()),
            Obx(() => DropdownButtonFormField(
                value: controller.selectedField.value.isEmpty
                    ? null
                    : controller.selectedField.value,
                items: controller.jobFields
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) => controller.selectedField.value = value!,
                dropdownColor: Colors.deepPurpleAccent,
                decoration: inputStyle(),
              ),
            ),
            SizedBox(height: 20),
            Text("Job Type", style: titleStyle()),
            Obx(() => DropdownButtonFormField(
                value: controller.selectedType.value.isEmpty
                    ? null
                    : controller.selectedType.value,
                items: controller.jobTypes
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) => controller.selectedType.value = value!,
                dropdownColor: Colors.deepPurpleAccent,
                decoration: inputStyle(),
              ),
            ),
            SizedBox(height: 20),
            Text("Location", style: titleStyle()),
            TextField(
              keyboardType: TextInputType.name,
              onChanged: (value) {
                controller.selectedLocation.value = value;
              },
              decoration: inputStyle(),
            ),
            SizedBox(height: 20),
            Text("Minimum Salary", style: titleStyle()),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                controller.minSalary.value = int.tryParse(value) ?? 0;
              },
              decoration: inputStyle(),
            ),
            SizedBox(height: 20),
            Text("Maximum Salary", style: titleStyle()),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                controller.maxSalary.value = int.tryParse(value) ?? 0;
              },
              decoration: inputStyle(),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    controller.resetFilters();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: Text("Reset",style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    controller.search();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  ),
                  child: Text("Search",style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  InputDecoration inputStyle() {
    return InputDecoration(
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      filled: true,
      fillColor: Colors.grey.shade100,
    );
  }

  TextStyle titleStyle() {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      color: Colors.deepPurple,
    );
  }
}
