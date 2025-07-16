import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:JDPoolsApplication/utils/uidata.dart';
=======
import 'package:flutter_uikit/utils/uidata.dart';
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc

class MyAboutTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AboutListTile(
<<<<<<< HEAD
      // applicationIcon: FlutterLogo(
      //   colors: Colors.yellow,
      // ),
      // icon: FlutterLogo(
      //   colors: Colors.yellow,
      // ),
=======
      applicationIcon: FlutterLogo(
        colors: Colors.yellow,
      ),
      icon: FlutterLogo(
        colors: Colors.yellow,
      ),
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
      aboutBoxChildren: <Widget>[
        SizedBox(
          height: 10.0,
        ),
        Text(
          "Developed By Pawan Kumar",
        ),
        Text(
          "MTechViral",
        ),
      ],
      applicationName: UIData.appName,
      applicationVersion: "1.0.1",
      applicationLegalese: "Apache License 2.0",
    );
  }
}
