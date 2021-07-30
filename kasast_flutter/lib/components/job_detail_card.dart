import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobDetailCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, top: 3),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // if you need this
          side: BorderSide(
            color: Colors.grey.withOpacity(.2),
            width: 1,
          ),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 112,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: CircleAvatar(
                      radius: 30,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(66.0),
                        child: Image.network(
                          'https://cdn.wallpaper safari.com/36/90/pitIS3.jpg',
                          width: 70,
                          height: 70,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: 10, top: 10),
                        child: Text(
                          "Unpacking after moving house",
                          style: TextStyle(fontWeight: FontWeight.bold),
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
                                ),
                                Text(
                                  "Orland,California,US",
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 33),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "120/hr",
                                    style: TextStyle(
                                        color: theme.primaryColor,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "3hours",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 10,
                                    ),
                                  ),
                                ],
                              ),
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
                              Icons.add,
                              size: 18,
                            ),
                            Text(
                              " 350.0 Orange Avenue",
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 3, left: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.calendar_today,
                              size: 18,
                            ),
                            Text(
                              " Sat.6 Jul",
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.access_time,
                              size: 18,
                            ),
                            Text(
                              " 4:30 PM",
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
