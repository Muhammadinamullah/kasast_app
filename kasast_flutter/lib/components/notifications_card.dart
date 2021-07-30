import 'package:flutter/material.dart';

class NotificationsCard extends StatelessWidget {
  const NotificationsCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage('https://cdn.wallpapersafari.com/36/90/pitIS3.jpg'),
                      radius: 25,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'David Morrison ',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                            Text('applied on your job', style: TextStyle(fontSize: 10))
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Text(
                              'Job: ',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                            ),
                            Text('Editing and proofreading', style: TextStyle(fontSize: 10))
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                Text(
                  '2 min ago',
                  style: TextStyle(color: Colors.black54, fontSize: 12),
                ),
              ],
            ),
          )),
    );
  }
}
