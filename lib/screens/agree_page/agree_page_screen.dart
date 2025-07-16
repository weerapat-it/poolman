import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/screens/agree_page/components/body.dart';
import 'package:JDPoolsApplication/size_config.dart';

class AgreePageScreen extends StatelessWidget {
  static String routeName = "/agree_page";
  @override
  Widget build(BuildContext context) {
    // You have to call it on your starting screen
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Body(),
    );
  }
}
