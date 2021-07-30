import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobDetailDescription extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(left: 10,right: 10),
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
          height: 100,
          child: Padding(padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Description",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                Text("I need some one to work with me to unpack moving boxes in our new home.",),
                Text("Thanks",),
              ],
            ),
          ),
        ),
      ),
    );
  }

}