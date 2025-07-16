import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import 'package:JDPoolsApplication/routes.dart';
import 'package:JDPoolsApplication/screens/profile/profile_screen.dart';
import 'package:JDPoolsApplication/screens/splash/splash_screen.dart';
import 'package:JDPoolsApplication/screens/step.dart';
import 'package:JDPoolsApplication/screens/agree_page/agree_page_screen.dart';
import 'package:JDPoolsApplication/theme.dart';
import 'package:flutter/services.dart';
// import 'package:JDPoolsApplication/splash_screen.dart';
import 'screens/home.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final camera = cameras.first;
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) {


  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'JDPoolsApplication',
    theme: theme(),
    // home: MyHomePageFirst(
    //   // title: 'JDPoolsOCR',
    //   // camera: camera,
    //
    // ),
    // initialRoute: AgreePageScreen.routeName,
    initialRoute: SplashScreen.routeName,
    // initialRoute: StepperDemo.routeName,
    routes: routes,
  ));
  });
}
