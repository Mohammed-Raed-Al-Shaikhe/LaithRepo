import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:job_flix_application/controller/jobSeekerHomePageController.dart';
import 'package:job_flix_application/core/class/crud.dart';
import 'package:job_flix_application/routes.dart';
import 'package:job_flix_application/stripePayment/stripeKeys.dart';
import 'package:job_flix_application/view/screens/splashScreen.dart';
import 'bindings/initialBindings.dart';
import 'controller/employerHomePageController.dart';
import 'core/services/myService.dart';

void main() async{
  Stripe.publishableKey = ApiKeys.stripePublishableKey;
  // await Stripe.instance.applySettings();
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  Get.put(Crud());
  Get.put(JobSeekerHomePageControllerImpl(),permanent: true);
  Get.put(EmployerHomePageControllerImpl(),permanent: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBindings(),
      home: SplashScreen(),
      getPages: routes,
    );
  }
}