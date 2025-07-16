import 'package:flutter/material.dart';

import 'components/body.dart';
<<<<<<< HEAD
import '../../../constants.dart';
class SignUpCartScreen extends StatelessWidget {
  static String routeName = "/sign_up_cart";
=======

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
<<<<<<< HEAD
        iconTheme: IconThemeData(
          color: kPrimaryColor2, //change your color here
        ),
=======
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
        title: Text("Sign Up"),
      ),
      body: Body(),
    );
  }
}
