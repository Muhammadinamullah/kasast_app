
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditEmail extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<EditEmail> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return  Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: TextFormField(
        style: TextStyle(color: Colors.black),
        keyboardType: TextInputType.text,
        //validator: validatePassword,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.email_outlined,
            color: Colors.grey,
          ),
          hintStyle: new TextStyle(),
          hintText: 'Enter Email',
          //labelText: 'Email',
          enabledBorder: UnderlineInputBorder(
              borderSide: new BorderSide(color: Colors.grey)),
        ),
        onSaved: (String val) {},
      ),
    );
  }
}