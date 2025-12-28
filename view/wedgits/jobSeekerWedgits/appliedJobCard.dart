import 'package:flutter/material.dart';

class AppliedJobCard extends StatelessWidget {
  final String company;
  final String location;
  final String role;
  final String appliedTime;
  final String jobType;
  final String status;
  final int salary;
  final String currency;
  final String field;

  const AppliedJobCard({
    super.key,
    required this.company,
    required this.location,
    required this.role,
    required this.appliedTime,
    required this.jobType,
    required this.status,
    required this.salary,
    required this.field,
    required this.currency,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      margin: EdgeInsets.all(18),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text("$company Company",style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black87,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: status == "pending"
                      ? Colors.yellowAccent
                      : status == "rejected"
                      ? Colors.red
                      : Colors.green,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                   children: [
                    Icon(status == "pending"
                          ? Icons.timer
                          : status == "rejected"
                          ? Icons.close
                          : Icons.check,
                      size: 16,
                    ),
                    SizedBox(width: 4),
                    Text(status,style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.work, size: 16, color: Colors.grey.shade900),
              SizedBox(width: 3),
              Text(role,style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(Icons.location_on, size: 16, color: Colors.grey.shade900),
              SizedBox(width: 3),
              Text(location,style: TextStyle(color: Colors.grey.shade900, fontSize: 16),),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Icon(Icons.timelapse_outlined, size: 16, color: Colors.grey.shade900,),
              SizedBox(width: 3),
              Text("Applied on $appliedTime",style: TextStyle(fontSize: 16, color: Colors.grey.shade900),),
            ],
          ),
          SizedBox(height: 14),
          Text("Job details",style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.orange,
            ),
          ),
          SizedBox(height: 4),
          Text("• Job Field : $field",style: TextStyle(fontSize: 16, color: Colors.grey.shade900),),
          Text("• Job Type : $jobType",style: TextStyle(fontSize: 16, color: Colors.grey.shade900),),
          Text("• Salary : $salary $currency",style: TextStyle(fontSize: 16, color: Colors.grey.shade900),),
        ],
      ),
    );
  }
}
