import 'package:flutter/material.dart';
import 'package:kasast/core/constants/app_constants.dart';

class ResetPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
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
                      padding: EdgeInsets.only(left: 20, right: 20, top: 50, bottom: 10),
                      child: ReusedPasswordTextFields(
                        hint: 'Current Password',
                        icon: Icons.vpn_key_outlined,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                      child: ReusedPasswordTextFields(
                        hint: 'New Password',
                        icon: Icons.lock_outline,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                      ),
                      child: ReusedPasswordTextFields(
                        hint: 'Confirm New Password',
                        icon: Icons.lock_outline,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 100, left: 15, right: 15),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 60,
                        child: RaisedButton(
                          child: Text(
                            "SEND",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, RoutePaths.Login);
                          },
                          color: kPrimaryColor,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ReusedPasswordTextFields extends StatelessWidget {
  final hint;
  final icon;

  const ReusedPasswordTextFields({Key key, @required this.hint, @required this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.black),
      keyboardType: TextInputType.text,
      //validator: validatePassword,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.grey,
        ),
        hintStyle: new TextStyle(),
        hintText: hint,
        //labelText: 'Email',
        enabledBorder: UnderlineInputBorder(borderSide: new BorderSide(color: Colors.grey)),
      ),
      onSaved: (String val) {},
    );
  }
}
