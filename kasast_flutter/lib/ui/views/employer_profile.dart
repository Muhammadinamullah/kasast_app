import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kasast/business%20logic/models/user_profile.dart';
import 'package:kasast/business%20logic/view_models/employer_profile_viewmodel.dart';
import 'package:kasast/components/emloyer_profile_container.dart';
import 'package:kasast/components/employer_profile_rating.dart';

class EmployerProfile extends StatefulWidget {
  @override
  EmployerProfileState createState() => EmployerProfileState();
}

class EmployerProfileState extends State<EmployerProfile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: FutureBuilder(
        future: EmployerProfileViewModel().getProfile(),
        builder: (BuildContext context, AsyncSnapshot<UserProfile> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              if (snapshot.hasError)
                return Center(child: Text('Error: ${snapshot.error}'));
              else
                return Column(children: <Widget>[
                  EmployerProfileContainer(
                    userProfile: snapshot.data,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15), // if you need this
                        side: BorderSide(
                          color: Colors.grey.withOpacity(.2),
                          width: 1,
                        ),
                      ),
                      child: EmployerProfileRating(
                        userProfile: snapshot.data,
                      ),
                    ),
                  ),
                ]);
          }
        },
      ),
    ));
  }
}
