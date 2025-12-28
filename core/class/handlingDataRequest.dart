import 'package:flutter/material.dart';
import 'package:job_flix_application/core/class/requestStatus.dart';

class HandlingDataRequest extends StatelessWidget {
  final RequestStatus requestStatus ;
  final Widget widget ;
  const HandlingDataRequest({super.key, required this.requestStatus, required this.widget});

  @override
  Widget build(BuildContext context) {

    return (requestStatus == RequestStatus.offlineFailure) ? Center(child: Text("Offline Failure")) :
    (requestStatus == RequestStatus.serverFailure) ? Center(child: Text("Server Failure")) :
    widget ;
  }
}
