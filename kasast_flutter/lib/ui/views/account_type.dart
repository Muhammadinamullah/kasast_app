import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kasast/business%20logic/view_models/account_type_viewmodel.dart';
import 'package:kasast/core/constants/app_constants.dart';

class AccountType extends StatefulWidget {
  @override
  AccountTypeState createState() => AccountTypeState();
}

class AccountTypeState extends State<AccountType> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
        backgroundColor: Colors.blue[500],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 12),
              child: Text(
                "Select Account Type",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            InkWell(
              onTap: () async {
                bool success =
                    await AccountTypeViewModel().updateRole('Employer');
                if (!success) {
                  String message = 'Something went wrong';
                  showSnackBar(message);
                } else {
                  Navigator.pushNamed(context, RoutePaths.EmployerJobsList);
                }
              },
              child: Padding(
                padding: EdgeInsets.only(left: 12, right: 12, top: 10),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.blue[600],
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(7))),
                    child: Center(
                      child: Text(
                        "I want to hire",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )),
              ),
            ),
            InkWell(
              onTap: () async {
                bool success =
                    await AccountTypeViewModel().updateRole('Employee');
                if (!success) {
                  String message = 'Something went wrong';
                  showSnackBar(message);
                } else {
                  Navigator.pushNamed(context, RoutePaths.Tasks);
                }
              },
              child: Padding(
                padding: EdgeInsets.only(left: 12, right: 12, top: 13),
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.blue[600],
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(7))),
                    child: Center(
                      child: Text(
                        "I want to work",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    )),
              ),
            )
          ],
        ));
  }

  void showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
