import 'package:JDPoolsApplication/constants.dart';
import 'package:flutter/material.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:JDPoolsApplication/components/coustom_bottom_nav_bar.dart';
import 'package:JDPoolsApplication/enums.dart';
import 'package:JDPoolsApplication/screens/home/components/home_header.dart';
import 'components/body.dart';
import 'package:JDPoolsApplication/models/tabIcon_data.dart';
import 'package:JDPoolsApplication/bottom_navigation_view/navapp_theme.dart';
import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/screens/cart/cart_screen.dart';
import 'package:JDPoolsApplication/screens/home/components/icon_btn_with_counter.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:JDPoolsApplication/constants.dart';
import 'dart:convert';
import 'package:flutter_session/flutter_session.dart';
import 'package:JDPoolsApplication/screens/sign_in/sign_in_screen.dart';
import 'package:JDPoolsApplication/screens/home/components/search_field.dart';
import 'package:JDPoolsApplication/bottom_navigation_view/bottom_bar_view.dart';
// class HomeScreen extends StatelessWidget {
//   static String routeName = "/home";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(//sidebar
//
//       body: Body(),
//       bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
//     );
//   }
// }

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin {
  AnimationController animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;
  var userId,tokenIds,status,permission;

  String tokenId;
  List data = [];
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  Future check()  async {
    userId = "${await FlutterSession().get("userId")}";
    tokenIds = "${await FlutterSession().get("tokenId")}";
    status = "${await FlutterSession().get("status")}";
    permission = "${await FlutterSession().get("permission")}";
    data.add(userId.toString());
    data.add(tokenIds.toString());
    data.add(status.toString());
    data.add(permission.toString());

    print(data);
    return data;
  }
  guest()  async {
    tokenId = await _firebaseMessaging.getToken();


    print(tokenId);
  }

  Widget tabBody = Container(
    color: kwhite,
  );

  @override
  void initState() {
    // guest();
    _getThingsOnStartup().then((value){
      check().then((result) {
        print("result: "+result[0]+result[1]+result[2]+result[3]);
        setState(() {
          status = result[2];

        });

      });
    });
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kwhite,
      child: Scaffold(
        // appBar: PreferredSize(
        //   preferredSize: Size.fromHeight(63.0), // here the desired height
        //   child: buildAppBar(context),
        //
        // ),
        backgroundColor: kwhite,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset(
              'assets/images/bghome.png',

              fit: BoxFit.fill,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 80.0),
              child: Body(),
            ),
            bottomBar(),
          ],
        ),
      ),
    );
  }



  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(selectedMenu: MenuState.home),
      ],
    );
  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor2,
      centerTitle: true,
      title:Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SearchField(search :null),
            if(status == '0' || status == null || status == "null")
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
                        Navigator.pushNamed(context, SignInScreen.routeName);
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
            // Text(
            //   "${demoCarts.length} items",
            //   style: Theme.of(context).textTheme.caption,
            // ),
          ],
        ),
      ),

    );
  }
}
Future _getThingsOnStartup() async {
  await Future.delayed(Duration(seconds: 1));
}