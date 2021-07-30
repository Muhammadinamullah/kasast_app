import 'package:flutter/material.dart';
import 'package:kasast/components/tasks_card.dart';
import 'package:kasast/core/constants/app_constants.dart';
import 'package:kasast/ui/common/Reusable_widgets/reusable_modal_sheet_button.dart';
import 'package:kasast/ui/common/ui_helpers.dart';

class Tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: UiHelper.employeeDrawer(
        profileOnPressed: () => Navigator.pushNamed(context, RoutePaths.WorkerProfile),
        notificationsOnPressed: () => Navigator.pushNamed(context, RoutePaths.NotificationsEmployee),
        findNewJobsOnpressed: () => Navigator.pushNamed(context, RoutePaths.Tasks),
        paymentsOnPressed: () => Navigator.pushNamed(context, RoutePaths.WorkerPaymentBalance),
        upcomingJobsOnPressed: () => Navigator.pushNamed(context, RoutePaths.EmployeeUpcomingJobs),
        pastJobsOnPressed: () => Navigator.pushNamed(context, RoutePaths.EmployeePastJobs),
        cashOutOnPressed: () => Navigator.pushNamed(context, RoutePaths.WorkerCashOut),
        logoutOnPressed: () => Navigator.pushReplacementNamed(context, RoutePaths.Login),
      ),
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.lightBlue,
        title: Text(
          'Browse Tasks',
          style: kAppbarTextStyle,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildSearchBar(context),
              InkWell(
                onTap: () => Navigator.pushNamed(context, RoutePaths.TaskDetail),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 2,
                  child: ListView(
                    children: [
                      TasksCard(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Container buildSearchBar(context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 0, 15, 15),
        child: Container(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: 18,
                        ),
                        hintText: 'Enter search term...',
                        hintStyle: TextStyle(fontSize: 15, color: Colors.white)),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {
                  showFilterModalSheet(context);
                },
                child: Container(
                  child: Icon(
                    Icons.tune,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void showFilterModalSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 70, 16, 16),
          child: Container(
            decoration: kModalSheetBoxDecoration,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Filter Search Results',
                    style: TextStyle(fontSize: 24, color: kPrimaryColor, fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Distance'),
                      Text(
                        '50KM',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  Slider(
                    min: 0,
                    max: 80,
                    value: 50,
                    onChanged: (value) {},
                  ),
                  Row(
                    children: [
                      Text(
                        'Price per hour',
                      ),
                    ],
                  ),
                  Text(
                    r'25$ to 80$',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                  RangeSlider(
                    max: 150,
                    min: 0,
                    values: RangeValues(25, 80),
                    onChanged: (value) {},
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: ModelSheetButton(
                          title: 'CANCEL',
                          buttonColor: Colors.grey,
                          textColor: Colors.white,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: ModelSheetButton(
                          title: 'APPLY',
                          buttonColor: kPrimaryColor,
                          textColor: Colors.white,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
