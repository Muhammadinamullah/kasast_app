import 'package:flutter/material.dart';
import 'package:kasast/business%20logic/models/employer_upcoming_jobs.dart';
import 'package:kasast/business%20logic/view_models/employer_upcoming_jobs.dart';
import 'package:kasast/core/constants/app_constants.dart';

class UpcomingJobsCard extends StatelessWidget {
  final UpcmngJobs upcomingJobs;
  const UpcomingJobsCard({this.upcomingJobs});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, RoutePaths.MarkCompleteForEmployer);
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                  'https://cdn.wallpapersafari.com/36/90/pitIS3.jpg'),
                            ),
                          ),
                          SizedBox(
                            width: 3,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(upcomingJobs.title,
                                  style: kCardTopHeadingStyle),
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
                                  Icon(
                                    Icons.location_on_outlined,
                                    size: 18,
                                    color: kCardLightgreyColor,
                                  ),
                                  Text(
                                      upcomingJobs.address = null
                                          ? ' Address Not given'
                                          : upcomingJobs.address,
                                      style: kCardSubHeadingStyle),
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
                                      Text(upcomingJobs.startDate.toString(),
                                          style: kCardSubHeadingStyle),
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
                                      Text(upcomingJobs.startTime.toString(),
                                          style: kCardSubHeadingStyle),
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
                          Text(
                              "\$${upcomingJobs.totalPrice.toStringAsFixed(0)}",
                              style: kPriceTagCardStyle),
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
          // decoration: BoxDecoration(
          //   color: Colors.white,
          //   borderRadius: BorderRadius.circular(5),
          // ),
        ),
      ),
    );
  }
}
