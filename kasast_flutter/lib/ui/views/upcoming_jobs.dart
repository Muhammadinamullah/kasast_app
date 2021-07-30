import 'package:flutter/material.dart';
import 'package:kasast/business%20logic/models/employer_upcoming_jobs.dart';
import 'package:kasast/business%20logic/view_models/employer_upcoming_jobs.dart';
import 'package:kasast/components/employer_job_list_card.dart';
import 'package:kasast/components/upcoming_jobs_card.dart';
import 'package:kasast/core/constants/app_constants.dart';
import 'package:kasast/ui/common/Reusable_widgets/reusable_appbar.dart';
import 'package:kasast/ui/common/ui_helpers.dart';

class UpcomingJobs extends StatefulWidget {
  @override
  _UpcomingJobsState createState() => _UpcomingJobsState();
}

class _UpcomingJobsState extends State<UpcomingJobs> {
  List<dynamic> upComingJobsList;
  @override
  void initState() {
    super.initState();
    EmployerUpcomingJobsViewModel().getUpcomingJobs().then((value) {
      setState(() {
        upComingJobsList = value;
        print('list data');
        print(upComingJobsList);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusedAppBar(
        title: 'Upcoming Jobs',
      ),
      drawer: UiHelper.employerDrawer(
        paymentsOnPressed: () =>
            Navigator.pushReplacementNamed(context, RoutePaths.EmployerCard),
        notificationsOnPressed: () =>
            Navigator.pushReplacementNamed(context, RoutePaths.Notifications),
        upcomingJobsOnPressed: () =>
            Navigator.pushReplacementNamed(context, RoutePaths.UpcomingJobs),
        pastJobsOnPressed: () =>
            Navigator.pushReplacementNamed(context, RoutePaths.PastJobs),
        postNewJobsOnpressed: () =>
            Navigator.pushReplacementNamed(context, RoutePaths.JobPostDetail),
        logoutOnPressed: () =>
            Navigator.pushReplacementNamed(context, RoutePaths.Login),
        profileOnPressed: () =>
            Navigator.pushReplacementNamed(context, RoutePaths.EmployerProfile),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              child: ListView(
                children: [
                  EmployerJobListCard(),
                  upComingJobsList == null
                      ? CircularProgressIndicator()
                      : ListView.builder(
                          itemCount: upComingJobsList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return UpcomingJobsCard();
                          },
                        ),
                  // RaisedButton(
                  //   child: Text('show list'),
                  //   onPressed: () =>
                  //       EmployerUpcomingJobsViewModel().getFutureJobs(),
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
