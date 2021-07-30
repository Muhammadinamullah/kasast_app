import 'package:flutter/material.dart';
import 'package:kasast/ui/common/ui_helpers.dart';

class NoJobCreatedWidget extends StatelessWidget {
  const NoJobCreatedWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Column(children: [
            Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/images/kasast_icon.png"),
              )),
            ),
            UiHelper.marginVertical(20),
            Text(
              "Create new Jobs",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
            ),
            UiHelper.marginVertical(10),
            Text("Your Created Jobs will be shown on"),
            Text("this page."),
          ]),
        ),
      ],
    );
  }
}
