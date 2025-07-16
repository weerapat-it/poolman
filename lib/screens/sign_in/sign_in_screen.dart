import 'package:flutter/material.dart';

import 'components/body.dart';

import '../../constants.dart';
class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kPrimaryColor2, //change your color here
        ),
        title: Text("Sign In"),
      ),
      body: Body(),
    );
  }
}
