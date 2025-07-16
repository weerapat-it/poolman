import 'package:flutter/material.dart';

import 'package:JDPoolsApplication/screens/history/history_screen.dart';
import 'package:JDPoolsApplication/screens/history_payment/history_payment_screen.dart';
import 'package:JDPoolsApplication/screens/sign_in/sign_in_screen.dart';
import 'package:JDPoolsApplication/screens/payment/credit_card_page.dart';
import 'package:JDPoolsApplication/screens/home/home_screen.dart';
import 'package:JDPoolsApplication/screens/edit_profile/edit_profile_screen.dart';
import 'package:JDPoolsApplication/screens/voucher/voucher_screen.dart';
import 'package:JDPoolsApplication/screens/regis_pool/register_pools.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:JDPoolsApplication/screens/pool_list/pool_list_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
class Body extends StatefulWidget {

  GetStorage box = GetStorage();
  _save(String token) async{

    final value = token;

    // box.write(key, value);

  }

  @override
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  bool _isVisible = true;
  var status;
  String data;
  List data2 = [];
  var tokenIds,userId;
  Future check()  async {
    status = "${await FlutterSession().get("status")}";
    tokenIds = "${await FlutterSession().get("tokenId")}";

    userId = "${await FlutterSession().get("userId")}";
    // data = status.toString();

    data2.add(tokenIds.toString());
    data2.add(userId.toString());
    data2.add(status.toString());

    print(data2);
    return data2;
  }
  @override
  void initState() {
    super.initState();
    check().then((result) {
      // print("result: "+result);
      setState(() {
        status = result[2];
        print("statusaaa"+status);
        if(status != '0'&& status != 0 && status != null){
          _isVisible = true;
        }else{
          _isVisible = false;
        }
      });

    });



  }
  LogoutMethod()async{
    String Url = "http://jdpoolswebservice.com/spintest/logout.php";
    var res = await http.post(Uri.encodeFull(Url),headers:{"Accept" : "application/json"},
        body: {
          // "customer":_dropDownValue,
          "tokenId" : tokenIds !=null?tokenIds:"",

        }
    );
    var resBody = json.decode(res.body);
    print(resBody);
    setState(() {
      data = resBody;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          // ProfilePic(),
          // SizedBox(height: 20),
          // ProfileMenu(
          //   text: "My Account",
          //   icon: "assets/icons/User Icon.svg",
          //   press: () {
          //   Navigator.of(context).pushNamed( EditProfileScreen.routeName);
          //   },
          // ),
          // ProfileMenu(
          //   text: "Credit Card",
          //   icon: "assets/icons/Bell.svg",
          //   press: () {
          //     Navigator.of(context).pushNamed( CreditCardPage.routeName);
          //   },
          // ),
          ProfileMenu(
            text: "History Spin",
            icon: "assets/icons/Heart Icon.svg",
            press: () {
              Navigator.of(context).pushNamed( historyScreen.routeName);

            },
          ),
          ProfileMenu(
            text: "History Payment",
            icon: "assets/icons/receipt.svg",
            press: () {
              Navigator.of(context).pushNamed( historyPaymentScreen.routeName);

            },
          ),
          ProfileMenu(
            text: "Credit Card",
            icon: "assets/icons/credit-card-svgrepo-com.svg",
            press: () {
              Navigator.of(context).pushNamed( CreditCardPage.routeName);
            },
          ),
          // ProfileMenu(
          //   text: "Settings",
          //   icon: "assets/icons/Settings.svg",
          //   press: () {},
          // ),
          ProfileMenu(
            text: "Voucher",
            icon: "assets/icons/Question mark.svg",
            press: () {
              Navigator.of(context).pushNamed( voucherScreen.routeName);

            },
          ),
          ProfileMenu(
            text: "My Pools",
            icon: "assets/icons/Question mark.svg",
            press: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => PoolListScreen()
              ));

            },
          ),
      Visibility (

        visible: _isVisible,
        // visible: true,
          child: ProfileMenu(
                text: "Log Out",
                icon: "assets/icons/Log out.svg",
                press: () {
                  check().then((result) {
                    // print("result: "+result);
                    setState(() {
                      tokenIds = result[0];
                      LogoutMethod();
                      FlutterSession().set('userId','');
                      FlutterSession().set('status','0');
                      FlutterSession().set('tokenId','');

                      // Navigator.of(context).pushNamedAndRemoveUntil( HomeScreen.routeName, (Route<dynamic> route) => false);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));

                    });

                  });

                },
              ),
      ),
        ],
      ),
    );
  }
}
