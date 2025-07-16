import 'package:flutter/material.dart';
import 'size_config.dart';
// const kPrimaryColorGreen = Color(0xFFd6df21);

const kPrimaryColorGreen = Color(0xFF648e3d);
// const kPrimaryColor2 = Color(0xFF0E024C);
const texthead = Color(0xff2f76b6);
const textsubhead = Color(0xff8e8e8e);
const kPrimaryColor2 = Color(0xFF63b6e6);
const bgjob = Color(0xfff5f8fb);
// const kPrimaryColor = Color(0xFFf17b26);
const kPrimaryColorText = Color(0xFF648e3d);

const kPrimaryColor = Color(0xffffffff);
const kwhite = Color(0xffffffff);

const colorback1 = Color(0xFF5896D0);
const colorback2 = Color(0xFF60A3E1);
const colorback3 = Color(0xFF68B0F5);
const kPrimaryColorbtn2 = Color(0xFF2E07F8);
const kPrimaryColorbtn = Color(0x45f17b26);
const kPrimaryLightColor = Color(0xFF2196F3);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFF2196F3), Color(0xFF0E024C)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);
const bgColor = Color(0xFFEEEEEE);

// final Color inActiveIconColor = Color(0xFFB6B6B6);

final Color inActiveIconColor = Color(0xFF757575);
final Color ActiveIconColor = Color(0xFF4082CB);
const kAnimationDuration = Duration(milliseconds: 200);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";
const String kUsenamePassNullError = "Username or Password incorrect !!";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}
