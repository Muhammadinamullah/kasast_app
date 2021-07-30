import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kasast/business%20logic/models/user_profile.dart';
import 'package:kasast/components/employer_profile_data.dart';

class EmployerProfileContainer extends StatelessWidget {
  final UserProfile userProfile;

  const EmployerProfileContainer({this.userProfile});
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      height: 210,
      decoration: BoxDecoration(color: Colors.lightBlue, borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: 25,
                  ),
                  child: CircleAvatar(
                    radius: 30,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(66.0),
                      child: Image.network(
                        'https://cdn.wallpapersafari.com/36/90/pitIS3.jpg',
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                EmployerProfileData(user: userProfile.user),
              ],
            ),
            Flexible(
                child: Align(
              alignment: Alignment(0, 1.4),
              child: Divider(
                color: Colors.white,
              ),
            )),
            Flexible(
              child: Align(
                alignment: Alignment(0, 0.7),
                child: Container(
                  height: 100,
                  width: double.infinity,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            "${userProfile.details.totalSpending ?? 0}k +",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          Text(
                            "Total Spent",
                            style: TextStyle(
                              color: Colors.white54,
                            ),
                          )
                        ],
                      ),
                      VerticalDivider(
                        color: Colors.white54,
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            "${userProfile.details.employerTotalJobs ?? 0}",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          Text(
                            "Total Jobs",
                            style: TextStyle(
                              color: Colors.white54,
                            ),
                          )
                        ],
                      ),
                      VerticalDivider(
                        color: Colors.white54,
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            "${userProfile.details.hoursWorked ?? 0}",
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          Text(
                            "Total Hours",
                            style: TextStyle(
                              color: Colors.white54,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
