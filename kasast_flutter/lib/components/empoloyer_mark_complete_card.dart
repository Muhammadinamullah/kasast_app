import 'package:flutter/material.dart';
import 'package:kasast/core/constants/app_constants.dart';

class EmployerMarkCompleteCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: kCardShapes,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        child: CircleAvatar(
                          radius: 33,
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
                            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 15,
                                color: Colors.grey[600],
                              ),
                              Text(
                                ' Orland,California,US',
                                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.flag,
                                size: 15,
                                color: Colors.grey[600],
                              ),
                              Text(
                                ' 3520 S.Orange Avanue',
                                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.calendar_today, size: 15, color: Colors.grey[600]),
                                  Text(
                                    " Sat.6 Jul",
                                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.access_time, size: 15, color: Colors.grey[600]),
                                  Text(' 3:30 PM', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
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
                      RichText(
                        text: new TextSpan(
                          text: r'$40',
                          style: kPriceTagCardStyle,
                          children: <TextSpan>[
                            new TextSpan(
                              text: '/hour',
                              style: kPriceTagHourStyle,
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'for 3 hours',
                        style: kPriceTagHourStyle,
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
