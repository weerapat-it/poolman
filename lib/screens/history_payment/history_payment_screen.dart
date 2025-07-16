import 'package:JDPoolsApplication/bottom_navigation_view/bottom_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/models/Cart.dart';
import 'package:JDPoolsApplication/enums.dart';
import 'package:JDPoolsApplication/components/coustom_bottom_nav_bar.dart';
import '../../constants.dart';
import 'components/body.dart';
import 'components/check_out_card.dart';

<<<<<<< HEAD
class historyPaymentScreen extends StatelessWidget {
  static String routeName = "/history_payment";
=======
class historyScreen extends StatelessWidget {
  static String routeName = "/history";
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kwhite,
      child: Scaffold(
        appBar: buildAppBar(context),
        backgroundColor: kwhite,
        body: Stack(
          children: <Widget>[
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
<<<<<<< HEAD
      BottomBarView(selectedMenu: MenuState.historyPaymentScreen),
=======
      BottomBarView(selectedMenu: MenuState.historyScreen),
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc

    ],
  );
}

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
<<<<<<< HEAD
      iconTheme: IconThemeData(
        color: kPrimaryColor, //change your color here
      ),
      backgroundColor: kPrimaryColor2,
      centerTitle: true,
      title: Column(
        children: [
          Text(
            "Purchasing history",style: TextStyle(color: kPrimaryColor)
=======
      title: Column(
        children: [
          Text(
            "My History",
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc

          ),
          // Text(
          //   "${demoCarts.length} items",
          //   style: Theme.of(context).textTheme.caption,
          // ),
        ],
      ),
    );
  }
}
