import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:kasast/components/TaskDetailTopCard.dart';
import 'package:kasast/components/task_detail_bottom_card.dart';
import 'package:kasast/core/constants/app_constants.dart';
import 'package:kasast/ui/common/Reusable_widgets/reusable_appbar.dart';
import 'package:kasast/ui/common/Reusable_widgets/reusable_modal_sheet_button.dart';
import 'package:kasast/ui/common/ui_helpers.dart';

class TaskDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ReusedAppBar(title: "Task Details"),
      bottomSheet: Container(
        child: UiHelper.buttonBottom(
          context,
          Colors.lightBlue,
          Colors.white,
          "MAKE OFFER",
          functionOnPressed: () {
            showMakeOfferDialogue(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 60),
            child: Column(
              children: [
                TaskDetailTopCard(),
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
                Card(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
                            child: Text(
                              'Offers(3)',
                              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                            ),
                          ),
                          TaskDetailBottomCard(),
                          TaskDetailBottomCard(),
                        ],
                      ),
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

  void showMakeOfferDialogue(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: new Container(
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          'Make Offer',
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: kPrimaryColor),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Amount per hour'),
                              SizedBox(
                                height: 2,
                              ),
                              Container(
                                height: 35,
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: '50',
                                    hintStyle: TextStyle(fontSize: 12),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(3),
                                      ),
                                      borderSide: BorderSide(color: Colors.grey[600]),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(3),
                                      ),
                                      borderSide: BorderSide(color: Colors.grey[600]),
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
                      ),
                      Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.grey[200],
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Total Budget",
                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                                      ),
                                      Text(r'based on 50$/hour rate for 3 hours'),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            r'$',
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 4.0),
                                            child: Text(
                                              '150',
                                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: kPrimaryColor),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text('Message'),
                              SizedBox(
                                height: 2,
                              ),
                              Container(
                                height: 80,
                                child: TextField(
                                  maxLines: 5,
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                    hintText: 'Enter a short note for the employer',
                                    hintStyle: TextStyle(fontSize: 12),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(3),
                                      ),
                                      borderSide: BorderSide(color: Colors.grey[600]),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(3),
                                      ),
                                      borderSide: BorderSide(color: Colors.grey[600]),
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
                          Navigator.pop(context);
                        },
                        child: ModelSheetButton(
                          title: 'CANCEL',
                          buttonColor: Colors.grey,
                          textColor: Colors.white,
                        ),
                      ),
                      InkWell(
                        onTap: () => showOfferDialogueForEmployer(context),
                        child: ModelSheetButton(
                          title: 'DONE',
                          buttonColor: kPrimaryColor,
                          textColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void showOfferDialogueForEmployer(context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: new Container(
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.all(
                Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          'Accept Offer',
                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: kPrimaryColor),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            height: 1,
                                            color: Colors.grey[200],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 10),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    CircleAvatar(
                                                      backgroundImage: NetworkImage('https://cdn.wallpapersafari.com/36/90/pitIS3.jpg'),
                                                      radius: 23,
                                                    ),
                                                    SizedBox(
                                                      width: 4,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text('Jams C.', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
                                                        SizedBox(
                                                          height: 2,
                                                        ),
                                                        UiHelper.showRating(size: 13),
                                                        SizedBox(
                                                          height: 2,
                                                        ),
                                                        Text(
                                                          '95% completion rate',
                                                          style: TextStyle(color: Colors.grey[600], fontSize: 9),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                                Column(
                                                  children: [
                                                    RichText(
                                                      text: new TextSpan(
                                                        text: r'$40',
                                                        style: TextStyle(fontWeight: FontWeight.w500, color: kPrimaryColor, fontSize: 20),
                                                        children: <TextSpan>[
                                                          new TextSpan(
                                                            text: '/hour',
                                                            style: kPriceTagHourStyle,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(),
                              SizedBox(
                                height: 20,
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text("Hi,\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur tempor, enim at commodo gravida, lorem lectus pellentesque dolor, ut convallis dui leo et risus. Ut nec dignissim nunc, eget bibendum velit. \n\nThanks "),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.grey[200],
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Total Budget",
                                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                                      ),
                                      Text(r'based on 50$/hour rate for 3 hours'),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            r'$',
                                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top: 4.0),
                                            child: Text(
                                              '150',
                                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: kPrimaryColor),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, RoutePaths.Tasks);
                        },
                        child: ModelSheetButton(
                          title: 'CANCEL',
                          buttonColor: Colors.grey,
                          textColor: Colors.white,
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.pushNamed(context, RoutePaths.Tasks),
                        child: ModelSheetButton(
                          title: 'DONE',
                          buttonColor: kPrimaryColor,
                          textColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
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
//padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
