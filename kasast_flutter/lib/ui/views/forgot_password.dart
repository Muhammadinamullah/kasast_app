import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:kasast/business%20logic/view_models/forgot_password_viewmodel.dart';
import 'package:kasast/core/constants/app_constants.dart';
import 'package:kasast/ui/common/ui_helpers.dart';

class ForgotPassword extends StatefulWidget {
  @override
  ForgotPasswordState createState() => ForgotPasswordState();
}

class ForgotPasswordState extends State<ForgotPassword> {
  bool logging = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  FocusNode _nodeEmail = FocusNode();
  bool processing = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Scaffold(
        key: _scaffoldKey,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.only(top: 90),
                            child: Image.asset(
                              "assets/images/logo.png",
                              width: 200,
                              height: 90,
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 60),
                          child: Text(
                            "FORGOT PASSWORD",
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20, right: 20, top: 100),
                          child: UiHelper.forgotEmailTextFormField(context, focusNode: _nodeEmail, textEditingController: _emailController),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 190, left: 15, right: 15),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 60,
                            child: RaisedButton(
                              child: !processing
                                  ? Text(
                                      "SEND",
                                      style: TextStyle(fontSize: 18, color: Colors.white),
                                    )
                                  : CircularProgressIndicator(
                                      backgroundColor: Colors.white,
                                    ),
                              onPressed: () async {
                                if (_formKey.currentState.validate()) {
                                  setState(() {
                                    processing = true;
                                  });
                                  String email = _emailController.text;
                                  bool success = await ForgotPasswordViewModel().getPassword(email);

                                  if (success) {
                                    Navigator.pushReplacementNamed(context, RoutePaths.EmailConfirmation);
                                  } else {
                                    String message = 'Email is not correct';
                                    setState(
                                      () {
                                        processing = false;
                                      },
                                    );
                                    showSnackBar(message);
                                  }
                                }
                              },
                              color: theme.primaryColor,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void showSnackBar(message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
