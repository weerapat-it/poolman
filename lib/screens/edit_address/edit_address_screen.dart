import 'package:JDPoolsApplication/constants.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class EditAddressScreen extends StatelessWidget {
  static String routeName = "/edit_address";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kPrimaryColor, //change your color here
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor2,
        title: Text("Edit address"),
      ),
      body: Body(),
    );
  }
}
