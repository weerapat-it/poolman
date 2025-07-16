import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/components/custom_surfix_icon.dart';
import 'package:JDPoolsApplication/components/default_button.dart';
import 'package:JDPoolsApplication/components/form_error.dart';
import 'package:JDPoolsApplication/screens/otp/otp_screen.dart';
import '../../../screens/bloc/bloc.dart';
import '../../../screens/page/Gmap_page.dart';
import '../../../screens/page/main_gmap.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:flutter_session/flutter_session.dart';
import 'package:JDPoolsApplication/screens/sign_in/sign_in_screen.dart';
class EditForm extends StatefulWidget {
  static String routeName = "/edit_form";
  final String username;
  final String password;

  EditForm({Key key, @required this.username,@required this.password}) : super(key: key);
  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String firstName;
  String lastName;
  String phoneNumber;
  String address;
  String address2;
  String data;
  TextEditingController myController,myController1,myController2,myController3,myController4;

  String get str_firstName => myController.text=  "${FlutterSession().get("userFirstname").toString()}";
  String get str_lastName => myController1.text=  "${FlutterSession().get("userLastname").toString()}";
  String get str_phoneNumber => myController2.text=  "${FlutterSession().get("userTel").toString()}";
  String get str_address => myController3.text=  "${FlutterSession().get("userAddress").toString()}";
  var txt = TextEditingController();
  String get str_address2 => txt.text=  "${FlutterSession().get("userAddress2").toString()}";
  void initState() {
    // InsertMethod();
  }

  InsertMethod()async{
    String Url = "http://jdpoolswebservice.com/spintest/register.php";
    var res = await http.post(Uri.encodeFull(Url),headers:{"Accept" : "application/json"},
        body: {
          "id":"${await FlutterSession().get("userId")}",
          "username" : widget.username !=null?widget.username:"",
          "password" : widget.password !=null?widget.password:"",
          "firstName" : str_firstName,
          "lastName" : str_lastName,
          "phoneNumber" : str_phoneNumber,
          "address" : str_address,
          "address2" : str_address2,
        }
    );
    var resBody = json.decode(res.body);
    print(resBody);
    setState(() {
      // data = resBody;
    });
  }
  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(30)),
          TextField(
            maxLines: 1,
            onTap: () async {
              final result2 = await  Navigator.pushNamed(context, MyAppGmap.routeName);
              txt.text = result2;
            },
            controller: txt,
            decoration: InputDecoration(
                prefixIcon:Icon(Icons.map),

                //hintText: 'CoNstr@seña',
                border:OutlineInputBorder(
                    borderSide: BorderSide(
                        color:Colors.white
                    ),
                    borderRadius: BorderRadius.circular(10)
                )
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "continue",
            press: () {
              if (_formKey.currentState.validate()) {
                InsertMethod();

                Navigator.pushNamed(context, SignInScreen.routeName);
                // Navigator.pushNamed(context, OtpScreen.routeName,arguments: OtpScreenArguments(otp:phoneNumber));
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      controller: myController3,
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          myController3.text = value;
          removeError(error: kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Enter your phone address",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
        CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      controller: myController2,
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          myController2.text = value;
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      controller: myController1,
      onSaved: (newValue) => lastName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          myController1.text = value;

        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      controller: myController,
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          myController.text = value;
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
