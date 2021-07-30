// import 'package:flutter/material.dart';
// import 'package:kasast/ui/views/login.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: Login(),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Login(),
//       // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:kasast/ui/views/account_type.dart';
import 'package:kasast/ui/views/edit_profile.dart';
import 'package:kasast/ui/views/email_confirmation.dart';
import 'package:kasast/ui/views/employee_mark_complete.dart';
import 'package:kasast/ui/views/employee_past_jobs.dart';
import 'package:kasast/ui/views/employee_upcoming_jobs.dart';
import 'package:kasast/ui/views/employer_add_card.dart';
import 'package:kasast/ui/views/employer_card_info.dart';
import 'package:kasast/ui/views/employer_job_list.dart';
import 'package:kasast/ui/views/employer_profile.dart';
import 'package:kasast/ui/views/forgot_password.dart';
import 'package:kasast/ui/views/job_post_detail.dart';
import 'package:kasast/ui/views/login.dart';
import 'package:kasast/ui/views/mark_complete_for_employer.dart';
import 'package:kasast/ui/views/notifications.dart';
import 'package:kasast/ui/views/past_jobs.dart';
import 'package:kasast/ui/views/register.dart';
import 'package:kasast/ui/views/reset_password.dart';
import 'package:kasast/ui/views/task_detail.dart';
import 'package:kasast/ui/views/tasks.dart';
import 'package:kasast/ui/views/upcoming_jobs.dart';
import 'package:kasast/ui/views/worker_add_bank.dart';

import 'core/constants/app_constants.dart';
import 'ui/views/notifications_employee.dart';
import 'ui/views/worker_add_card.dart';
import 'ui/views/worker_cash_out.dart';
import 'ui/views/worker_payment_balance.dart';
import 'ui/views/worker_profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.lightBlue,
        scaffoldBackgroundColor: Colors.grey[100],
        canvasColor: Colors.transparent,
        accentColor: kPrimaryColor,
      ),
      initialRoute: RoutePaths.Login,
      routes: {
        '/account_type': (context) => AccountType(),
        '/edit_profile': (context) => EditProfile(),
        '/email_confirmation': (context) => EmailConfirmation(),
        //employer
        '/employer_card': (context) => EmployerCard(),
        '/employer_jobs_list': (context) => EmployerJobsList(),
        '/employer_profile': (context) => EmployerProfile(),
        '/forgot_password': (context) => ForgotPassword(),
        '/job_post_details': (context) => JobPostDetail(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/notifications': (context) => Notifications(),
        '/upcoming_jobs': (context) => UpcomingJobs(),
        '/past_jobs': (context) => PastJobs(),
        '/employer_add_card': (context) => EmployerAddCard(),
        '/employer_mark_complete': (context) => MarkCompleteForEmployer(),
        '/reset_password': (context) => ResetPassword(),
        //employee
        '/tasks': (context) => Tasks(),
        '/task_detail': (context) => TaskDetail(),
        '/worker_payment_balance': (context) => WorkerPaymentBalance(),
        '/worker_add_card': (context) => WorkerAddCard(),
        '/worker_add_bank': (context) => WorkerAddBank(),
        '/worker_profile': (context) => WorkerProfile(),
        '/worker_cash_out': (context) => WorkerCashOut(),
        '/notifications_employee': (context) => NotificationsEmployee(),
        '/employee_mark_complete': (context) => EmployeeMarkComplete(),
        '/employee_upcoming_jobs': (context) => EmployeeUpcomingJobs(),
        '/employee_past_jobs': (context) => EmployeePastJobs(),
      },
    );
  }
}
