import 'package:JDPoolsApplication/bottom_navigation_view/bottom_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/components/coustom_bottom_nav_bar.dart';
import 'package:JDPoolsApplication/enums.dart';

import '../../constants.dart';
import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kwhite,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kPrimaryColor2,
          centerTitle: true,
          title: Text("Setting",style: TextStyle(color: kPrimaryColor)),
        ),
        backgroundColor: kwhite,
        body: Stack(
          children: <Widget>[
            Body(),
            bottomBar(),
          ],
        ),
      ),
    );
  }
}
Widget bottomBar() {
  return Column(
    children: <Widget>[
      const Expanded(
        child: SizedBox(),
      ),
      BottomBarView(selectedMenu: MenuState.profile),
    ],
  );
}
