import 'package:flutter/material.dart';

import 'components/body.dart';
import '../../../constants.dart';
class SignUpCartScreen extends StatelessWidget {
  static String routeName = "/sign_up_cart";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kPrimaryColor2, //change your color here
        ),
        title: Text("Sign Up"),
      ),
      body: Body(),
    );
  }
}
