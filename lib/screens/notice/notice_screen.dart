import 'package:JDPoolsApplication/bottom_navigation_view/bottom_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/components/coustom_bottom_nav_bar.dart';
import 'package:JDPoolsApplication/enums.dart';

import '../../constants.dart';
import 'components/body.dart';

<<<<<<< HEAD
class NoticeScreen extends StatelessWidget {
  static String routeName = "/notice";
=======
class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kwhite,
      child: Scaffold(
        appBar: AppBar(
<<<<<<< HEAD

          backgroundColor: kPrimaryColor2,
          centerTitle: true,
          title: Text("Notification",style: TextStyle(color: kPrimaryColor)),
=======
          backgroundColor: kPrimaryColor2,
          centerTitle: true,
          title: Text("Setting",style: TextStyle(color: kPrimaryColor)),
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
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
<<<<<<< HEAD
      BottomBarView(selectedMenu: MenuState.notice),
=======
      BottomBarView(selectedMenu: MenuState.profile),
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
    ],
  );
}
