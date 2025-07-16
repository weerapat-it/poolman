import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/size_config.dart';

import 'components/body.dart';

class OtpCartScreen extends StatelessWidget {
  static String routeName = "/otp_cart";
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