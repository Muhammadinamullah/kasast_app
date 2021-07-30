import 'package:flutter/material.dart';
import 'package:kasast/core/constants/app_constants.dart';

class ReusedAppBar extends StatelessWidget implements PreferredSize {
  final title;

  const ReusedAppBar({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Colors.lightBlue,
      title: Text(
        title,
        style: kAppbarTextStyle,
      ),
      shape: kAppbarShape,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
