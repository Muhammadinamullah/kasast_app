import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:intl/intl.dart';
import 'package:kasast/business%20logic/view_models/job_post_detail_viewmodel.dart';
import 'package:kasast/core/constants/app_constants.dart';
import 'package:kasast/core/constants/map_config.dart';
import 'package:kasast/ui/common/ui_helpers.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class JobPostDetail extends StatefulWidget {
  @override
  JobPostDetailState createState() => JobPostDetailState();
}

final homeScaffoldKey = GlobalKey<ScaffoldState>();

class JobPostDetailState extends State<JobPostDetail> {
  bool processingComplete = false;
  int totalHours = 0;
  int pricePerHour = 0;
  String initialTime = '';
  String onlyDate;
  String onlyTime;
  String initialLocation = '';
  double lat;
  double lng;
  DateTime now = new DateTime.now();

  TextEditingController _taskTitleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _neighbourController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _hoursController = TextEditingController();
  FocusNode _nodeTaskTitle = FocusNode();
  FocusNode _nodeDescription = FocusNode();
  FocusNode _nodeNeighbour = FocusNode();
  FocusNode _nodePrice = FocusNode();
  FocusNode _nodeHours = FocusNode();

  TextEditingController _dateTimeController;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    print(initialTime);
    return Scaffold(
      key: homeScaffoldKey,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        title: Text(
          'Post Task',
          style: kAppbarTextStyle,
        ),
        shape: kAppbarShape,
        centerTitle: true,
      ),
      body: KeyboardActions(
        config: KeyboardActionsConfig(actions: [
          KeyboardActionsItem(focusNode: _nodePrice),
          KeyboardActionsItem(focusNode: _nodeHours),
        ], keyboardBarColor: Colors.grey),
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        UiHelper.taskTitleTextFormField(context,
                            focusNode: _nodeTaskTitle,
                            nextFocusNode: _nodeDescription,
                            textEditingController: _taskTitleController),
                        UiHelper.descriptionTextFormField(context,
                            focusNode: _nodeDescription,
                            textEditingController: _descriptionController),
                        UiHelper.locationTextFormField(context,
                            initialLocation: initialLocation,
                            onPress: _handlePressButton),
                        UiHelper.neighbourHoodTextFormField(context,
                            textEditingController: _neighbourController),
                        UiHelper.timeTextFormField(context,
                            initialTime: initialTime,
                            onPress: getDateTimePicker),
                        UiHelper.priceTextFormField(context,
                            onValueChanged: onPriceValueChanged,
                            focusNode: _nodePrice,
                            nextFocusNode: _nodeHours,
                            textEditingController: _priceController),
                        UiHelper.hourTextFormField(context,
                            onValueChanged: onHourValueChanged,
                            focusNode: _nodeHours,
                            textEditingController: _hoursController),
                        Padding(
                            padding:
                                EdgeInsets.only(left: 20, right: 20, top: 40),
                            child: Container(
                              color: Colors.grey[300],
                              height: 70,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 10, right: 10, top: 15),
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Total Budget",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Based on \$$pricePerHour / hour rate for $totalHours hour.",
                                          style: TextStyle(
                                              color: Colors.black45,
                                              fontSize: 10),
                                        )
                                      ],
                                    ),
                                    Text(
                                      "\$${totalHours * pricePerHour}",
                                      style: TextStyle(
                                          color: theme.primaryColor,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            )),
                        Padding(
                          padding: EdgeInsets.only(top: 50),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 60,
                            child: ElevatedButton(
                              child: !processingComplete
                                  ? Text(
                                      "SUBMIT",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w900,
                                          fontFamily: "Avenir"),
                                    )
                                  : CircularProgressIndicator(
                                      //valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
                                      backgroundColor: Colors.white,
                                    ),
                              onPressed: () {
                                print(
                                  "latitude is:" + lat.toString(),
                                );
                                print("logitude is:" + lng.toString());
                                if (_formKey.currentState.validate()) {
                                  String taskTitle = _taskTitleController.text;
                                  String description =
                                      _descriptionController.text;
                                  String latitude = lat.toString();
                                  String longitude = lng.toString();
                                  String neighbourHood =
                                      _neighbourController.text;
                                  String time = onlyTime;
                                  String date = onlyDate;
                                  String price = _priceController.text;
                                  String hours = _hoursController.text;
                                  setState(() {
                                    processingComplete = true;
                                  });
                                  JobPostDetailViewModel().createJob(
                                      taskTitle: taskTitle,
                                      description: description,
                                      latitude: latitude,
                                      longitude: longitude,
                                      neighbourHood: neighbourHood,
                                      startTime: time,
                                      startDate: date,
                                      pricePerHour: price,
                                      hours: hours);
                                  Navigator.pushReplacementNamed(
                                      context, RoutePaths.EmployerJobsList);
                                } else {
                                  String message = 'Something went wrong';
                                  setState(
                                    () {
                                      processingComplete = false;
                                    },
                                  );
                                  showSnackBar(message);
                                }
                              },
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        theme.primaryColor),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(25),
                                    ),
                                  ),
                                ),
                              ),
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

  Future<void> _handlePressButton() async {
    // show input autocomplete with selected mode
    // then get the Prediction selected
    Prediction p = await PlacesAutocomplete.show(
      //offset: 0,
      //radius: 1000,
      types: [],
      strictbounds: false,
      region: 'ar',
      context: context,
      apiKey: MapCredentials.placeKey,
      onError: onError,
      mode: Mode.overlay,
      language: "en",
      decoration: InputDecoration(
        hintText: 'Search',
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      components: [],
    );

    displayPrediction(p, homeScaffoldKey.currentState);
  }

  Future<Null> displayPrediction(Prediction p, ScaffoldState scaffold) async {
    if (p != null) {
      // get detail (lat/lng)
      GoogleMapsPlaces _places = GoogleMapsPlaces(
        apiKey: MapCredentials.placeKey,
        apiHeaders: await GoogleApiHeaders().getHeaders(),
      );
      PlacesDetailsResponse detail =
          await _places.getDetailsByPlaceId(p.placeId);
      setState(() {
        initialLocation = p.description;
        lat = detail.result.geometry.location.lat;
        lng = detail.result.geometry.location.lng;
      });
    }
  }

  void onError(PlacesAutocompleteResponse response) {
    homeScaffoldKey.currentState.showSnackBar(
      SnackBar(content: Text(response.errorMessage)),
    );
  }

  getDateTimePicker() {
    DatePicker.showDateTimePicker(context,
        showTitleActions: true,
        minTime: DateTime(now.year, now.month, now.day),
        maxTime: DateTime(2019, 6, 7),
        onChanged: (date) {}, onConfirm: (date) {
      final DateFormat onlyDateformatter = DateFormat('yyyy-MM-dd');
      final DateFormat onlyTimeformatter = DateFormat.Hms();
      final String formattedDate = onlyDateformatter.format(date);
      final String formattedTime = onlyTimeformatter.format(now);
      print(formattedTime);
      print(formattedDate);
      setState(() {
        initialTime = date.toString();
        onlyDate = formattedDate;
        onlyTime = formattedTime;
      });
      print(date.toString());
    }, currentTime: DateTime.now(), locale: LocaleType.en);
  }

  onPriceValueChanged(value) {
    setState(() {
      pricePerHour = int.parse(value);
      print(pricePerHour);
    });
  }

  onHourValueChanged(value) {
    setState(() {
      totalHours = int.parse(value);
    });
  }

  void showSnackBar(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
