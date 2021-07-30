import 'package:flutter/material.dart';
import 'package:kasast/business%20logic/view_models/login_screen_viewmodel.dart';
import 'package:kasast/core/constants/app_constants.dart';
import 'package:kasast/ui/common/ui_helpers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;
  bool logging = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode _nodeEmail = FocusNode();
  FocusNode _nodePassword = FocusNode();

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Container(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  UiHelper.marginVertical(100),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                      width: 70,
                      height: 60,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/kasast_icon.png"),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    RichText(
                        text: TextSpan(
                            text: "Job",
                            style: TextStyle(
                                color: Colors.lightBlue, fontSize: 50),
                            children: [
                          TextSpan(
                              text: "Caf",
                              style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontSize: 50,
                                  fontWeight: FontWeight.bold))
                        ]))
                  ]),
                  UiHelper.marginVertical(120),
                  UiHelper.emailTextFormField(context,
                      focusNode: _nodeEmail,
                      nextFocusNode: _nodePassword,
                      textEditingController: _emailController),
                  UiHelper.marginVertical(20),
                  UiHelper.passwordTextFormField(context,
                      obscureText: _obscureText,
                      onEyePressed: _toggle,
                      focusNode: _nodePassword,
                      textInputAction: TextInputAction.done,
                      textEditingController: _passwordController),
                  UiHelper.marginVertical(15),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                              context, RoutePaths.ForgotPassword);
                        },
                        child: Text("Forgot Password?",
                            style: TextStyle(
                                color: Colors.lightBlue, fontSize: 16))),
                  ),
                  UiHelper.marginVertical(80),
                  UiHelper.buttonGeneric(
                      context, logging, Colors.lightBlue, Colors.white, "LOGIN",
                      functionOnPressed: () async {
                    if (_formKey.currentState.validate()) {
                      String email = _emailController.text;
                      String password = _passwordController.text;
                      setState(() {
                        logging = true;
                      });

                      bool success = await LoginScreenViewModel()
                          .logInUser(email, password);
                      if (success) {
                        Navigator.pushReplacementNamed(
                            context, RoutePaths.AccountType);
                      } else {
                        String message = 'Email or Password is incorrect';
                        setState(
                          () {
                            logging = false;
                          },
                        );
                        showSnackBar(message);
                      }
                    } else {
                      print('not working');
                    }
                  }),
                  UiHelper.marginVertical(20),
                  UiHelper.multiStyleText(
                      "Don't have any account?",
                      " Signup here",
                      Colors.black,
                      kPrimaryColor,
                      FontWeight.w400,
                      14, functionOnPressed: () {
                    Navigator.pushNamed(context, RoutePaths.Register);
                  })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showSnackBar(message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
