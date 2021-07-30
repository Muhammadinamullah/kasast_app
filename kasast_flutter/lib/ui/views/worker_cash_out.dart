import 'package:flutter/material.dart';
import 'package:kasast/core/constants/app_constants.dart';
import 'package:kasast/ui/common/Reusable_widgets/reusable_appbar.dart';
import 'package:kasast/ui/common/Reusable_widgets/reusable_cash_out_label.dart';
import 'package:kasast/ui/common/ui_helpers.dart';

class WorkerCashOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ReusedAppBar(
          title: 'Cash Out',
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
        bottomSheet: Container(
          child: UiHelper.buttonBottom(
            context,
            kPrimaryColor,
            Colors.white,
            "ADD PAYMENT OPTION",
            functionOnPressed: () {
              //showConfirmationDialogue(context);
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Center(
            child: Container(
              child: Column(
                children: [
                  ReusableCashOutLabels(
                    balance: r'$589.00',
                    description: 'Available Balance',
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ReusableCashOutLabels(
                    balance: r'$1093.00',
                    description: 'Pending Balance',
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
