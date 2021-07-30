import 'package:flutter/material.dart';
import 'package:kasast/components/employee_upcoming_jobs_card.dart';
import 'package:kasast/core/constants/app_constants.dart';
import 'package:kasast/ui/common/Reusable_widgets/reusable_appbar.dart';
import 'package:kasast/ui/common/ui_helpers.dart';

class EmployeeUpcomingJobs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusedAppBar(
        title: 'Upcoming Jobs',
      ),
      drawer: UiHelper.employeeDrawer(
        profileOnPressed: () =>
            Navigator.pushReplacementNamed(context, RoutePaths.WorkerProfile),
        notificationsOnPressed: () => Navigator.pushReplacementNamed(
            context, RoutePaths.NotificationsEmployee),
        findNewJobsOnpressed: () =>
            Navigator.pushReplacementNamed(context, RoutePaths.Tasks),
        paymentsOnPressed: () => Navigator.pushReplacementNamed(
            context, RoutePaths.WorkerPaymentBalance),
        upcomingJobsOnPressed: () => Navigator.pushReplacementNamed(
            context, RoutePaths.EmployeeUpcomingJobs),
        pastJobsOnPressed: () => Navigator.pushReplacementNamed(
            context, RoutePaths.EmployeePastJobs),
        cashOutOnPressed: () =>
            Navigator.pushReplacementNamed(context, RoutePaths.WorkerCashOut),
        logoutOnPressed: () =>
            Navigator.pushReplacementNamed(context, RoutePaths.Login),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              child: ListView(
                children: [
                  EmployeeUpcomingJobsCard(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
