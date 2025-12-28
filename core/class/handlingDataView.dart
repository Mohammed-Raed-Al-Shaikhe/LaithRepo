import 'package:flutter/material.dart';
import 'package:job_flix_application/core/class/requestStatus.dart';

class HandlingDataView extends StatelessWidget {
  final RequestStatus requestStatus ;
  final Widget widget ;
  const HandlingDataView({super.key, required this.requestStatus, required this.widget});

  @override
  Widget build(BuildContext context) {

    return (requestStatus == RequestStatus.offlineFailure) ? Center(child: Text("Offline Failure")) :
    (requestStatus == RequestStatus.serverFailure) ? Center(child: Text("Server Failure")) :
    (requestStatus == RequestStatus.failure) ? Center(child: Text("No Data")) : widget ;
  }
}
