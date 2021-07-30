import 'package:flutter/material.dart';
import 'package:kasast/components/employee_notifications_card.dart';
import 'package:kasast/core/constants/app_constants.dart';
import 'package:kasast/ui/common/Reusable_widgets/reusable_appbar.dart';
import 'package:kasast/ui/common/ui_helpers.dart';

class NotificationsEmployee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusedAppBar(
        title: 'Notifications',
      ),
      drawer: UiHelper.employeeDrawer(
        profileOnPressed: () => Navigator.pushReplacementNamed(context, RoutePaths.WorkerProfile),
        notificationsOnPressed: () => Navigator.pushReplacementNamed(context, RoutePaths.NotificationsEmployee),
        findNewJobsOnpressed: () => Navigator.pushReplacementNamed(context, RoutePaths.Tasks),
        paymentsOnPressed: () => Navigator.pushReplacementNamed(context, RoutePaths.WorkerPaymentBalance),
        upcomingJobsOnPressed: () => Navigator.pushReplacementNamed(context, RoutePaths.EmployeeUpcomingJobs),
        pastJobsOnPressed: () => Navigator.pushReplacementNamed(context, RoutePaths.EmployeePastJobs),
        cashOutOnPressed: () => Navigator.pushReplacementNamed(context, RoutePaths.WorkerCashOut),
        logoutOnPressed: () => Navigator.pushReplacementNamed(context, RoutePaths.Login),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: EmployeeNotificationsCard(),
          )
        ],
      ),
    );
  }
}
