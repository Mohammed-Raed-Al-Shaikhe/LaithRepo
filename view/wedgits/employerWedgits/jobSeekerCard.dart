import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/routesNames.dart';

class JobSeekerCard extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String position;
  final String location;
  final String image;
  final Map<String,dynamic> seeker;
  const JobSeekerCard({super.key,required this.firstName,required this.lastName, required this.position, required this.location, required this.image, required this.seeker});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
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
              //backgroundImage: Image.asset('images/company.png',fit: BoxFit.cover).image,
              radius: 28,
            ),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Text("$firstName $lastName",style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                    overflow: TextOverflow.ellipsis,
                  ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.business_center,size: 20,color: Color.fromARGB(255, 100, 100, 100),),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(position, style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 100, 100, 100),
                      ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Icon(Icons.location_on,size: 20,color: Color.fromARGB(255, 100, 100, 100),),
                    SizedBox(width: 5),
                    Expanded(
                      child: Text(location, style: TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 100, 100, 100),
                        fontWeight: FontWeight.bold,
                      ),
                        overflow: TextOverflow.ellipsis,
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
              Get.toNamed(AppRoutes.viewJobSeekerProfile,arguments: seeker);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            child: Text('View Profile',
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
