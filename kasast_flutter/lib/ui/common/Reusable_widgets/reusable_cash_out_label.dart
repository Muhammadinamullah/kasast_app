import 'package:flutter/material.dart';
import 'package:kasast/core/constants/app_constants.dart';

class ReusableCashOutLabels extends StatelessWidget {
  final description;
  final balance;

  const ReusableCashOutLabels({Key key, this.description, this.balance}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          description,
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          balance,
          style: TextStyle(fontSize: 50, color: kPrimaryColor),
        )
      ],
    );
  }
}
