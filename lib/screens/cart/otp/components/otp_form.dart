import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/components/default_button.dart';
import 'package:JDPoolsApplication/size_config.dart';

// import 'package:firebase_auth/firebase_auth.dart';
import '../../../constants.dart';

class OtpForm extends StatefulWidget {
  final String otp;
  const OtpForm({
    Key key, @required this.otp
  }) : super(key: key);

  @override
  _OtpFormState createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  String phoneNumber, verificationId;
  String otp, authStatus = "";
  String digit1,digit2,digit3,digit4;

  // Future<void> verifyPhoneNumber(BuildContext context) async {
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //     phoneNumber: phoneNumber,
  //     timeout: const Duration(seconds: 15),
  //     verificationCompleted: (AuthCredential authCredential) {
  //       setState(() {
  //         authStatus = "Your account is successfully verified";
  //       });
  //     },
  //     verificationFailed: ( authException) {
  //       setState(() {
  //         authStatus = "Authentication failed";
  //       });
  //     },
  //     codeSent: (String verId, [int forceCodeResent]) {
  //       verificationId = verId;
  //       setState(() {
  //         authStatus = "OTP has been successfully send";
  //       });
  //       // otpDialogBox(context).then((value) {});
  //     },
  //     codeAutoRetrievalTimeout: (String verId) {
  //       verificationId = verId;
  //       setState(() {
  //         authStatus = "TIMEOUT";
  //       });
  //     },
  //   );
  // }
  //
  // Future<void> signIn(String otp) async {
  //   await FirebaseAuth.instance
  //       .signInWithCredential(PhoneAuthProvider.getCredential(
  //     verificationId: verificationId,
  //     smsCode: otp,
  //   ));
  // }

  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;

  @override
  void initState() {
    super.initState();
    phoneNumber = otp;
    // verifyPhoneNumber(context);
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  autofocus: true,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    digit1 = value;
                    nextField(value, pin2FocusNode);
                  },
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin2FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    digit2 = value;
                    nextField(value, pin3FocusNode);},
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin3FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    digit3 = value;
                  nextField(value, pin4FocusNode);},
                ),
              ),
              SizedBox(
                width: getProportionateScreenWidth(60),
                child: TextFormField(
                  focusNode: pin4FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 24),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    digit4 = value;
                    if (value.length == 1) {
                      pin4FocusNode.unfocus();
                      // Then you need to check is the code is correct or not
                    }
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.15),
          DefaultButton(
            text: "Continue",
            press: () {
              // signIn(digit1+digit2+digit3+digit4);
            },
          )
        ],
      ),
    );
  }
}
