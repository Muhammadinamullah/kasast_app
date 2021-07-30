import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kasast/components/profile_image_picker.dart';
import 'package:kasast/ui/common/Reusable_widgets/reusable_appbar.dart';
import 'package:kasast/ui/common/ui_helpers.dart';

class EditProfile extends StatefulWidget {
  @override
  EditProfileState createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  bool updating = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _stateController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  FocusNode _nodeName = FocusNode();
  FocusNode _nodeEmail = FocusNode();
  FocusNode _nodeAddress = FocusNode();
  FocusNode _nodeState = FocusNode();
  FocusNode _nodeCountry = FocusNode();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: ReusedAppBar(
        title: 'Edit Profile',
      ),
      bottomSheet: Container(
        child: UiHelper.buttonBottom(
          context,
          Colors.lightBlue,
          Colors.white,
          "UPDATE",
          functionOnPressed: () {
            // Navigator.pushNamed(context, RoutePaths.MarkCompleteForEmployer);
          },
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                children: <Widget>[
                  ProfileImagePicker(),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: <Widget>[
                          UiHelper.nameTextFormField(
                            context,
                            focusNode: _nodeName,
                            nextFocusNode: _nodeEmail,
                            textEditingController: _nameController,
                          ),
                          UiHelper.marginVertical(10),
                          UiHelper.emailTextFormField(
                            context,
                            focusNode: _nodeEmail,
                            nextFocusNode: _nodeAddress,
                            textEditingController: _emailController,
                          ),
                          UiHelper.marginVertical(10),
                          UiHelper.editAddressTextFormField(
                            context,
                            focusNode: _nodeAddress,
                            nextFocusNode: _nodeState,
                            textEditingController: _addressController,
                          ),
                          UiHelper.marginVertical(10),
                          UiHelper.editStateTextFormField(
                            context,
                            focusNode: _nodeState,
                            nextFocusNode: _nodeCountry,
                            textEditingController: _stateController,
                          ),
                          UiHelper.marginVertical(10),
                          UiHelper.editCountryTextFormField(
                            context,
                            focusNode: _nodeCountry,
                            textEditingController: _countryController,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class UpdateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(top: 100),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 60,
        child: RaisedButton(
          child: Text(
            "UPDATE",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          onPressed: () {},
          color: theme.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(25),
            ),
          ),
        ),
      ),
    );
  }
}
