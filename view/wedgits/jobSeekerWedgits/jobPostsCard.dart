import 'package:flutter/material.dart';
import 'package:job_flix_application/controller/jobSeekerHomePageController.dart';
import 'package:job_flix_application/view/screens/jobSeekerScreens/viewPostPage.dart';


class JobPostsCard extends StatelessWidget {
  final String company;
  final String position;
  final String location;
  final String salary;
  final IconData? logo;
  final Map<String,dynamic> job;


  const JobPostsCard({
    super.key,
    required this.company,
    required this.position,
    required this.location,
    required this.salary,
    this.logo,
    required this.job,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: Image.asset('images/company.png',fit: BoxFit.cover).image,
              radius: 28,
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(company,style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.business_center,size: 20,color: Color.fromARGB(255, 100, 100, 100),),
                    SizedBox(width: 5),
                    Text(position, style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 100, 100, 100),
                    ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.location_on,size: 20,color: Color.fromARGB(255, 100, 100, 100),),
                    SizedBox(width: 5),
                    Text(location, style: TextStyle(
                      fontSize: 15,
                      color: Color.fromARGB(255, 100, 100, 100),
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.attach_money, size: 22, color: Colors.green),
                    SizedBox(width: 5),
                    Flexible(
                      child: Text(
                        salary,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: false,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 100, 100, 100),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ViewPostPage(job: job)));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            child: Text(
              'View',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}