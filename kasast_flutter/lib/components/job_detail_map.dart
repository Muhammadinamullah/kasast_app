import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class JobDetailMap extends StatefulWidget {


  final location;
  JobDetailMap({this.location});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<JobDetailMap> {
  GoogleMapController _controller;
  CameraPosition _initialPosition;
  List<Marker> markers = [];
  @override
  void initState() {
    super.initState();
    updateIu(widget.location);
  }
  updateIu(dynamic location) {
    markers.add(
      Marker(
        infoWindow: InfoWindow(title: "It's you"),
        position: LatLng(31.4567512, 74.2959367),
        markerId: MarkerId("MyMarker"),
        draggable: false,
        onTap: () {
          print("marker tap");
        },
      ),
    );
    _initialPosition = CameraPosition(
      target: LatLng(31.4567512, 74.2959367),
      zoom: 15.0,
    );
  }


  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Card(
        color: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15), // if you need this
          side: BorderSide(
            color: Colors.grey.withOpacity(.2),
            width: 1,
          ),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        "Map",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
              Expanded(
                child: GoogleMap(
                  initialCameraPosition: _initialPosition,
                  mapType: MapType.normal,
                  onMapCreated: (controller) {
                    setState(() {
                      _controller = controller;
                    });
                  },
                  markers: markers.toSet(),
                  onTap: (cordinate) {
                    _controller.animateCamera(CameraUpdate.newLatLng(cordinate));
                    //addMarker(cordinate);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
