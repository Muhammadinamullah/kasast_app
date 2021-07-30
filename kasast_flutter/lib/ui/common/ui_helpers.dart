import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:kasast/core/constants/strings.dart';

class UiHelper {
  static Widget multiStyleText(
      String firstText,
      String secondText,
      Color firstTextColor,
      Color secondTextColor,
      FontWeight fontWeight,
      double fontSize,
      {Function functionOnPressed}) {
    return GestureDetector(
      onTap: functionOnPressed,
      child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
              text: firstText,
              style: TextStyle(
                  color: firstTextColor,
                  fontSize: fontSize,
                  fontWeight: fontWeight),
              children: [
                TextSpan(
                    text: secondText,
                    style: TextStyle(
                        color: secondTextColor,
                        fontSize: fontSize,
                        fontWeight: fontWeight))
              ])),
    );
  }

  static Widget buttonGeneric(
    BuildContext context,
    bool inProgress,
    Color buttonColor,
    Color textColor,
    String text, {
    Function functionOnPressed,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      decoration: BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.blue[200].withOpacity(.9),
            blurRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: !inProgress
            ? Text(
                text,
                style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    fontFamily: "Avenir"),
              )
            : CircularProgressIndicator(
                //valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                backgroundColor: Colors.white,
              ),
        color: buttonColor,
        onPressed: functionOnPressed,
      ),
    );
  }

  static Widget buttonBottom(
      BuildContext context, Color buttonColor, Color textColor, String text,
      {Function functionOnPressed}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: textColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              fontFamily: "Avenir"),
        ),
        color: buttonColor,
        onPressed: functionOnPressed,
      ),
    );
  }

  static Widget showRating({@required double size}) {
    return RatingBar.builder(
      initialRating: 3,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      //itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      itemSize: size,
      onRatingUpdate: (rating) {
        print(rating);
      },
    );
  }

  static Widget marginVertical(double height) {
    return SizedBox(
      height: height,
    );
  }

  static Widget nameTextFormField(BuildContext context,
      {FocusNode focusNode,
      FocusNode nextFocusNode,
      TextEditingController textEditingController}) {
    return TextFormField(
      controller: textEditingController,
      focusNode: focusNode,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (v) {
        FocusScope.of(context).requestFocus(nextFocusNode);
      },
      validator: RequiredValidator(errorText: "Required*"),
      autofocus: false,
      decoration: InputDecoration(
        hintText: "Name",
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        focusColor: Colors.blueAccent,
        prefixIcon: Padding(
          padding: EdgeInsets.all(10),
          child: Icon(Icons.person_outline),
        ),
      ),
    );
  }

  static Widget emailTextFormField(BuildContext context,
      {FocusNode focusNode,
      FocusNode nextFocusNode,
      TextEditingController textEditingController}) {
    return TextFormField(
      controller: textEditingController,
      focusNode: focusNode,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (v) {
        FocusScope.of(context).requestFocus(nextFocusNode);
      },
      validator: MultiValidator([
        RequiredValidator(errorText: "Required*"),
        EmailValidator(errorText: "Not a valid email"),
      ]),
      autofocus: false,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Email",
        // labelText: "Email",
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),

        focusColor: Colors.blueAccent,
        prefixIcon: Padding(
          padding: EdgeInsets.all(10),
          child: Icon(Icons.mail_outline),
        ),
      ),
    );
  }

  static Widget forgotEmailTextFormField(BuildContext context,
      {FocusNode focusNode,
      FocusNode nextFocusNode,
      TextEditingController textEditingController}) {
    return TextFormField(
      controller: textEditingController,
      focusNode: focusNode,
      style: TextStyle(color: Colors.black),
      keyboardType: TextInputType.emailAddress,
      validator: MultiValidator([
        RequiredValidator(errorText: "Required*"),
        EmailValidator(errorText: "Not a valid email"),
      ]),
      autofocus: true,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.email_outlined,
          color: Colors.grey,
        ),
        hintStyle: new TextStyle(),
        hintText: 'Enter Email',
        //labelText: 'Email',
        enabledBorder: UnderlineInputBorder(
          borderSide: new BorderSide(color: Colors.grey),
        ),
      ),
      onSaved: (String val) {},
    );
  }

  static Widget editAddressTextFormField(BuildContext context,
      {FocusNode focusNode,
      FocusNode nextFocusNode,
      TextEditingController textEditingController}) {
    return TextFormField(
      controller: textEditingController,
      focusNode: focusNode,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (v) {
        FocusScope.of(context).requestFocus(nextFocusNode);
      },
      validator: MultiValidator([
        RequiredValidator(errorText: "Required*"),
      ]),
      autofocus: false,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Enter Address",
        // labelText: "Email",
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),

        focusColor: Colors.blueAccent,
        prefixIcon: Padding(
          padding: EdgeInsets.all(10),
          child: Icon(Icons.add_location_alt_outlined),
        ),
      ),
    );
  }

  static Widget editStateTextFormField(BuildContext context,
      {FocusNode focusNode,
      FocusNode nextFocusNode,
      TextEditingController textEditingController}) {
    return TextFormField(
      controller: textEditingController,
      focusNode: focusNode,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (v) {
        FocusScope.of(context).requestFocus(nextFocusNode);
      },
      validator: MultiValidator([
        RequiredValidator(errorText: "Required*"),
      ]),
      autofocus: false,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Select State",
        // labelText: "Email",
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),

        focusColor: Colors.blueAccent,
        prefixIcon: Padding(
          padding: EdgeInsets.all(10),
          child: Icon(Icons.map),
        ),
      ),
    );
  }

  static Widget editCountryTextFormField(BuildContext context,
      {FocusNode focusNode,
      FocusNode nextFocusNode,
      TextEditingController textEditingController}) {
    return TextFormField(
      controller: textEditingController,
      focusNode: focusNode,
      textInputAction: TextInputAction.next,
      validator: MultiValidator([
        RequiredValidator(errorText: "Required*"),
      ]),
      autofocus: false,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Select Country",
        // labelText: "Email",
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),

        focusColor: Colors.blueAccent,
        prefixIcon: Padding(
          padding: EdgeInsets.all(10),
          child: Icon(FontAwesomeIcons.globe),
        ),
      ),
    );
  }

  static Widget phoneTextFormField(BuildContext context,
      {FocusNode focusNode,
      FocusNode nextFocusNode,
      TextEditingController textEditingController}) {
    return TextFormField(
      controller: textEditingController,
      focusNode: focusNode,
      keyboardType: TextInputType.phone,
      textInputAction: TextInputAction.next,
      onFieldSubmitted: (v) {
        FocusScope.of(context).requestFocus(nextFocusNode);
      },
      validator: MultiValidator([
        RequiredValidator(errorText: "Required*"),
        LengthRangeValidator(
            min: 8, max: 16, errorText: "Please Enter Phone between 8-20 "),
      ]),
      autofocus: false,
      decoration: InputDecoration(
        hintText: "Phone",
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        focusColor: Colors.blueAccent,
        prefixIcon: Padding(
          padding: EdgeInsets.all(10),
          child: Icon(Icons.call_outlined),
        ),
      ),
    );
  }

  static Widget taskTitleTextFormField(BuildContext context,
      {FocusNode focusNode,
      FocusNode nextFocusNode,
      TextEditingController textEditingController}) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: TextFormField(
        controller: textEditingController,
        validator: RequiredValidator(errorText: Strings.requiredError),
        maxLength: 50,
        focusNode: focusNode,
        onFieldSubmitted: (v) {
          FocusScope.of(context).requestFocus(nextFocusNode);
        },
        style: TextStyle(color: Colors.black),
        keyboardType: TextInputType.text,
        //validator: validatePassword,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.person,
            color: Colors.grey,
          ),
          hintStyle: new TextStyle(),
          hintText: 'Task Title',

          //labelText: 'Email',
          enabledBorder: UnderlineInputBorder(
              borderSide: new BorderSide(color: Colors.grey)),
        ),
        onSaved: (String val) {},
      ),
    );
  }

  static Widget descriptionTextFormField(BuildContext context,
      {FocusNode focusNode,
      FocusNode nextFocusNode,
      TextEditingController textEditingController}) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: TextFormField(
        controller: textEditingController,
        focusNode: focusNode,
        validator: RequiredValidator(errorText: Strings.requiredError),
        style: TextStyle(color: Colors.black),
        keyboardType: TextInputType.text,
        maxLines: 7,
        maxLength: 200,
        //validator: validatePassword,
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 115),
            child: Icon(
              Icons.description_outlined,
              color: Colors.grey,
            ),
          ),

          hintStyle: new TextStyle(),
          hintText: 'Description',
          //labelText: 'Email',
          enabledBorder: UnderlineInputBorder(
              borderSide: new BorderSide(color: Colors.grey)),
        ),
        onSaved: (String val) {},
      ),
    );
  }

  static Widget priceTextFormField(BuildContext context,
      {Function onValueChanged,
      FocusNode focusNode,
      FocusNode nextFocusNode,
      TextEditingController textEditingController}) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: TextFormField(
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        controller: textEditingController,
        focusNode: focusNode,
        onFieldSubmitted: (v) {
          FocusScope.of(context).requestFocus(nextFocusNode);
        },
        validator: RequiredValidator(errorText: Strings.requiredError),
        style: TextStyle(color: Colors.black),
        keyboardType: TextInputType.number,
        onChanged: onValueChanged,
        //validator: validatePassword,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.attach_money,
            color: Colors.grey,
          ),
          hintStyle: new TextStyle(),
          hintText: 'Price Per Hour',
          //labelText: 'Email',
          enabledBorder: UnderlineInputBorder(
              borderSide: new BorderSide(color: Colors.grey)),
        ),
        onSaved: (String val) {},
      ),
    );
  }

  static Widget hourTextFormField(BuildContext context,
      {Function onValueChanged,
      FocusNode focusNode,
      FocusNode nextFocusNode,
      TextEditingController textEditingController}) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: TextFormField(
        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        controller: textEditingController,
        focusNode: focusNode,
        onFieldSubmitted: (v) {
          FocusScope.of(context).requestFocus(nextFocusNode);
        },
        validator: RequiredValidator(errorText: Strings.requiredError),
        style: TextStyle(color: Colors.black),
        keyboardType: TextInputType.number,
        onChanged: onValueChanged,
        //validator: validatePassword,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.access_time_outlined,
            color: Colors.grey,
          ),
          hintStyle: new TextStyle(),
          hintText: 'Total Hours',
          //labelText: 'Email',
          enabledBorder: UnderlineInputBorder(
              borderSide: new BorderSide(color: Colors.grey)),
        ),
        onSaved: (String val) {},
      ),
    );
  }

  static Widget locationTextFormField(BuildContext context,
      {String initialLocation,
      Function onPress,
      TextEditingController textEditingController}) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: InkWell(
        onTap: onPress,
        child: AbsorbPointer(
          child: TextFormField(
            key: Key(initialLocation),

            initialValue: initialLocation,
            validator: RequiredValidator(errorText: Strings.requiredError),
            style: TextStyle(color: Colors.black),
            keyboardType: TextInputType.text,
            //validator: validatePassword,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.location_on_outlined,
                color: Colors.grey,
              ),
              hintStyle: new TextStyle(),
              hintText: 'Enter Location',
              //labelText: 'Email',
              enabledBorder: UnderlineInputBorder(
                  borderSide: new BorderSide(color: Colors.grey)),
            ),
            onSaved: (String val) {},
          ),
        ),
      ),
    );
  }

  static Widget neighbourHoodTextFormField(BuildContext context,
      {TextEditingController textEditingController}) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: TextFormField(
        onFieldSubmitted: (v) {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        controller: textEditingController,
        validator: RequiredValidator(errorText: Strings.requiredError),
        style: TextStyle(color: Colors.black),
        keyboardType: TextInputType.text,
        //validator: validatePassword,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.add_location_alt,
            color: Colors.grey,
          ),
          hintStyle: new TextStyle(),
          hintText: 'Neighbourhood',
          //labelText: 'Email',
          enabledBorder: UnderlineInputBorder(
              borderSide: new BorderSide(color: Colors.grey)),
        ),
        onSaved: (String val) {},
      ),
    );
  }

  static Widget timeTextFormField(BuildContext context,
      {String initialTime,
      Function onPress,
      TextEditingController textEditingController}) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, top: 10),
      child: InkWell(
        onTap: onPress,
        child: AbsorbPointer(
          child: TextFormField(
            key: Key(initialTime),
            initialValue: initialTime,
            validator: RequiredValidator(errorText: Strings.requiredError),
            style: TextStyle(color: Colors.black),
            keyboardType: TextInputType.text,
            //validator: validatePassword,
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.access_time_outlined,
                color: Colors.grey,
              ),
              hintStyle: new TextStyle(),
              hintText: 'Enter Time',
              //labelText: 'Email',
              enabledBorder: UnderlineInputBorder(
                  borderSide: new BorderSide(color: Colors.grey)),
            ),
            onSaved: (String val) {},
          ),
        ),
      ),
    );
  }

  static Widget passwordTextFormField(BuildContext context,
      {Function onEyePressed,
      bool obscureText,
      FocusNode focusNode,
      TextInputAction textInputAction,
      TextEditingController textEditingController,
      FocusNode nextFocusNode}) {
    return TextFormField(
      controller: textEditingController,
      textInputAction: textInputAction,
      keyboardType: TextInputType.number,
      focusNode: focusNode,
      onFieldSubmitted: (v) {
        FocusScope.of(context).requestFocus(nextFocusNode);
      },
      validator: MultiValidator([
        RequiredValidator(errorText: "Required*"),
        LengthRangeValidator(
            min: 8, max: 20, errorText: "Please Enter Password between 8-20 "),
      ]),
      obscureText: obscureText,
      autofocus: false,
      decoration: InputDecoration(
        hintText: "Password",
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        focusColor: Colors.blueAccent,
        prefixIcon: Padding(
          padding: EdgeInsets.all(10),
          child: Icon(Icons.lock_outline),
        ),
        suffixIcon: Padding(
          padding: EdgeInsets.all(10),
          child: InkWell(
            child: Icon(
                obscureText ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye),
            onTap: onEyePressed,
          ),
        ),
      ),
    );
  }

  static Widget employerDrawer(
      {@required Function profileOnPressed,
      Function notificationsOnPressed,
      Function postNewJobsOnpressed,
      Function upcomingJobsOnPressed,
      Function pastJobsOnPressed,
      Function paymentsOnPressed,
      Function privacyPolicyOnPressed,
      Function logoutOnPressed}) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(color: Colors.lightBlue),
              child: InkWell(
                onTap: profileOnPressed,
                child: Center(
                  child: ListTile(
                    leading: Container(
                      width: 80,
                      height: 80,
                      padding: EdgeInsets.zero,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://cdn.wallpapersafari.com/36/90/pitIS3.jpg'),
                      ),
                    ),
                    title: Text(
                      "Wyat Morris",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Employer",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Notifications"),
              trailing: Container(
                height: 22,
                width: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.lightBlue),
                child: Center(
                    child: Text(
                  "5",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
              ),
              onTap: notificationsOnPressed,
            ),
            ListTile(
              leading: Icon(Icons.post_add),
              title: Text("Post New Jobs"),
              onTap: postNewJobsOnpressed,
            ),
            ListTile(
              leading: Icon(Icons.assignment_ind),
              title: Text("Upcoming Jobs"),
              onTap: upcomingJobsOnPressed,
            ),
            ListTile(
              leading: Icon(Icons.assignment_turned_in),
              title: Text("Past Jobs"),
              onTap: pastJobsOnPressed,
            ),
            ListTile(
              leading: Icon(Icons.payments_outlined),
              title: Text("Payments"),
              onTap: paymentsOnPressed,
            ),
            ListTile(
              leading: Icon(Icons.privacy_tip),
              title: Text("Privacy Policy"),
              onTap: privacyPolicyOnPressed,
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.red,
              ),
              title: Text(
                "Log Out",
                style: TextStyle(color: Colors.red),
              ),
              onTap: logoutOnPressed,
            ),
          ],
        ),
      ),
    );
  }

  static Widget employeeDrawer(
      {@required Function profileOnPressed,
      Function notificationsOnPressed,
      Function findNewJobsOnpressed,
      Function upcomingJobsOnPressed,
      Function pastJobsOnPressed,
      Function paymentsOnPressed,
      Function cashOutOnPressed,
      Function cashOutHistoryOnPressed,
      Function privacyPolicyOnPressed,
      Function logoutOnPressed}) {
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(color: Colors.lightBlue),
              child: InkWell(
                onTap: profileOnPressed,
                child: Center(
                  child: ListTile(
                    leading: Container(
                      width: 80,
                      height: 80,
                      padding: EdgeInsets.zero,
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://cdn.wallpapersafari.com/36/90/pitIS3.jpg'),
                      ),
                    ),
                    title: Text(
                      "Wyat Morris",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Employee",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text("Notifications"),
              trailing: Container(
                height: 22,
                width: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.lightBlue),
                child: Center(
                    child: Text(
                  "5",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
              ),
              onTap: notificationsOnPressed,
            ),
            ListTile(
              leading: Icon(Icons.work_outline),
              title: Text("Find Jobs"),
              onTap: findNewJobsOnpressed,
            ),
            ListTile(
              leading: Icon(Icons.assignment_ind),
              title: Text("Upcoming Jobs"),
              onTap: upcomingJobsOnPressed,
            ),
            ListTile(
              leading: Icon(Icons.assignment_turned_in),
              title: Text("Past Jobs"),
              onTap: pastJobsOnPressed,
            ),
            ListTile(
              leading: Icon(Icons.payments),
              title: Text("Payment Info"),
              onTap: paymentsOnPressed,
            ),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text("Cash Out"),
              onTap: cashOutOnPressed,
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: Text("Cash Out History"),
              onTap: cashOutHistoryOnPressed,
            ),
            ListTile(
              leading: Icon(Icons.privacy_tip),
              title: Text("Privacy Policy"),
              onTap: privacyPolicyOnPressed,
            ),
            ListTile(
              leading: Icon(
                Icons.logout,
                color: Colors.red,
              ),
              title: Text(
                "Log Out",
                style: TextStyle(color: Colors.red),
              ),
              onTap: logoutOnPressed,
            ),
          ],
        ),
      ),
    );
  }
}
