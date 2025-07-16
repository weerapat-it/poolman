import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/components/custom_surfix_icon.dart';
import 'package:JDPoolsApplication/components/form_error.dart';
import 'package:JDPoolsApplication/helper/keyboard.dart';
import 'package:JDPoolsApplication/screens/forgot_password/forgot_password_screen.dart';
import 'package:JDPoolsApplication/screens/login_success/login_success_screen.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:JDPoolsApplication/screens/sign_in/sign_in_screen.dart';
<<<<<<< HEAD
import '../../../../components/default_button.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';
=======
import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
<<<<<<< HEAD
import 'package:progress_dialog/progress_dialog.dart';
=======

>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
import 'package:JDPoolsApplication/screens/home/home_screen.dart';
class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
<<<<<<< HEAD

}

class _SignFormState extends State<SignForm> {
  ProgressDialog pr;
=======
}

class _SignFormState extends State<SignForm> {
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc

  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
  List data = [];
  var userId,tokenIds,status;
  String tokenId;
  List data2 = [];
  final List<String> errors = [];
<<<<<<< HEAD

  Future check()  async {
    userId = "${await FlutterSession().get("userId")}";
    tokenIds = "${await FlutterSession().get("tokenId")}";
    status = "${await FlutterSession().get("status")}";
=======
  Future check()  async {
    userId = await FlutterSession().get("userId");
    tokenIds = await FlutterSession().get("tokenId");
    status = await FlutterSession().get("status");
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
    data2.add(userId.toString());
    data2.add(tokenIds.toString());
    data2.add(status.toString());

    print(data2);
    return data2;
  }

  CheckLoginMethod()async{
<<<<<<< HEAD
    // String Url = "http://jdpoolswebservice.com/spintest/check_login.php";
    var url = Uri.https('jdpoolswebservice.com', '/spintest/check_login.php', {'q': '{http}'});
    var res = await http.post(url,headers:{"Accept" : "application/json"},
=======
    String Url = "http://jdpoolswebservice.com/spintest/check_login.php";
    var res = await http.post(Uri.encodeFull(Url),headers:{"Accept" : "application/json"},
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
        body: {
          // "customer":_dropDownValue,
          "username" : email !=null?email:"",
          "password" : password !=null?password:"",
          "token" : tokenIds !=null?tokenIds :"",

        }
    );
    var resBody = json.decode(res.body);
    // print(resBody);
    setState(()  {
      data = resBody;
      if(data[0] == "true") {
         FlutterSession().set("userId",data[1].toString() );
         FlutterSession().set("userEmail",data[2]);
         FlutterSession().set("userPassword",data[3]);
         FlutterSession().set("userFirstname",data[4] );
         FlutterSession().set("userLastname",data[5]);
         FlutterSession().set("userTel",data[6]);
         FlutterSession().set("userAddress",data[7]);
         FlutterSession().set("userAddress2",data[8]);
         FlutterSession().set("userPic",data[9]);
         FlutterSession().set("status",data[10]);
         FlutterSession().set("tokenId",data[11]);
<<<<<<< HEAD
         FlutterSession().set("taxId",data[12]);
         FlutterSession().set("permission",data[13]);
         Future.delayed(Duration(seconds: 3)).then((value) {
           pr.hide().whenComplete(() {
             Navigator.of(context).pushNamedAndRemoveUntil(
                 LoginSuccessScreen.routeName, (
                 Route<dynamic> route) => false);
           });
         });
        // Navigator.of(context).pushNamedAndRemoveUntil(
        //     LoginSuccessScreen.routeName, (
        //     Route<dynamic> route) => false);
        removeError(error: kUsenamePassNullError);
      }else{
        pr.hide().whenComplete(() {
          addError(error: kUsenamePassNullError);
        });

=======
        Navigator.of(context).pushNamedAndRemoveUntil(
            LoginSuccessScreen.routeName, (
            Route<dynamic> route) => false);
        removeError(error: kUsenamePassNullError);
      }else{
        addError(error: kUsenamePassNullError);
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
      }
    });
  }

  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance.addPostFrameCallback((_){
    //   check();
    check().then((result) {
      print("result: $result");
      setState(() {
        status = result[2];
        tokenIds = result[1];
        userId = result[0];
      });
<<<<<<< HEAD
      if(status != '0'&& status != "null"){
        // Navigator.of(context).pushNamedAndRemoveUntil( HomeScreen.routeName, (Route<dynamic> route) => false);
        print(userId);
=======
      if(status != '0'&& status != null){
        Navigator.of(context).pushNamedAndRemoveUntil( HomeScreen.routeName, (Route<dynamic> route) => false);
        // print(userId);
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
      }else{

      }
    });
    //
    // });
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
<<<<<<< HEAD
    pr = new ProgressDialog(context, showLogs: true);
    pr.style(message: 'Please wait...');
=======
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
    if(userId != '' || userId != null) {
      return Form(
        key: _formKey,
        child: Column(
          children: [
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
<<<<<<< HEAD
            // Row(
            //   children: [
            //     Checkbox(
            //       value: remember,
            //       activeColor: kPrimaryColor,
            //       onChanged: (value) {
            //         setState(() {
            //           remember = value;
            //         });
            //       },
            //     ),
            //     Text("Remember me"),
            //     Spacer(),
            //     GestureDetector(
            //       onTap: () =>
            //           Navigator.pushNamed(
            //               context, ForgotPasswordScreen.routeName),
            //       child: Text(
            //         "Forgot Password",
            //         style: TextStyle(decoration: TextDecoration.underline),
            //       ),
            //     )
            //   ],
            // ),
=======
            Row(
              children: [
                Checkbox(
                  value: remember,
                  activeColor: kPrimaryColor,
                  onChanged: (value) {
                    setState(() {
                      remember = value;
                    });
                  },
                ),
                Text("Remember me"),
                Spacer(),
                GestureDetector(
                  onTap: () =>
                      Navigator.pushNamed(
                          context, ForgotPasswordScreen.routeName),
                  child: Text(
                    "Forgot Password",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
            FormError(errors: errors),
            SizedBox(height: getProportionateScreenHeight(20)),
            DefaultButton(
              text: "Continue",
              press: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  // _save('0');
                  // if all are valid then go to success screen
                  KeyboardUtil.hideKeyboard(context);
                  // Navigator.pushNamed(context, LoginSuccessScreen.routeName);
<<<<<<< HEAD
                  pr.show();

                      CheckLoginMethod();

=======
                  CheckLoginMethod();
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
                  // if(data == "true") {
                  //   Navigator.of(context).pushNamedAndRemoveUntil(
                  //       LoginSuccessScreen.routeName, (
                  //       Route<dynamic> route) => false);
                  //   removeError(error: kUsenamePassNullError);
                  // }else{
                  //   addError(error: kUsenamePassNullError);
                  // }
                }
              },
            ),
          ],
        ),
      );
    }else{
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
        ),
      );
    }
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
          password = value;
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
          password = value;
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
          email = value;
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
          email = value;
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
