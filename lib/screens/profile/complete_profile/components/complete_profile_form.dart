import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/components/custom_surfix_icon.dart';
import 'package:JDPoolsApplication/components/default_button.dart';
import 'package:JDPoolsApplication/components/form_error.dart';
import 'package:JDPoolsApplication/screens/otp/otp_screen.dart';
<<<<<<< HEAD
import '../../../../screens/bloc/bloc.dart';
import '../../../../screens/page/Gmap_page.dart';
import '../../../../screens/page/main_gmap.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';
=======
import '../../../screens/bloc/bloc.dart';
import '../../../screens/page/Gmap_page.dart';
import '../../../screens/page/main_gmap.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:flutter_session/flutter_session.dart';
import 'package:JDPoolsApplication/screens/sign_in/sign_in_screen.dart';
class CompleteProfileForm extends StatefulWidget {
  final String username;
  final String password;

  CompleteProfileForm({Key key, @required this.username,@required this.password}) : super(key: key);
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
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
<<<<<<< HEAD
  var id;
  String userFirstname,userLastname,userTel,userAddress,userAddress2,taxId;
  String password;
  String conform_password;
  bool remember = false;
  TextEditingController myController,myController1,myController2,myController3,myController4,myController5;

  String get str_email => myController.text;
  String get str_password => myController1.text;
  String get str_conform_passwordl => myController2.text;
  Future check2()  async {
    id = "${await FlutterSession().get("userId")}";
    userFirstname = "${await FlutterSession().get("userFirstname")}";
    userLastname = "${await FlutterSession().get("userLastname")}";
    userTel = "${await FlutterSession().get("userTel")}";
    userAddress = "${await FlutterSession().get("userAddress")}";
    userAddress2 = "${await FlutterSession().get("userAddress2")}";
    taxId = "${await FlutterSession().get("taxId")}";
    myController = TextEditingController()..text = "${await FlutterSession().get("userFirstname")}";
    myController1 = TextEditingController()..text = "${await FlutterSession().get("userLastname")}";
    myController2 = TextEditingController()..text = "${await FlutterSession().get("userTel")}";
    myController3 = TextEditingController()..text = "${await FlutterSession().get("userAddress")}";
    myController4 = TextEditingController()..text = "${await FlutterSession().get("userAddress2")}";
    myController5 = TextEditingController()..text = "${await FlutterSession().get("taxId")}";
    // print(id+password);
    return id;
  }
  initState() {
    super.initState();
    // email = await FlutterSession().get("userEmail");
    // password = await FlutterSession().get("userPassword");
    // conform_password = await FlutterSession().get("userPassword");
    check2().then((result) {
      print("result: $result");
      setState(() {
        id = result;

      });

    });
=======
  void initState() {
    // InsertMethod();
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
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
<<<<<<< HEAD
    var url = Uri.https('jdpoolswebservice.com', '/spintest/update_profile.php', {'q': '{http}'});
    // String Url = "http://jdpoolswebservice.com/spintest/update_profile.php";
    var res = await http.post(url,headers:{"Accept" : "application/json"},
=======
    String Url = "http://jdpoolswebservice.com/spintest/register.php";
    var res = await http.post(Uri.encodeFull(Url),headers:{"Accept" : "application/json"},
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
        body: {
          // "customer":_dropDownValue,
          "user_ID" : userId !=null?userId:"",
          "tokenId" : tokenIds !=null?tokenIds:"",
<<<<<<< HEAD
          "firstName" : userFirstname !=null?userFirstname:"",
          "lastName" : userLastname !=null?userLastname:"",
          "phoneNumber" : userTel !=null?userTel:"",
          "address" : userAddress !=null?userAddress:"",
          "address2" : myController4.text !=null?myController4.text:"",
=======
          "username" : widget.username !=null?widget.username:"",
          "password" : widget.password !=null?widget.password:"",
          "firstName" : firstName !=null?firstName:"",
          "lastName" : lastName !=null?lastName:"",
          "phoneNumber" : phoneNumber !=null?phoneNumber:"",
          "address" : address !=null?address:"",
          "address2" : txt.text !=null?txt.text:"",
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
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
<<<<<<< HEAD
              myController4.text = result2;
            },
            controller: myController4,
            decoration: InputDecoration(
                prefixIcon:Icon(Icons.map),

=======
              txt.text = result2;
            },
            controller: txt,
            decoration: InputDecoration(
                prefixIcon:Icon(Icons.map),

                //hintText: 'CoNstr@seña',
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
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
<<<<<<< HEAD
                    FlutterSession().set("userFirstname","" );
                    FlutterSession().set("userLastname","");
                    FlutterSession().set("userTel","");
                    FlutterSession().set("userAddress","");
                    FlutterSession().set("userAddress2","");
                    FlutterSession().set("userFirstname",userFirstname );
                    FlutterSession().set("userLastname",userLastname);
                    FlutterSession().set("userTel",userTel);
                    FlutterSession().set("userAddress",userAddress);
                    FlutterSession().set("userAddress2",userAddress2);
=======
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
                  });
                });
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
<<<<<<< HEAD
      onSaved: (newValue) => userAddress = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          userAddress = value;
=======
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          address = value;
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
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
<<<<<<< HEAD

      controller: myController3..text,
=======
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Enter your phone address",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
<<<<<<< HEAD
        CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
=======
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
<<<<<<< HEAD
      onSaved: (newValue) => userTel = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          userTel = value;
=======
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          phoneNumber = value;
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
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
<<<<<<< HEAD

      controller: myController2..text,
=======
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
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
<<<<<<< HEAD
      onSaved: (newValue) => userLastname = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          userLastname = value;
        }
        return null;
      },

      controller: myController1..text,
=======
      onSaved: (newValue) => lastName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          lastName = value;
        }
        return null;
      },
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
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
<<<<<<< HEAD
      onSaved: (newValue) => userFirstname = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          userFirstname = value;
=======
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          firstName = value;
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
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
<<<<<<< HEAD

      controller: myController..text,
=======
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
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
