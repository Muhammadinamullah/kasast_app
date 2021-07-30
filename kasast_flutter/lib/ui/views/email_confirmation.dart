import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kasast/core/constants/app_constants.dart';

class EmailConfirmation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 50),
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 100,
                  width: 200,
                ),
              ),
              Image.asset(
                'assets/images/email_notification.png',
                height: 200,
                width: 150,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 100),
                child: Text(
                  "Hi Sam! Please check your mail box, We have sent instructions to reset your password.",
                  style: TextStyle(fontSize: 15, height: 1.5),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: RaisedButton(
                    child: Text(
                      "OK",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, RoutePaths.Login);
                    },
                    color: theme.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
