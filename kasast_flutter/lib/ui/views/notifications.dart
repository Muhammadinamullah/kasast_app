import 'package:flutter/material.dart';
import 'package:kasast/components/notifications_card.dart';
import 'package:kasast/core/constants/app_constants.dart';
import 'package:kasast/ui/common/Reusable_widgets/reusable_appbar.dart';
import 'package:kasast/ui/common/ui_helpers.dart';

import '../../core/constants/app_constants.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusedAppBar(
        title: 'Notifications',
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: NotificationsCard(),
          )
        ],
      ),
    );
  }
}
