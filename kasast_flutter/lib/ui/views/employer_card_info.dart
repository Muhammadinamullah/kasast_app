import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kasast/core/constants/app_constants.dart';
import 'package:kasast/ui/common/Reusable_widgets/reusable_appbar.dart';
import 'package:kasast/ui/common/ui_helpers.dart';

class EmployerCard extends StatefulWidget {
  @override
  EmployerCardState createState() => EmployerCardState();
}

class EmployerCardState extends State<EmployerCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: ReusedAppBar(
        title: 'Payment',
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
      body: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.only(top: 280), child: Text("No card added yet.")),
          Expanded(
            child: Align(
              alignment: Alignment(0, 1),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 60,
                // ignore: deprecated_member_use
                child: RaisedButton(
                  child: Text(
                    "UPDATE",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, RoutePaths.EmployerAddCard);
                  },
                  color: theme.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
