import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kasast/components/employer_profile_data.dart';

class WorkerProfileContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      height: 200,
      decoration: BoxDecoration(color: Colors.lightBlue, borderRadius: BorderRadius.vertical(bottom: Radius.circular(25))),
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
              EmployerProfileData(),
            ],
          ),
          Flexible(
              child: Align(
            alignment: Alignment(0, 1.8),
            child: Divider(
              color: Colors.white,
            ),
          )),
          Flexible(
            child: Align(
              alignment: Alignment(0, 0.7),
              child: IntrinsicHeight(
                  child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(
                        "12k +",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      Text(
                        "Total Earnings",
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
                        "59",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      Text(
                        "Jobs",
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
                        "1154",
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
              )),
            ),
          )
        ],
      ),
    );
  }
}
