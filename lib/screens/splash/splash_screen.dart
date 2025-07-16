import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/screens/splash/components/body.dart';
import 'package:JDPoolsApplication/size_config.dart';
import 'package:JDPoolsApplication/splash_screen.dart';
class SplashScreen extends StatelessWidget {
  static String routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      // body: Body(),
      body: SplashScreens(),
    );
  }
}
