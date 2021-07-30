import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kasast/business%20logic/models/created_jobs.dart';
import 'package:kasast/business%20logic/models/employer_upcoming_jobs.dart';
import 'package:kasast/core/constants/app_constants.dart';

class EmployerJobListCard extends StatelessWidget {
  final Jobs jobs;

  const EmployerJobListCard({this.jobs});

  String formatedDate() {
    DateFormat dateFormat = DateFormat("E.d MMM");
    String date = dateFormat.format(jobs.startDate);
    return date;
  }

  String formatedTime() {
    DateFormat dateFormat = DateFormat("E.d MMM");
    String time = DateFormat.jm().format(jobs.startTime);

    return time;
  }

  String getRemainingHours() {
    String hours;
    print(jobs.startTime);
    DateTime dateTimeNow = DateTime.now();
    Duration duration = jobs.startTime.difference(dateTimeNow);
    if (duration.inHours <= 0) {
      hours = 0.toString();
    } else {
      hours = duration.inHours.toString();
    }
    return hours;
  }

  @override
  Widget build(BuildContext context) {
    getRemainingHours();
    return Padding(
      padding: EdgeInsets.all(10),
      child: Card(
        shape: kCardShapes,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 130,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 15, top: 10),
                child: Text(
                  jobs.title,
                  style: kCardTopHeadingStyle,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15, top: 3, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Icon(
                          Icons.location_on_outlined,
                          size: 18,
                          color: kCardLightgreyColor,
                        ),
                        Text(
                          jobs.address == ""
                              ? ' Address Not given'
                              : jobs.address,
                          style: kCardSubHeadingStyle,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "\$${jobs.totalPrice.toStringAsFixed(0)}",
                          style: kPriceTagCardStyle,
                        ),
                        Text("for ${jobs.hours.toStringAsFixed(0)} hour",
                            style: kPriceTagHourStyle),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.calendar_today,
                      size: 18,
                      color: kCardLightgreyColor,
                    ),
                    Text(
                      " " + formatedDate(),
                      style: kCardSubHeadingStyle,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.access_time,
                      size: 18,
                      color: kCardLightgreyColor,
                    ),
                    Text(
                      " " + formatedTime(),
                      style: kCardSubHeadingStyle,
                    ),
                  ],
                ),
              ),
              kCardDivider,
              Padding(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      !(jobs.offersCount == 0)
                          ? '${jobs.offersCount} Offers'
                          : 'No Offers Yet',
                      style: TextStyle(
                          color: !(jobs.offersCount == 0)
                              ? kPrimaryColor
                              : Colors.red),
                    ),
                    GestureDetector(
                      onTap: null,
                      child: Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 2.0),
                            ),
                            Text(
                              '${getRemainingHours()} hours left',
                              style: TextStyle(color: kCardLightgreyColor),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
