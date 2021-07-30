import 'package:flutter/material.dart';
import 'package:kasast/core/constants/app_constants.dart';
import 'package:kasast/ui/common/ui_helpers.dart';

class TaskDetailBottomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 1,
          color: Colors.grey[200],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage('https://cdn.wallpapersafari.com/36/90/pitIS3.jpg'),
                    radius: 23,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Jams C.', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
                      SizedBox(
                        height: 2,
                      ),
                      UiHelper.showRating(size: 13),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        '95% completion rate',
                        style: TextStyle(color: Colors.grey[600], fontSize: 9),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  RichText(
                    text: new TextSpan(
                      text: r'$40',
                      style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
                      children: <TextSpan>[
                        new TextSpan(
                          text: '/hour',
                          style: kPriceTagHourStyle,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 20,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Color(0xff14dc6d),
                    ),
                    child: Center(
                      child: Text(
                        'VIEW',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
