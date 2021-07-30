import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kasast/business%20logic/models/user_profile.dart';
import 'package:kasast/core/constants/app_constants.dart';

class EmployerProfileData extends StatelessWidget {
  final User user;

  const EmployerProfileData({this.user});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 10, top: 10),
          child: Text(
            user.firstName + " " + user.lastName ?? '',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10, top: 3, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.star,
                    size: 18,
                    color: Colors.white,
                  ),
                  Text(
                    "${user.workerCompletionRate ?? 0}% Completion Rate",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 13),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    SizedBox(
                      width: 80,
                      height: 30,
                      child: RaisedButton(
                        color: Colors.blue,
                        onPressed: () {
                          Navigator.pushNamed(context, RoutePaths.EditProfile);
                        },
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0), side: BorderSide(color: Colors.white)),
                        child: Text(
                          "EDIT",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(
                Icons.location_on_outlined,
                size: 18,
                color: Colors.white,
              ),
              Text(
                "${user.country ?? 'No country entered'}",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
