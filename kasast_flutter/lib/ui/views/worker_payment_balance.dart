import 'package:flutter/material.dart';
import 'package:kasast/core/constants/app_constants.dart';
import 'package:kasast/ui/common/Reusable_widgets/reusable_appbar.dart';
import 'package:kasast/ui/common/ui_helpers.dart';

class WorkerPaymentBalance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusedAppBar(
        title: 'Payment Information',
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
      bottomSheet: Row(
        children: [
          Expanded(
            child: Container(
              //width: MediaQuery.of(context).size.width,
              height: 60,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                  ),
                ),
                child: Center(
                  child: Text(
                    'ADD BANK ACCOUNT',
                    style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600, fontFamily: "Avenir"),
                  ),
                ),
                color: Colors.grey,
                onPressed: () {
                  Navigator.pushNamed(context, RoutePaths.WorkerAddBank);
                },
              ),
            ),
          ),
          Expanded(
            child: Container(
              //width: MediaQuery.of(context).size.width,
              height: 60,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Text(
                  'ADD DEBIT CARD',
                  style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600, fontFamily: "Avenir"),
                ),
                color: kPrimaryColor,
                onPressed: () {
                  Navigator.pushNamed(context, RoutePaths.WorkerAddCard);
                },
              ),
            ),
          ),
        ],
      ),
      body: Center(child: Text("No card added yet.")),
    );
  }
}
