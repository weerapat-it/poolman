import 'package:flutter/material.dart';

import 'components/body.dart';

import '../../../constants.dart';
class SignInCartScreen extends StatelessWidget {
  static String routeName = "/sign_in_cart";
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
