import 'dart:async';

import 'package:flutter/material.dart';
<<<<<<< HEAD

import 'package:JDPoolsApplication/screens/home/home_screen.dart';
class SplashScreens extends StatefulWidget {
  static String routeName = "/splash_screen";
  @override
  _SplashScreensState createState() => _SplashScreensState();
}

class _SplashScreensState extends State<SplashScreens> {

  static const String name = "J.D.Pools";
  static const String store = "Online water test\n For Everyone";

=======
import 'package:flutkart/utils/flutkart.dart';
import 'package:flutkart/utils/my_navigator.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
<<<<<<< HEAD
    Timer(Duration(seconds: 3), () => MyNavigator.goToHome(context));
=======
    Timer(Duration(seconds: 5), () => MyNavigator.goToIntro(context));
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
<<<<<<< HEAD
          Image.asset(
            'assets/images/splash.png',

            fit: BoxFit.fill,
          ),

=======
          Container(
            decoration: BoxDecoration(color: Colors.redAccent),
          ),
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
<<<<<<< HEAD

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
=======
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.greenAccent,
                          size: 50.0,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                      ),
                      Text(
                        Flutkart.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0),
                      )
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
                    ],
                  ),
                ),
              ),
<<<<<<< HEAD

=======
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text(
                      Flutkart.store,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                          color: Colors.white),
                    )
                  ],
                ),
              )
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
            ],
          )
        ],
      ),
    );
  }
}
<<<<<<< HEAD
class MyNavigator {
  static void goToHome(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil( HomeScreen.routeName, (Route<dynamic> route) => false);

  }

  // static void goToIntro(BuildContext context) {
  //   Navigator.pushNamed(context, "/intro");
  // }
}
=======
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
