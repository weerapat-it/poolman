import 'package:JDPoolsApplication/bottom_navigation_view/bottom_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/models/Cart.dart';
import 'package:JDPoolsApplication/enums.dart';
import 'package:JDPoolsApplication/components/coustom_bottom_nav_bar.dart';
import '../../constants.dart';
import 'components/body.dart';
import 'components/check_out_card.dart';

class historyPaymentScreen extends StatelessWidget {
  static String routeName = "/history_payment";
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
      BottomBarView(selectedMenu: MenuState.historyPaymentScreen),

    ],
  );
}

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: kPrimaryColor, //change your color here
      ),
      backgroundColor: kPrimaryColor2,
      centerTitle: true,
      title: Column(
        children: [
          Text(
            "Purchasing history",style: TextStyle(color: kPrimaryColor)

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
