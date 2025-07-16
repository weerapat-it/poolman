import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/screens/cart/cart_screen.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:JDPoolsApplication/screens/mail/mail_screen.dart';
import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';
import 'package:JDPoolsApplication/screens/sign_in/sign_in_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:JDPoolsApplication/constants.dart';
import 'dart:convert';
import 'package:flutter_session/flutter_session.dart';

import 'package:JDPoolsApplication/screens/home/components/search_field.dart';
class HomeHeader extends StatefulWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);
  @override
  _HomeHeader createState() => _HomeHeader();
}

class _HomeHeader extends State<HomeHeader> {
  var userId,tokenIds,status;
  String tokenId;
  List data = [];
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  Future check()  async {
    userId = "${await FlutterSession().get("userId")}";
    tokenIds = "${await FlutterSession().get("tokenId")}";
    status = "${await FlutterSession().get("status")}";
    data.add(userId.toString());
    data.add(tokenIds.toString());
    data.add(status.toString());

    print(data);
    return data;
  }
   guest()  async {
     tokenId = await _firebaseMessaging.getToken();


    print(tokenId);
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: BoxDecoration(
        color:kPrimaryColor2,
        boxShadow: <BoxShadow>[
        BoxShadow(
        color: Color(0xFF979797).withOpacity(0.3),
          offset: const Offset(0, 5),
          blurRadius: 10),
          ],

          ),
    child:Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20),vertical:getProportionateScreenHeight(10) ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(search: null,),
          IconBtnWithCounter(
            svgSrc: "assets/icons/User Icon.svg",

            // numOfitem: 3,
            press: () =>
            check().then((result) {
                  print("result: "+result[0]+result[1]+result[2]);
                  setState(() {
                    status = result[2];
                    if(status != '0' && status != null){
                      // Navigator.of(context).pushNamedAndRemoveUntil( HomeScreen.routeName, (Route<dynamic> route) => false);
                      // print(userId);

                      // Navigator.pushNamed(context, CartScreen.routeName);
                    }else{
                      // guest();
                      // Navigator.of(context).pushNamed( SignInScreen.routeName);
                // Navigator.pushNamed(context, CartScreen.routeName);

                      Navigator.pushNamed(context, SignInScreen.routeName);
                }
              });

            }),
          ),


          IconBtnWithCounter(
            svgSrc: "assets/icons/Cart Icon.svg",
            press: () =>
                // check().then((result) {
                //   print("result: "+result[0]+result[1]+result[2]);
                //   setState(() {
                //     status = result[2];
                //     if(status != 0 && status != null){
                //       // Navigator.of(context).pushNamedAndRemoveUntil( HomeScreen.routeName, (Route<dynamic> route) => false);
                //       // print(userId);
                //
                //       Navigator.pushNamed(context, CartScreen.routeName);
                //     }else{
                //       // guest();
                //       // Navigator.of(context).pushNamed( SignInScreen.routeName);
                      Navigator.pushNamed(context, CartScreen.routeName),
                //     }
                //   });
                //
                // }),
                // Navigator.pushNamed(context, CartScreen.routeName),
          ),
          // IconBtnWithCounter(
          //   svgSrc: "assets/icons/Mail.svg",
          //   numOfitem: 3,
          //   press: () => Navigator.pushNamed(context, MailScreen.routeName),
          // ),

        ],
      ),
    ),
    );
  }
}
