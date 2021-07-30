import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kasast/core/constants/app_constants.dart';
import 'package:kasast/ui/common/Reusable_widgets/reusable_appbar.dart';
import 'package:kasast/ui/common/ui_helpers.dart';

class EmployerAddCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusedAppBar(
        title: 'My Card',
      ),
      drawer: UiHelper.employerDrawer(
        paymentsOnPressed: () => Navigator.pushReplacementNamed(context, RoutePaths.EmployerCard),
        notificationsOnPressed: () => Navigator.pushReplacementNamed(context, RoutePaths.Notifications),
        upcomingJobsOnPressed: () => Navigator.pushReplacementNamed(context, RoutePaths.UpcomingJobs),
        pastJobsOnPressed: () => Navigator.pushReplacementNamed(context, RoutePaths.PastJobs),
        postNewJobsOnpressed: () => Navigator.pushReplacementNamed(context, RoutePaths.JobPostDetail),
        logoutOnPressed: () => Navigator.pushReplacementNamed(context, RoutePaths.Login),
        profileOnPressed: () => Navigator.pushReplacementNamed(context, RoutePaths.EmployerProfile),
      ),
      body: SingleChildScrollView(
        child: _buildCardInfo(context),
      ),
      bottomSheet: Container(
        child: UiHelper.buttonBottom(context, Colors.lightBlue, Colors.white, "Submit", functionOnPressed: () {
          Navigator.pushReplacementNamed(context, RoutePaths.EmployerCard);
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
            height: MediaQuery.of(context).size.height / 3,
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
                              border: UnderlineInputBorder(),
                              labelText: 'Zip Code',
                            ),
                          ),
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
