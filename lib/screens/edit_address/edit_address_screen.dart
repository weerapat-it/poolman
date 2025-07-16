<<<<<<< HEAD
import 'package:JDPoolsApplication/constants.dart';
=======
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
import 'package:flutter/material.dart';

import 'components/body.dart';

<<<<<<< HEAD
class EditAddressScreen extends StatelessWidget {
  static String routeName = "/edit_address";
=======
class EditProfileScreen extends StatelessWidget {
  static String routeName = "/edit_profile";
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        iconTheme: IconThemeData(
          color: kPrimaryColor, //change your color here
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor2,
        title: Text("Edit address"),
=======
        title: Text("Edit Profile"),
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
      ),
      body: Body(),
    );
  }
}
