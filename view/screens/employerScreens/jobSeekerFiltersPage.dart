import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/jobSeekerFiltersController.dart';

class JobSeekerFiltersPage extends StatelessWidget {
  JobSeekerFiltersPage({super.key});

  final JobSeekerFiltersController jobSeekerFiltersController = Get.put(JobSeekerFiltersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filter Job Seekers"),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Job Field", style: titleStyle()),
            Obx(() => DropdownButtonFormField(
              value: jobSeekerFiltersController.selectedField.value.isEmpty
                  ? null
                  : jobSeekerFiltersController.selectedField.value,
              items: jobSeekerFiltersController.jobFields
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) => jobSeekerFiltersController.selectedField.value = value!,
              dropdownColor: Colors.deepPurpleAccent,
              decoration: inputStyle(),
            ),
            ),
            SizedBox(height: 20),
            Text("Location", style: titleStyle()),
            TextField(
              keyboardType: TextInputType.name,
              onChanged: (value) {
                jobSeekerFiltersController.selectedLocation.value = value;
              },
              decoration: inputStyle(),
            ),
            SizedBox(height: 20),
            Text("Minimum Experience", style: titleStyle()),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                jobSeekerFiltersController.minExperience.value = int.tryParse(value) ?? 0;
              },
              decoration: inputStyle(),
            ),
            SizedBox(height: 20),
            Text("Maximum Experience", style: titleStyle()),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                jobSeekerFiltersController.maxExperience.value = int.tryParse(value) ?? 0;
              },
              decoration: inputStyle(),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    jobSeekerFiltersController.resetFilters();
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
                    jobSeekerFiltersController.search();
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
