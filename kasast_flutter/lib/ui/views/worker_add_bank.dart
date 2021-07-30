import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kasast/core/constants/app_constants.dart';
import 'package:kasast/ui/common/Reusable_widgets/reusable_appbar.dart';
import 'package:kasast/ui/common/ui_helpers.dart';

class WorkerAddBank extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusedAppBar(
        title: 'Bank Information',
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
      body: SingleChildScrollView(
        child: _buildCardInfo(context),
      ),
      bottomSheet: Container(
        child: UiHelper.buttonBottom(context, Colors.lightBlue, Colors.white, "SUBMIT", functionOnPressed: () {
          Navigator.pushNamed(context, RoutePaths.WorkerPaymentBalance);
        }),
      ),
    );
  }

  Container _buildCardInfo(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(border: Border.all(color: Colors.grey), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                            border: UnderlineInputBorder(),
                            labelText: 'Account Holder Name',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                        border: UnderlineInputBorder(),
                        labelText: 'Routing Number',
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                        border: UnderlineInputBorder(),
                        labelText: 'Account Number',
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        labelText: 'Confirm Account Number',
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Default Account",
                  style: TextStyle(fontSize: 17),
                ),
                CupertinoSwitch(
                  value: true,
                  onChanged: (value) {},
                  activeColor: Theme.of(context).primaryColor,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
