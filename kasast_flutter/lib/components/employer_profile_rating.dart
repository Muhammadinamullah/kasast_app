import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kasast/business%20logic/models/user_profile.dart';
import 'package:kasast/ui/common/ui_helpers.dart';

class EmployerProfileRating extends StatelessWidget {
  final UserProfile userProfile;
  EmployerProfileRating({this.userProfile});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      //height: 180,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Review (${userProfile.details.receivedReviews.length})",
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                ),
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                      size: 20,
                    ),
                    Text(
                      "4.9",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                    )
                  ],
                )
              ],
            ),
            Divider(),
            Container(
              //height: 90,
              //color: Colors.amber,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            "4.9",
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          UiHelper.showRating(size: 20)
                        ],
                      ),
                      Text(
                        "Med M",
                        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  ),
                  Text(
                    "Hard job and they were very skilled at getting heavy commercial fridge into tite space.",
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
            ),
            Divider(),
            Text("View All Reviews")
          ],
        ),
      ),
    );
  }
}
