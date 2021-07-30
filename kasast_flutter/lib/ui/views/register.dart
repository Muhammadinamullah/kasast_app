import 'package:flutter/material.dart';
import 'package:kasast/business%20logic/view_models/register_screen_viewmodel.dart';
import 'package:kasast/core/constants/app_constants.dart';
import 'package:kasast/ui/common/ui_helpers.dart';

class Register extends StatefulWidget {
  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {
  bool _obscureText = true;
  bool registering = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode _nodeName = FocusNode();
  FocusNode _nodeEmail = FocusNode();
  FocusNode _nodePhone = FocusNode();
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
          padding: EdgeInsets.all(10),
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
                            fit: BoxFit.fitWidth),
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
                  UiHelper.marginVertical(40),
                  Center(
                    child: Text(
                      "SIGN UP",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  UiHelper.marginVertical(10),
                  UiHelper.nameTextFormField(context,
                      focusNode: _nodeName,
                      nextFocusNode: _nodeEmail,
                      textEditingController: _nameController),
                  UiHelper.marginVertical(10),
                  UiHelper.emailTextFormField(context,
                      focusNode: _nodeEmail,
                      nextFocusNode: _nodePhone,
                      textEditingController: _emailController),
                  UiHelper.marginVertical(10),
                  UiHelper.phoneTextFormField(context,
                      focusNode: _nodePhone,
                      nextFocusNode: _nodePassword,
                      textEditingController: _phoneController),
                  UiHelper.marginVertical(10),
                  UiHelper.passwordTextFormField(context,
                      obscureText: _obscureText,
                      onEyePressed: _toggle,
                      focusNode: _nodePassword,
                      textInputAction: TextInputAction.done,
                      textEditingController: _passwordController),
                  UiHelper.marginVertical(30),
                  UiHelper.buttonGeneric(
                    context,
                    registering,
                    Colors.lightBlue,
                    Colors.white,
                    "Register",
                    functionOnPressed: () async {
                      if (_formKey.currentState.validate()) {
                        String fullName = _nameController.text;
                        String email = _emailController.text;
                        String phone = _phoneController.text;
                        String password = _passwordController.text;
                        setState(() {
                          registering = true;
                        });
                        bool success = await RegisterScreenViewModel()
                            .registerUser(
                                fullName: fullName,
                                email: email,
                                phone: phone,
                                password: password);
                        if (success) {
                          setState(() {
                            registering = false;
                          });
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text("Email Confirmation"),
                                content: Text(
                                    "Please check your email for confirmation and login again"),
                                actions: [
                                  FlatButton(
                                    child: Text("OK"),
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(
                                          context, RoutePaths.Login);
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                          //Navigator.pushReplacementNamed(context, RoutePaths.Login);
                        } else {
                          String message =
                              'Email or Phone Number is already registered';
                          setState(
                            () {
                              registering = false;
                            },
                          );
                          showSnackBar(message);
                        }
                      }
                    },
                  ),
                  UiHelper.marginVertical(20),
                  UiHelper.multiStyleText(
                      "Already have an account? ",
                      "Sign In here",
                      Colors.black,
                      Colors.lightBlue,
                      FontWeight.w400,
                      14, functionOnPressed: () {
                    Navigator.pushNamed(context, RoutePaths.Login);
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
