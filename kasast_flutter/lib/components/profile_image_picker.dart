import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImagePicker extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<ProfileImagePicker> {
  File imageFileAvater;
  bool isLoading = false;
  String photoUrl =
      'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500';

  @override
  void initState() {
    super.initState();
  }

  Future getImage() async {
    PickedFile newImageFile =
        await ImagePicker().getImage(source: ImageSource.gallery);

    if (newImageFile != null) {
      setState(() {
        this.imageFileAvater = File(newImageFile.path);
        isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //ThemeData theme = Theme.of(context);
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          (imageFileAvater == null)
              ? (photoUrl != "")
                  ? Material(
                      child: CachedNetworkImage(
                        imageUrl: photoUrl,
                        placeholder: (context, url) => Container(
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.lightBlueAccent),
                          ),
                          width: 100,
                          height: 100,
                          padding: EdgeInsets.all(20.0),
                        ),
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(125.0)),
                      clipBehavior: Clip.hardEdge,
                    )
                  : Icon(
                      Icons.account_circle,
                      size: 50.0,
                      color: Colors.grey,
                    )
              : Material(
                  //display the new updated file
                  child: Image.file(
                    imageFileAvater,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(125.0)),
                  clipBehavior: Clip.hardEdge,
                ),
          IconButton(
            icon: Icon(
              Icons.camera_alt,
              color: Colors.white,
            ),
            onPressed: getImage,
            padding: EdgeInsets.all(0.0),
            splashColor: Colors.transparent,
            highlightColor: Colors.grey,
            iconSize: 40,
          )
        ],
      ),
      width: double.infinity,
      margin: EdgeInsets.all(20.0),
    );
  }
}
