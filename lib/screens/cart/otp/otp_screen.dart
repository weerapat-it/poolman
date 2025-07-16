import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/size_config.dart';

import 'components/body.dart';

<<<<<<< HEAD
class OtpCartScreen extends StatelessWidget {
  static String routeName = "/otp_cart";
=======
class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
  @override
  Widget build(BuildContext context) {
    final OtpScreenArguments agrs =
        ModalRoute.of(context).settings.arguments;
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("OTP Verification"),
      ),
      body: Body(otp:agrs.otp),
    );
  }
}
class OtpScreenArguments {
  final String otp;

  OtpScreenArguments({@required this.otp});
}