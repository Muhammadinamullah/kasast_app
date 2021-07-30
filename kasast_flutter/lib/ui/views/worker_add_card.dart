import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kasast/core/constants/app_constants.dart';
import 'package:kasast/ui/common/Reusable_widgets/reusable_appbar.dart';
import 'package:kasast/ui/common/ui_helpers.dart';

class WorkerAddCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusedAppBar(
        title: 'Card Information',
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
            height: 30,
          ),
          Container(
            height: 180,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(border: Border.all(color: Colors.grey), color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [Container(width: 50, child: Image.asset("assets/images/credit.png"))],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  suffixIcon: Icon(
                                    Icons.photo_camera,
                                    size: 35,
                                  ),
                                  border: UnderlineInputBorder(),
                                  labelText: 'Credit card number',
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'MM/YY',
                                ),
                              ),
                            ),
                            Container(
                              height: 40,
                              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                            ),
                            Expanded(
                              child: TextFormField(
                                decoration: InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: '  CVV',
                                ),
                              ),
                            )
                          ],
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              labelText: 'Card NickName',
                            ),
                          ),
                        )
                      ],
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
                  "Default Card",
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
