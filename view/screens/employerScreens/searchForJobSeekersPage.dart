import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/employerHomePageController.dart';
import '../../../controller/searchForJobSeekersController.dart';

class SearchForJobSeekersPage extends StatelessWidget {

  SearchForJobSeekersPage({super.key});
  final SearchForJobSeekersControllerImpl searchForJobSeekersControllerImpl = Get.put(SearchForJobSeekersControllerImpl());
  final EmployerHomePageControllerImpl employerHomePageControllerImpl =  Get.find<EmployerHomePageControllerImpl>();
  final List<Map<String, dynamic>> jobTypes = [
    {'title': 'Art & Design', 'icon': Icons.design_services},
    {'title': 'Finance', 'icon': Icons.money},
    {'title': 'Education','icon': Icons.school},
    {'title': 'Restaurant', 'icon': Icons.restaurant},
    {'title': 'Healthcare', 'icon': Icons.health_and_safety},
    {'title': 'Technology & IT', 'icon': Icons.computer},
    {'title': 'Marketing', 'icon': Icons.campaign},
    {'title': 'sales', 'icon': Icons.trending_up},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF6C00FF), Color(0xFF7F1CFF)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  SizedBox(width: 10),
                  Text("Search for Job Seekers",style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    Text("Search Filters",style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      searchForJobSeekersControllerImpl.goToFilters();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.deepPurple,
                      elevation: 3,
                      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: Icon(Icons.filter_list, size: 20),
                    label: Text("Filters",style:TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
                  ),
                ],
              ),
            ),
             Divider(height: 30, thickness: 1, indent: 20, endIndent: 20),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text("Available JobSeeker Types",style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
             SizedBox(height: 15),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                  itemCount: jobTypes.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 1.1,
                  ),
                  itemBuilder: (context, index) {
                    return Obx(() {
                      bool isSelected = (searchForJobSeekersControllerImpl.selectedIndex.value ?? -1) == index;
                      return GestureDetector(
                        onTap: () {
                          final field = searchForJobSeekersControllerImpl.encodeFieldName(jobTypes[index]['title']);
                          searchForJobSeekersControllerImpl.selectJobType(index, field);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSelected ? Colors.deepPurple : Colors.purple.shade100,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(jobTypes[index]['icon'],
                                  size: 40,
                                  color: isSelected ? Colors.white : Colors.deepPurple),
                              SizedBox(height: 8),
                              Text(
                                jobTypes[index]['title'],
                                style: TextStyle(
                                  color: isSelected ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
                  },
                ),
              ),
            )
          ],
        ),
      ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.deepPurple,
          shape: CircularNotchedRectangle(),
          notchMargin: 8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(iconSize: 30,
                  icon: Icon(Icons.person),
                  color: Colors.white,
                  onPressed: () {
                    employerHomePageControllerImpl.goToEmployerProfile();
                  }),
              IconButton(iconSize: 30,
                  icon: Icon(Icons.payment),
                  color: Colors.white,
                  onPressed: () {}
              ),
              IconButton(iconSize: 30,
                  icon: Icon(Icons.article),
                  color: Colors.white,
                  onPressed: () {
                    employerHomePageControllerImpl.getEmployerContracts();
                    employerHomePageControllerImpl.goToEmployerContracts();
                  }),
              IconButton(iconSize: 30,
                  icon: Icon(Icons.home),
                  color: Colors.white,
                  onPressed: () {
                    employerHomePageControllerImpl.goToEmployerHome();
                  }),
            ],
          ),
        )
    );
  }
}