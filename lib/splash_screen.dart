import 'dart:async';

import 'package:flutter/material.dart';

import 'package:JDPoolsApplication/screens/home/home_screen.dart';
class SplashScreens extends StatefulWidget {
  static String routeName = "/splash_screen";
  @override
  _SplashScreensState createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {

  static const String name = "J.D.Pools";
  static const String store = "Online water test\n For Everyone";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () => MyNavigator.goToHome(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset(
            'assets/images/splash.png',

            fit: BoxFit.fill,
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                         Image.asset(
                          'assets/images/PoolsProPNG2.png',
                          width: 150,
                          height: 150,
                          fit: BoxFit.fill,
                        ),

                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      // Text(
                      //   name,
                      //   style: TextStyle(
                      //       color: Colors.white,
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 24.0),
                      // )
                    ],
                  ),
                ),
              ),

            ],
          )
        ],
      ),
    );
  }
}
class MyNavigator {
  static void goToHome(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil( HomeScreen.routeName, (Route<dynamic> route) => false);

  }

  // static void goToIntro(BuildContext context) {
  //   Navigator.pushNamed(context, "/intro");
  // }
}