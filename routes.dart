import 'package:get/get.dart';
import 'package:job_flix_application/core/middlewares/jobSeekerProfileMidddleWare.dart';
import 'package:job_flix_application/view/screens/auth/checkEmailVerificationCode.dart';
import 'package:job_flix_application/view/screens/auth/employerAuth/employerLogin.dart';
import 'package:job_flix_application/view/screens/auth/employerAuth/employerSignUp.dart';
import 'package:job_flix_application/view/screens/auth/forgetPassword.dart';
import 'package:job_flix_application/view/screens/auth/jobSeekerAuth/jobSeekerLogin.dart';
import 'package:job_flix_application/view/screens/auth/jobSeekerAuth/jobSeekerSignUp.dart';
import 'package:job_flix_application/view/screens/auth/resetPassword.dart';
import 'package:job_flix_application/view/screens/auth/resetPasswordVerifyCode.dart';
import 'package:job_flix_application/view/screens/employerScreens/createContract.dart';
import 'package:job_flix_application/view/screens/employerScreens/employerContractDetails.dart';
import 'package:job_flix_application/view/screens/employerScreens/employerContracts.dart';
import 'package:job_flix_application/view/screens/employerScreens/employerInterviewsPage.dart';
import 'package:job_flix_application/view/screens/employerScreens/jobSeekerFiltersPage.dart';
import 'package:job_flix_application/view/screens/employerScreens/jobSeekersByField.dart';
import 'package:job_flix_application/view/screens/employerScreens/payment.dart';
import 'package:job_flix_application/view/screens/employerScreens/scheduleAnInterview.dart';
import 'package:job_flix_application/view/screens/employerScreens/searchForJobSeekersPage.dart';
import 'package:job_flix_application/view/screens/employerScreens/employerHomePage.dart';
import 'package:job_flix_application/view/screens/employerScreens/employerPosts.dart';
import 'package:job_flix_application/view/screens/employerScreens/employerProfileInfoPage.dart';
import 'package:job_flix_application/view/screens/employerScreens/employerProfilePage.dart';
import 'package:job_flix_application/view/screens/employerScreens/employerProfileWelcomingPage.dart';
import 'package:job_flix_application/view/screens/employerScreens/jobApplications.dart';
import 'package:job_flix_application/view/screens/employerScreens/jobPostDetails.dart';
import 'package:job_flix_application/view/screens/employerScreens/noPostsPage.dart';
import 'package:job_flix_application/view/screens/employerScreens/pdfViewer.dart';
import 'package:job_flix_application/view/screens/employerScreens/postingJobs.dart';
import 'package:job_flix_application/view/screens/suspendPage.dart';
import 'package:job_flix_application/view/screens/employerScreens/uploadEmployerImagePage.dart';
import 'package:job_flix_application/view/screens/employerScreens/viewContractChanges.dart';
import 'package:job_flix_application/view/screens/employerScreens/viewJobSeekerProfile.dart';
import 'package:job_flix_application/view/screens/employerScreens/viewJobSeekersSearchResults.dart';
import 'package:job_flix_application/view/screens/employerScreens/viewPostDetails.dart';
import 'package:job_flix_application/view/screens/jobSeekerScreens/jobFiltersPage.dart';
import 'package:job_flix_application/view/screens/jobSeekerScreens/jobSeekerContractDetails.dart';
import 'package:job_flix_application/view/screens/jobSeekerScreens/jobSeekerContracts.dart';
import 'package:job_flix_application/view/screens/jobSeekerScreens/jobSeekerInterviewsPage.dart';
import 'package:job_flix_application/view/screens/jobSeekerScreens/requestContractChanges.dart';
import 'package:job_flix_application/view/screens/jobSeekerScreens/searchForJobsPage.dart';
import 'package:job_flix_application/view/screens/jobSeekerScreens/appliedJobs.dart';
import 'package:job_flix_application/view/screens/jobSeekerScreens/applyJobPage.dart';
import 'package:job_flix_application/view/screens/jobSeekerScreens/editJobSeekerProfilePage.dart';
import 'package:job_flix_application/view/screens/employerScreens/editEmployerProfilePage.dart';
import 'package:job_flix_application/view/screens/jobSeekerScreens/jobSeekerHomePage.dart';
import 'package:job_flix_application/view/screens/jobSeekerScreens/jobSeekerProfilePage.dart';
import 'package:job_flix_application/view/screens/jobSeekerScreens/jobSeekerProfileInfoPage.dart';
import 'package:job_flix_application/view/screens/jobSeekerScreens/jobSeekerProfileWelcomingPage.dart';
import 'package:job_flix_application/view/screens/jobSeekerScreens/jobsByFieldPage.dart';
import 'package:job_flix_application/view/screens/jobSeekerScreens/signContract.dart';
import 'package:job_flix_application/view/screens/jobSeekerScreens/uploadJobSeekerImagePage.dart';
import 'package:job_flix_application/view/screens/jobSeekerScreens/viewJobsSearchResults.dart';
import 'package:job_flix_application/view/screens/onBoardingscreen.dart';
import 'package:job_flix_application/view/screens/welcome.dart';
import 'controller/editEmployerProfileController.dart';
import 'controller/jobFiltersController.dart';
import 'core/constant/routesNames.dart';
import 'core/middlewares/employerProfileMiddleWare.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: AppRoutes.onBoardingScreen, page: () => OnBoardingScreen()),
  GetPage(name: AppRoutes.welcome, page: () => Welcome()),
  GetPage(name: AppRoutes.jobSeekerSignUp, page: () => JobSeekerSignUp()),
  GetPage(name: AppRoutes.jobSeekerLogin, page: () => JobSeekerLogin()),
  GetPage(name: AppRoutes.employerSignUp, page: () => EmployerSignUp()),
  GetPage(name: AppRoutes.employerLogin, page: () => EmployerLogin()),
  GetPage(name: AppRoutes.checkEmailVerificationCode, page: () => CheckEmailVerificationCode()),
  //GetPage(name: AppRoutes.forgotPassword, page: () => ForgetPassword()),
  GetPage(name: AppRoutes.resetPasswordVerifyCode, page: () => ResetPasswordVerificationCode()),
  GetPage(name: AppRoutes.resetPassword, page: () => ResetPassword()),
  GetPage(name: AppRoutes.jobSeekerHomePage, page: () => JobSeekerHomePage()),
  GetPage(name: AppRoutes.employerHomePage, page: () => EmployerHomePage()),
  GetPage(name: AppRoutes.postingJobs, page: () => PostingJobs()),
  GetPage(name: AppRoutes.jobPostDetails, page: () => JobPostDetails()),
  GetPage(name: AppRoutes.searchForJobSeekers, page: () => SearchForJobSeekersPage()),
  GetPage(name: AppRoutes.searchForJobs, page: () => SearchForJobsPage()),
  GetPage(name: AppRoutes.jobFiltersScreen, page: () => JobFiltersPage()),
  GetPage(name: AppRoutes.jobSeekerFiltersScreen, page: () => JobSeekerFiltersPage()),
  GetPage(name: AppRoutes.jobSeekerProfileWelcomingPage, page: () => JobSeekerProfileWelcomingPage(),middlewares: [JobSeekerProfileMiddleWare()]),
  GetPage(name: AppRoutes.employerProfileWelcomingPage, page: () => EmployerProfileWelcomingPage(),middlewares: [EmployerProfileMiddleWare()]),
  GetPage(name: AppRoutes.uploadJobSeekerImagePage, page: () => UploadImagePage()),
  GetPage(name: AppRoutes.uploadEmployerImagePage, page: () => UploadEmployerImagePage()),
  GetPage(name: AppRoutes.jobSeekerProfileInfoPage, page: () => JobSeekerProfileInfoPage()),
  GetPage(name: AppRoutes.employerProfileInfoPage, page: () => EmployerProfileInfoPage()),
  GetPage(name: AppRoutes.jobSeekerProfilePage, page: () => JobSeekerProfilePage()),
  GetPage(name: AppRoutes.employerProfilePage, page: () => EmployerProfilePage()),
  GetPage(name: AppRoutes.editJobSeekerProfilePage, page: () => EditJobSeekerProfilePage()),
  GetPage(name: AppRoutes.editEmployerProfilePage, page: () => EditEmployerProfile()),
  GetPage(name: AppRoutes.employerPosts, page: () => EmployerPosts()),
  GetPage(name: AppRoutes.noPostsPage, page: () => NoPostsPage()),
  GetPage(name: AppRoutes.applyJobPage, page: () => ApplyJobPage()),
  GetPage(name: AppRoutes.appliedJobs, page: () => AppliedJobs()),
  GetPage(name: AppRoutes.jobApplications, page: () => JobApplications()),
  GetPage(name: AppRoutes.viewJobSeekerProfile, page: () => ViewJobSeekerProfile()),
  GetPage(name: AppRoutes.jobsByField, page: () => JobsByFieldPage()),
  GetPage(name: AppRoutes.jobSeekersByField, page: () => JobSeekersByFieldPage()),
  GetPage(name: AppRoutes.viewJobsSearchResults, page: () => ViewJobsSearchResults()),
  GetPage(name: AppRoutes.viewJobSeekersSearchResults, page: () => ViewJobSeekersSearchResults()),
  GetPage(name: AppRoutes.employerInterviews, page: () => EmployerInterviewsPage()),
  GetPage(name: AppRoutes.jobSeekerInterviews, page: () => JobSeekerInterviewsPage()),
  GetPage(name: AppRoutes.payment, page: () => Payment()),
  GetPage(name: AppRoutes.contract, page: () => CreateContractPage()),
  GetPage(name: AppRoutes.employerContracts, page: () => EmployerContracts()),
  GetPage(name: AppRoutes.employerContractDetails, page: () => EmployerContractDetails()),
  GetPage(name: AppRoutes.jobSeekerContracts, page: () => JobSeekerContracts()),
  GetPage(name: AppRoutes.jobSeekerContractDetails, page: () => JobSeekerContractDetails()),
  GetPage(name: AppRoutes.signContract, page: () => SignContractPage()),
  GetPage(name: AppRoutes.requestContractChanges, page: () => RequestContractChanges()),
  GetPage(name: AppRoutes.viewContractChanges, page: () => ViewContractChanges()),
  GetPage(name: AppRoutes.viewPostDetails, page: () => ViewPostDetails()),
  GetPage(name: AppRoutes.forgetPassword, page: () => ForgetPassword()),
  GetPage(name: AppRoutes.suspendPage, page: () => SuspendPage())
];