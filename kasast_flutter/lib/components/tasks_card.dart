import 'package:flutter/material.dart';
import 'package:kasast/core/constants/app_constants.dart';

class TasksCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: kCardShapes,
        child: Container(
          height: 130,
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage('https://cdn.wallpapersafari.com/36/90/pitIS3.jpg'),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Editing and proof reading',
                                style: kCardTopHeadingStyle,
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    size: 18,
                                    color: kCardLightgreyColor,
                                  ),
                                  Text('Orlando,California,US', style: kCardSubHeadingStyle),
                                ],
                              ),
                              SizedBox(
                                height: 4,
                              ),
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_today,
                                        size: 18,
                                        color: kCardLightgreyColor,
                                      ),
                                      Text(
                                        " Sat.6 Jul",
                                        style: kCardSubHeadingStyle,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.access_time,
                                        size: 18,
                                        color: kCardLightgreyColor,
                                      ),
                                      Text(
                                        '3:30 PM',
                                        style: kCardSubHeadingStyle,
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Text(r'$120', style: kPriceTagCardStyle),
                          Text(
                            'for 3 hours',
                            style: kPriceTagHourStyle,
                          )
                        ],
                      )
                    ],
                  ),
                ),
                kCardDivider,
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Open', style: TextStyle(color: kCardLightgreyColor)),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        '13 Offers',
                        style: TextStyle(color: kCardLightgreyColor),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
