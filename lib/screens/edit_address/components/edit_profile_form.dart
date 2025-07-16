import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/components/custom_surfix_icon.dart';
import 'package:JDPoolsApplication/components/default_button.dart';
import 'package:JDPoolsApplication/components/form_error.dart';
import 'package:JDPoolsApplication/screens/complete_profile/complete_profile_screen.dart';
import '../../../screens/bloc/bloc.dart';
import '../../../screens/page/Gmap_page.dart';
import '../../../screens/page/main_gmap.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:flutter_session/flutter_session.dart';

class EditProfileForm extends StatefulWidget {
  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final _formKey = GlobalKey<FormState>();
  var id;
  String email;
  String password;
  String conform_password;
  bool remember = false;
  final List<String> errors = [];
  TextEditingController myController,myController1,myController2;

  String get str_email => myController.text;
  String get str_password => myController1.text;
  String get str_conform_passwordl => myController2.text;
  Future check()  async {
    id = "${await FlutterSession().get("userId")}";
    email = "${await FlutterSession().get("userEmail")}";
    password = "${await FlutterSession().get("userPassword")}";
    conform_password = "${await FlutterSession().get("userPassword")}";
    myController = TextEditingController()..text = "${await FlutterSession().get("userEmail")}";
    myController1 = TextEditingController()..text = "${await FlutterSession().get("userPassword")}";
    myController2 = TextEditingController()..text = "${await FlutterSession().get("userPassword")}";
    print(id+password);
    return id;
  }
 initState() {
    super.initState();
    // email = await FlutterSession().get("userEmail");
    // password = await FlutterSession().get("userPassword");
    // conform_password = await FlutterSession().get("userPassword");
    check().then((result) {
      print("result: $result");
      setState(() {
        id = result;

      });

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
    if(id != '') {
      return Form(
        key: _formKey,
        child: Column(
          children: [
            buildEmailFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildPasswordFormField(),
            SizedBox(height: getProportionateScreenHeight(30)),
            buildConformPassFormField(),
            FormError(errors: errors),
            SizedBox(height: getProportionateScreenHeight(30)),
            // TextField(
            //   maxLines: 1,
            //   onTap: () {
            //     Navigator.pushNamed(context, MyAppGmap.routeName);
            //
            //   },
            //    decoration: InputDecoration(
            //       prefixIcon:Icon(Icons.map),
            //
            //       //hintText: 'CoNstr@seña',
            //       border:OutlineInputBorder(
            //           borderSide: BorderSide(
            //               color:Colors.white
            //           ),
            //           borderRadius: BorderRadius.circular(10)
            //       )
            //   ),
            // ),

            SizedBox(height: getProportionateScreenHeight(30)),
            DefaultButton(
              text: "Continue",
              press: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  // if all are valid then go to success screen
                  Navigator.pushNamed(context, CompleteProfileScreen.routeName,arguments: SignUpArguments(username:email,password: password));
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

  TextFormField buildConformPassFormField() {
    return TextFormField(
      controller: myController2,
      obscureText: true,
      onSaved: (newValue) => conform_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && password == conform_password) {
          removeError(error: kMatchPassError);
        }
        conform_password = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: myController1,
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
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
      controller: myController,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
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
