import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kasast/business%20logic/models/created_jobs.dart';
import 'package:kasast/business%20logic/view_models/employer_job_list_viewmodel.dart';
import 'package:kasast/components/employer_job_list_card.dart';
import 'package:kasast/components/no_job_created.dart';
import 'package:kasast/core/constants/app_constants.dart';
import 'package:kasast/ui/common/Reusable_widgets/reusable_appbar.dart';
import 'package:kasast/ui/common/ui_helpers.dart';

class EmployerJobsList extends StatefulWidget {
  @override
  EmployerJobsListState createState() => EmployerJobsListState();
}

class EmployerJobsListState extends State<EmployerJobsList> {
  @override
  void initState() {
    super.initState();
    // print('print init state implemented');
  }

  @override
  Widget build(BuildContext context) {
    // print('Build is running');
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: ReusedAppBar(
        title: 'My Jobs',
      ),
      drawer: UiHelper.employerDrawer(
        paymentsOnPressed: () {
          Navigator.pushNamed(context, RoutePaths.EmployerCard);
          print('employer card');
        },
        notificationsOnPressed: () =>
            Navigator.pushNamed(context, RoutePaths.Notifications),
        upcomingJobsOnPressed: () {
          Navigator.pushNamed(context, RoutePaths.UpcomingJobs);
          print('upcomingjob');
        },
        pastJobsOnPressed: () =>
            Navigator.pushNamed(context, RoutePaths.PastJobs),
        postNewJobsOnpressed: () =>
            Navigator.pushNamed(context, RoutePaths.JobPostDetail),
        logoutOnPressed: () => Navigator.pushNamed(context, RoutePaths.Login),
        profileOnPressed: () {
          Navigator.pushNamed(context, RoutePaths.EmployerProfile);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.pushNamed(context, RoutePaths.JobPostDetail);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        //backgroundColor: Colors.green,
      ),
      body: FutureBuilder<List<Jobs>>(
        future: EmployerJobListViewModel().getJobs(),
        builder: (BuildContext context, AsyncSnapshot<List<Jobs>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              if (snapshot.hasError) {
                return NoJobCreatedWidget();
              } else {
                return (ListView(
                  children: snapshot.data
                      .map(
                        (jobsInstance) =>
                            EmployerJobListCard(jobs: jobsInstance),
                      )
                      .toList(),
                ));
              }
          }
        },
      ),
    );
  }
}
//EmployerJobListCard()
