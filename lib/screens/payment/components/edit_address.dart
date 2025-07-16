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
class EditAddressForm extends StatefulWidget {

  static String routeName = "/edit_address";
  // final String username;
  // final String password;
  //
  // EditAddressForm({Key key, @required this.username,@required this.password}) : super(key: key);
  @override
  _EditAddressFormState createState() => _EditAddressFormState();
}

class _EditAddressFormState extends State<EditAddressForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String firstName;
  String lastName;
  String phoneNumber;
  String address;
  String data;
  var txt = TextEditingController();
  var tokenIds,userId;
  List data2 = [];
  void initState() {
    // InsertMethod();
  }
  Future check()  async {
    tokenIds = "${await FlutterSession().get("tokenId")}";

    userId = "${await FlutterSession().get("userId")}";
    data2.add(tokenIds.toString());
    data2.add(userId.toString());

    print(data2);
    return data2;
  }
  InsertMethod()async{
    var url = Uri.https('jdpoolswebservice.com', '/spintest/register.php', {'q': '{http}'});
    // String Url = "http://jdpoolswebservice.com/spintest/register.php";
    var res = await http.post(url,headers:{"Accept" : "application/json"},
        body: {
          // "customer":_dropDownValue,
          "user_ID" : userId !=null?userId:"",
          "tokenId" : tokenIds !=null?tokenIds:"",
          // "username" : widget.username !=null?widget.username:"",
          // "password" : widget.password !=null?widget.password:"",
          "firstName" : firstName !=null?firstName:"",
          "lastName" : lastName !=null?lastName:"",
          "phoneNumber" : phoneNumber !=null?phoneNumber:"",
          "address" : address !=null?address:"",
          "address2" : txt.text !=null?txt.text:"",
        }
    );
    var resBody = json.decode(res.body);
    print(resBody);
    setState(() {
      data = resBody;
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
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.03),
                Text("Complete Profile", style: headingStyle),
                Text(
                  "Complete your details or continue  \nwith social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.06),
                // CompleteProfileForm(username:username,password:password),
              Form(
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
                          // InsertMethod();
                          check().then((result) {
                            // print("result: $result");
                            setState(() {
                              tokenIds = result[0];
                              userId = result[1];

                              InsertMethod();
                            });
                          });
                          Navigator.pushNamed(context, SignInScreen.routeName);
                          // Navigator.pushNamed(context, OtpScreen.routeName,arguments: OtpScreenArguments(otp:phoneNumber));
                        }
                      },
                    ),
                  ],
                ),
              ),
                SizedBox(height: getProportionateScreenHeight(30)),
                Text(
                  "By continuing your confirm that you agree \nwith our Term and Condition",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          address = value;
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
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          phoneNumber = value;
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
      onSaved: (newValue) => lastName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          lastName = value;
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
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          firstName = value;
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
