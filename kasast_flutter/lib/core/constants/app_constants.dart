import 'package:flutter/material.dart';

class RoutePaths {
  static const String AccountType = '/account_type';
  static const String EditProfile = '/edit_profile';
  static const String EmailConfirmation = '/email_confirmation';
  static const String EmployerCard = '/employer_card';
  static const String EmployerJobsList = '/employer_jobs_list';
  static const String EmployerJobs = '/employer_jobs';
  static const String EmployerProfile = '/employer_profile';
  static const String ForgotPassword = '/forgot_password';
  static const String JobPostDetail = '/job_post_details';
  static const String Login = '/login';
  static const String Register = '/register';
  static const String Notifications = '/notifications';
  static const String UpcomingJobs = '/upcoming_jobs';
  static const String PastJobs = '/past_jobs';
  static const String EmployerAddCard = '/employer_add_card';
  static const String MarkCompleteForEmployer = '/employer_mark_complete';
  static const String ResetPassword = '/reset_password';
  //employee
  static const String Tasks = '/tasks';
  static const String TaskDetail = '/task_detail';
  static const String WorkerPaymentBalance = '/worker_payment_balance';
  static const String WorkerAddCard = '/worker_add_card';
  static const String WorkerAddBank = '/worker_add_bank';
  static const String WorkerProfile = '/worker_profile';
  static const String WorkerCashOut = '/worker_cash_out';
  static const String NotificationsEmployee = '/notifications_employee';
  static const String EmployeeMarkComplete = '/employee_mark_complete';
  static const String EmployeeUpcomingJobs = '/employee_upcoming_jobs';
  static const String EmployeePastJobs = '/employee_past_jobs';
  static const String SearchPlace = '/search_place';
}

final kPrimaryColor = Colors.lightBlue;
final kCardLightgreyColor = Colors.grey[600];

//Shapes
final kAppbarShape = RoundedRectangleBorder(
  borderRadius: BorderRadius.vertical(
    bottom: Radius.circular(15),
  ),
);
final kCardShapes = RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(15), // if you need this
  side: BorderSide(
    color: Colors.grey.withOpacity(.2),
    width: 1,
  ),
);
final kCardTopHeadingStyle =
    TextStyle(fontWeight: FontWeight.w700, fontSize: 15);
final kCardSubHeadingStyle = TextStyle(color: Colors.grey[600]);

//style
final kAppbarTextStyle = TextStyle(fontSize: 20, color: Colors.white);
final kPriceTagCardStyle =
    TextStyle(color: kPrimaryColor, fontSize: 22, fontWeight: FontWeight.bold);
final kPriceTagHourStyle = TextStyle(
  color: Colors.grey,
  fontSize: 10,
);
//divider in the card
final kCardDivider = Divider(
  color: Colors.black,
  thickness: .2,
  indent: 8,
  endIndent: 8,
);

//decoration
final kModalSheetBoxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: new BorderRadius.all(
    Radius.circular(20),
  ),
);
