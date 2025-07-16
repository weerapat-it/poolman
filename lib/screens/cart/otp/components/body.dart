import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/constants.dart';
import 'package:JDPoolsApplication/size_config.dart';

// import 'package:firebase_auth/firebase_auth.dart';
import 'otp_form.dart';

class Body extends StatelessWidget {
  String phoneNo;
  String smsOTP;
  String verificationId;
  String errorMessage = '';
  // FirebaseAuth _auth = FirebaseAuth.instance;

  final String otp;

  Body({Key key, @required this.otp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Text(
                "OTP Verification",
                style: headingStyle,
              ),
              Text("We sent your code to "+otp+" ***"),
              buildTimer(),
              OtpForm(otp:otp),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              GestureDetector(
                onTap: () {
                  // OTP code resend
                },
                child: Text(
                  "Resend OTP Code",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: Duration(seconds: 30),
          builder: (_, value, child) => Text(
            "00:${value.toInt()}",
            style: TextStyle(color: kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
