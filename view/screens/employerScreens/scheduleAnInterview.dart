import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/scheduleAnInterviewPageController.dart';

class ScheduleAnInterview extends StatelessWidget {
  final String seekerId;
  final String employerId;
  final String jobId;

  ScheduleAnInterview({super.key,required this.seekerId,required this.employerId,required this.jobId});

  final ScheduleAnInterviewControllerImpl controller =
  Get.put(ScheduleAnInterviewControllerImpl());
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  final Rx<TimeOfDay> selectedTime = TimeOfDay(hour: 10, minute: 0).obs;

  @override
  Widget build(BuildContext context) {
    controller.seekerId = seekerId;
    controller.employerId = employerId;
    controller.jobId = jobId;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurpleAccent,
        title: Text("Schedule Interview",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),

      body: Padding(
        padding:  EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            sectionTitle("Select Interview Date"),
            SizedBox(height: 8),
            Obx(() => buildPickerCard(
              icon: Icons.calendar_today,
              title:
              "${selectedDate.value.year}-${selectedDate.value.month.toString().padLeft(2, '0')}-${selectedDate.value.day.toString().padLeft(2, '0')}",
              subtitle: "Tap to choose date",
              onTap: () async {
                DateTime? picked = await showDatePicker(
                  context: context,
                  initialDate: selectedDate.value,
                  firstDate: DateTime.now(),
                  lastDate: DateTime(2101),
                );
                if (picked != null) selectedDate.value = picked;
              },
            )),
            SizedBox(height: 30),
            sectionTitle("Select Interview Time"),
            SizedBox(height: 8),
            Obx(() => buildPickerCard(
              icon: Icons.access_time_filled,
              title: "${selectedTime.value.hour.toString().padLeft(2, '0')}:${selectedTime.value.minute.toString().padLeft(2, '0')}",
              subtitle: "Tap to choose time",
              onTap: () async {
                TimeOfDay? picked = await showTimePicker(
                  context: context,
                  initialTime: selectedTime.value,
                );
                if (picked != null) selectedTime.value = picked;
              },
            )),
            SizedBox(height: 50),
            Center(
              child: SizedBox(
                width: 250,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    controller.interviewDate = "${selectedDate.value.year}-${selectedDate.value.month.toString().padLeft(2, '0')}-${selectedDate.value.day.toString().padLeft(2, '0')}";
                    controller.interviewTime = "${selectedTime.value.hour.toString().padLeft(2, '0')}:${selectedTime.value.minute.toString().padLeft(2, '0')}";
                    controller.scheduleAnInterView();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                  ),
                  child: Text("Schedule Interview",style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget sectionTitle(String text) {
    return Text(text,style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  Widget buildPickerCard({required IconData icon,required String title,required String subtitle,required Function() onTap,}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.grey.shade300,
              child: Icon(icon, color: Colors.deepPurpleAccent, size: 26),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,style:TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                SizedBox(height: 4),
                Text(subtitle, style: TextStyle(color: Colors.grey.shade700,fontSize: 15)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}