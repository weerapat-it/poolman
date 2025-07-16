import 'package:JDPoolsApplication/bottom_navigation_view/bottom_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/models/Cart.dart';
import 'package:JDPoolsApplication/enums.dart';
import 'package:JDPoolsApplication/components/coustom_bottom_nav_bar.dart';
import '../../constants.dart';
import 'components/body.dart';
import 'components/check_out_card.dart';

<<<<<<< HEAD
class jobListScreen extends StatelessWidget {
  static String routeName = "/job_list";
  @override
  Widget build(BuildContext context) {
    final cusIdArguments agrs =
        ModalRoute.of(context).settings.arguments;
=======
class historyScreen extends StatelessWidget {
  static String routeName = "/history";
  @override
  Widget build(BuildContext context) {
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
    return Container(
      color: kwhite,
      child: Scaffold(
        appBar: buildAppBar(context),
        backgroundColor: kwhite,
        body: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 80.0),
<<<<<<< HEAD
              child: Body(value:agrs.value),
            ),
            // bottomBar(),
=======
              child: Body(),
            ),
            bottomBar(),
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
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
      BottomBarView(selectedMenu: null),

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
<<<<<<< HEAD
            "My Job List",style: TextStyle(color: kPrimaryColor)
=======
            "My history",style: TextStyle(color: kPrimaryColor)
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
<<<<<<< HEAD
class cusIdArguments {
  final String value;

  cusIdArguments({@required this.value});

}
=======
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
