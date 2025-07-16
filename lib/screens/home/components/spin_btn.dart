import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/components/product_card.dart';
import 'package:JDPoolsApplication/models/Product.dart';
import '../../../size_config.dart';
import 'icon_btn_spin.dart';
import '../../../size_config.dart';
import 'section_title.dart';
import 'package:JDPoolsApplication/screens/input_screen.dart';
import 'package:JDPoolsApplication/screens/imagePicker.dart';

import 'package:JDPoolsApplication/screens/cameraPicker.dart';
import 'package:JDPoolsApplication/screens/home.dart';
import 'package:JDPoolsApplication/screens/sign_in/sign_in_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter_session/flutter_session.dart';
class SpinBtn extends StatefulWidget {
  @override
  _SpinBtn createState() => _SpinBtn();
}

class _SpinBtn extends State<SpinBtn> {
  var userId;

  Future check()  async {
    userId = "${await FlutterSession().get("userId")}";


    print(userId);
    return userId;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Spin Test", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),

            child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                IconBtnWithCounterSpin(
                  svgSrc: "assets/icons/icon cam.svg",
                  // press: () => Navigator.of(context).pushNamedAndRemoveUntil( MyHomePageFirst.routeName, (Route<dynamic> route) => false),
                  press: () =>
                      check().then((result) {
                        print("result: $result");
                        setState(() {
                          userId = result;
                          if(userId != ''&& userId != null){
                            // Navigator.of(context).pushNamedAndRemoveUntil( HomeScreen.routeName, (Route<dynamic> route) => false);
                            // print(userId);

                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => cameraPicker()
                            ));
                          }else{
                            Navigator.of(context).pushNamed( SignInScreen.routeName);
                          }
                        });

                      }),

                ),
              SizedBox(width: getProportionateScreenWidth(20)),
              IconBtnWithCounterSpin(
                  svgSrc: "assets/icons/icon gall.svg",

                  press: () =>
                      check().then((result) {
                        print("result: $result");
                        setState(() {
                          userId = result;
                          if(userId != ''&& userId != null){
                            // Navigator.of(context).pushNamedAndRemoveUntil( HomeScreen.routeName, (Route<dynamic> route) => false);
                            // print(userId);

                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => imagePicker()
                            ));
                          }else{
                            Navigator.of(context).pushNamed( SignInScreen.routeName);
                          }
                        });

                      }),
                  //     Navigator.push(context, MaterialPageRoute(
                  //     builder: (context) => imagePicker()
                  // )),
                ),
              SizedBox(width: getProportionateScreenWidth(20)),
              IconBtnWithCounterSpin(
                  svgSrc: "assets/icons/icon input.svg",

                  press: () =>
                      check().then((result) {
                        print("result: $result");
                        setState(() {
                          userId = result;
                          if(userId != ''&& userId != null){
                            // Navigator.of(context).pushNamedAndRemoveUntil( HomeScreen.routeName, (Route<dynamic> route) => false);
                            // print(userId);

                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => inputScreen()
                            ));
                          }else{
                            Navigator.of(context).pushNamed( SignInScreen.routeName);
                          }
                        });

                      }),
                  //     Navigator.push(context, MaterialPageRoute(
                  //     builder: (context) => inputScreen()
                  // )),
                ),
            ],
            ),
        ),
      ],
    );
  }
}
