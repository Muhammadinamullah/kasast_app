import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kasast/components/empoloyer_mark_complete_card.dart';
import 'package:kasast/core/constants/app_constants.dart';
import 'package:kasast/ui/common/Reusable_widgets/reusable_appbar.dart';
import 'package:kasast/ui/common/Reusable_widgets/reusable_modal_sheet_button.dart';
import 'package:kasast/ui/common/ui_helpers.dart';

class MarkCompleteForEmployer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusedAppBar(title: "Job Details"),
      bottomSheet: Container(
        child: UiHelper.buttonBottom(
          context,
          Colors.lightBlue,
          Colors.white,
          "Confirm Completion",
          functionOnPressed: () {
            showConfirmationDialogue(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              children: [
                EmployerMarkCompleteCard(),
                Card(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Description',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 19),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                              'I need someone to work with me to unpack moving boxes in our new home'),
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
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
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

void showConfirmationDialogue(context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(16, 160, 16, 16),
        child: new Container(
          decoration: kModalSheetBoxDecoration,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    'Confirmation',
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Are you sure that this job is completed?',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: ModelSheetButton(
                      title: 'NO',
                      buttonColor: Colors.grey,
                      textColor: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      jobCompletedDialogue(context);
                    },
                    child: ModelSheetButton(
                      title: 'YES',
                      buttonColor: kPrimaryColor,
                      textColor: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}

void jobCompletedDialogue(context) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(16, 60, 16, 16),
        child: new Container(
          decoration: kModalSheetBoxDecoration,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Container(
                    height: 80,
                    width: 80,
                    child: Image.asset('assets/images/success.png'),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Congratulations!',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Theme.of(context).primaryColor),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Job completed successfully.',
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RoutePaths.EmployerJobsList);
                    },
                    child: ModelSheetButton(
                      title: 'DISMISS',
                      buttonColor: Colors.grey,
                      textColor: Colors.white,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      postFeedbackDialogue(context);
                    },
                    child: ModelSheetButton(
                      title: 'SUBMIT REVIEW',
                      buttonColor: kPrimaryColor,
                      textColor: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    },
  );
}

void postFeedbackDialogue(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return SingleChildScrollView(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: new Container(
          decoration: new BoxDecoration(
            color: Colors.white,
            borderRadius: new BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        'Submit Review',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      UiHelper.showRating(size: 25),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Job Feedback'),
                              SizedBox(
                                height: 2,
                              ),
                              Container(
                                height: 80,
                                child: TextField(
                                  maxLines: 5,
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                    hintText: 'Enter your feedback',
                                    hintStyle: TextStyle(fontSize: 12),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(3),
                                      ),
                                      borderSide:
                                          BorderSide(color: Colors.grey[600]),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(3),
                                      ),
                                      borderSide:
                                          BorderSide(color: Colors.grey[600]),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, RoutePaths.EmployerJobsList);
                        },
                        child: ModelSheetButton(
                          title: 'DISMISS',
                          buttonColor: Colors.grey,
                          textColor: Colors.white,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                              context, RoutePaths.EmployerJobsList);
                        },
                        child: ModelSheetButton(
                          title: 'YES',
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
        ),
      );
    },
  );
}
