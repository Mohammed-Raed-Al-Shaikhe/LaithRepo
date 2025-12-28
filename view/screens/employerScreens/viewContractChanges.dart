import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewContractChanges extends StatelessWidget {
  const ViewContractChanges({super.key});

  @override
  Widget build(BuildContext context) {
    final Map args = Get.arguments;
    final String changes = args["changes"] ?? "No changes provided";

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text("Requested Changes",style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.deepOrangeAccent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.deepOrangeAccent.withOpacity(0.15),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Icon(Icons.warning_amber_rounded,
                      color: Colors.deepOrangeAccent, size: 28),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text("The job seeker has requested the following changes to the contract.",style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.edit_document,color: Colors.deepOrangeAccent),
                            SizedBox(width: 8),
                            Text("Requested Changes",style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Divider(height: 30),
                        Text(changes,style: TextStyle(
                            fontSize: 16,
                            height: 1.6,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}