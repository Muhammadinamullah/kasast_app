import 'package:flutter/material.dart';
import 'package:kasast/components/past_jobs_card.dart';
import 'package:kasast/core/constants/app_constants.dart';
import 'package:kasast/ui/common/Reusable_widgets/reusable_appbar.dart';
import 'package:kasast/ui/common/ui_helpers.dart';

class PastJobs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.red,
      drawer: UiHelper.employerDrawer(
        paymentsOnPressed: () => Navigator.pushReplacementNamed(context, RoutePaths.EmployerCard),
        notificationsOnPressed: () => Navigator.pushReplacementNamed(context, RoutePaths.Notifications),
        upcomingJobsOnPressed: () => Navigator.pushReplacementNamed(context, RoutePaths.UpcomingJobs),
        pastJobsOnPressed: () => Navigator.pushReplacementNamed(context, RoutePaths.PastJobs),
        postNewJobsOnpressed: () => Navigator.pushReplacementNamed(context, RoutePaths.JobPostDetail),
        logoutOnPressed: () => Navigator.pushReplacementNamed(context, RoutePaths.Login),
        profileOnPressed: () => Navigator.pushReplacementNamed(context, RoutePaths.EmployerProfile),
      ),
      appBar: ReusedAppBar(
        title: "Past Jobs",
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              child: ListView(
                children: [
                  PastJobsCard(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
