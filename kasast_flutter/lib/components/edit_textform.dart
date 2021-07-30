import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditName extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<EditName> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: TextFormField(
        style: TextStyle(color: Colors.black),
        keyboardType: TextInputType.text,
        //validator: validatePassword,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.person,
            color: Colors.grey,
          ),
          hintStyle: new TextStyle(),
          hintText: 'Enter Name',
          // labelText: 'Name',
          enabledBorder: UnderlineInputBorder(
              borderSide: new BorderSide(color: Colors.grey)),
        ),
        onSaved: (String val) {},
      ),
    );
  }
}

class EditState extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class EditStateState extends State<EditState> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: TextFormField(
        style: TextStyle(color: Colors.black),
        keyboardType: TextInputType.text,
        //validator: validatePassword,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.add,
            color: Colors.grey,
          ),
          hintStyle: new TextStyle(),
          hintText: 'Select State',
          //labelText: 'Email',
          enabledBorder: UnderlineInputBorder(
              borderSide: new BorderSide(
                color: Colors.grey,
              )),
        ),
        onSaved: (String val) {},
      ),
    );
  }
}

class EditCountry extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class EditCountryState extends State<EditCountry> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
      child: TextFormField(
        style: TextStyle(color: Colors.black),
        keyboardType: TextInputType.text,
        //validator: validatePassword,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.add,
            color: Colors.grey,
          ),
          hintStyle: new TextStyle(),
          hintText: 'Select Country',
          //labelText: 'Email',
          enabledBorder: UnderlineInputBorder(
              borderSide: new BorderSide(
                color: Colors.grey,
              )),
        ),
        onSaved: (String val) {},
      ),
    );
  }
}
