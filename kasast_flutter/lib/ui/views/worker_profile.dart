import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:kasast/components/worker_profile_container.dart';
import 'package:kasast/core/constants/app_constants.dart';
import 'package:kasast/ui/common/ui_helpers.dart';

class WorkerProfile extends StatefulWidget {
  @override
  WorkerProfileState createState() => WorkerProfileState();
}

class WorkerProfileState extends State<WorkerProfile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          WorkerProfileContainer(),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 5),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15), // if you need this
                side: BorderSide(
                  color: Colors.grey.withOpacity(.2),
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  Container(
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
                                "Skills",
                                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ],
                          ),
                          Divider(),
                          Container(
                            child: Wrap(
                              spacing: 2,
                              runSpacing: 2,
                              children: [
                                Container(
                                  height: 30,
                                  //width: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
                                    child: Text(
                                      "Transporting goods",
                                      style: TextStyle(color: kPrimaryColor),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  height: 30,
                                  //width: 140,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
                                    child: Text(
                                      "Store managment",
                                      style: TextStyle(color: kPrimaryColor),
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
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 5),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15), // if you need this
                side: BorderSide(
                  color: Colors.grey.withOpacity(.2),
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  Container(
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
                                "Review (21)",
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
                                    "4.90",
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
                                          "4.90",
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
