import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kasast/components/employee_mark_complete_card.dart';
import 'package:kasast/core/constants/app_constants.dart';
import 'package:kasast/ui/common/Reusable_widgets/reusable_appbar.dart';
import 'package:kasast/ui/common/ui_helpers.dart';

class EmployeeMarkComplete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusedAppBar(title: "Job Details"),
      bottomSheet: Container(
        child: UiHelper.buttonBottom(
          context,
          Colors.lightBlue,
          Colors.white,
          "MARK COMPLETE",
          functionOnPressed: () {
            Navigator.pushNamed(context, RoutePaths.MarkCompleteForEmployer);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              children: [
                EmployeeMarkCompleteCard(),
                Card(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Description',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text('I need someone to work with me to unpack moving boxes in our new home'),
                          Text('\nThanks'),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  child: Container(
                    height: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
                          child: Text(
                            'Map',
                            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                        ),
                        Expanded(
                          child: GoogleMap(
                            initialCameraPosition: CameraPosition(
                              target: LatLng(22, 23.0),
                              zoom: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
