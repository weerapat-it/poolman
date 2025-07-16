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
import 'package:smooth_star_rating/smooth_star_rating.dart';

import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
class RatingForm extends StatefulWidget {
  final String value;

  const RatingForm({Key key, @required this.value}) : super(key: key);


  @override
  _RatingFormState createState() => _RatingFormState();
}

class _RatingFormState extends State<RatingForm> {
  var valuedata;
  var userId;
  void initState() {

    // Future.delayed(Duration.zero, () => InsertMethod());
    // WidgetsBinding.instance.addPostFrameCallback((_) => InsertMethod());
    //  InsertMethod();
    InsertMethod().then((result) {
      print("result: $result");
      setState(() {valuedata = result;});
    });

    super.initState();
  }
  List data = [];
  // double valuedata;
  Future InsertMethod() async{

    userId = "${await FlutterSession().get("userId")}";
    var url = Uri.https('jdpoolswebservice.com', '/spintest/cal_spintest.php', {'q': '{http}'});
    // String Url = "http://jdpoolswebservice.com/spintest/cal_spintest.php";
    var res = await http.post(url,headers:{"Accept" : "application/json"},
        body: {
          // "customer":_dropDownValue,
          "userid":userId,
          "data" : widget.value,
        }
    );
    var resBody = json.decode(res.body);

    // print("aaaa"+resBody);

    data = resBody;
    // valuedata = (data?.length > 0 ? double.parse(data[2].toString()).toDouble() : 0.0);
    // setState(() {
    //   data = resBody;
    //   valuedata = (data?.length > 0 ? double.parse(data[2].toString()).toDouble() : 0.0);
    // });
    return (data?.length > 0 ? data[2] : "0");
  }
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  String conform_password;
  bool remember = false;
  final List<String> errors = [];

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
if(valuedata != null) {
  return Form(
    key: _formKey,
    child: Padding(
      padding:
      EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Column(
        children: [
          Row(
            children: [
              // buildEmailFormField(),
              Text(
                  'Quality Rating',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)

              ),

              SizedBox(width: getProportionateScreenWidth(5)),


              Container(
                child : new Flexible(
                  child:  SmoothStarRating(

                      allowHalfRating: false,
                      onRated: (v) {

                      },

                      starCount: 5,
                      rating: double.parse(valuedata.toString()).toDouble(),
                      size: 40.0,
                      isReadOnly:true,
                      filledIconData: Icons.star,
                      halfFilledIconData: Icons.star,
                      color: Colors.green,
                      borderColor: Colors.green,
                      spacing:0.0
                  ),
                ),
              ),
              SizedBox(width: getProportionateScreenWidth(5)),

            ],
          ),


          SizedBox(height: getProportionateScreenHeight(10)),
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


        ],

      ),
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
      obscureText: true,
      onSaved: (newValue) => conform_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        }
        conform_password = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        }
        password = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
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
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        // floatingLabelBehavior: FloatingLabelBehavior.always,
        // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
