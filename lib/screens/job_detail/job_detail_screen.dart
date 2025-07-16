import 'package:JDPoolsApplication/bottom_navigation_view/bottom_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/models/Cart.dart';
import 'package:JDPoolsApplication/enums.dart';
import 'package:JDPoolsApplication/components/coustom_bottom_nav_bar.dart';
import '../../constants.dart';
import 'components/body.dart';
import 'components/check_out_card.dart';

class jobListScreen extends StatelessWidget {
  static String routeName = "/job_list";
  @override
  Widget build(BuildContext context) {
    final cusIdArguments agrs =
        ModalRoute.of(context).settings.arguments;
    return Container(
      color: kwhite,
      child: Scaffold(
        appBar: buildAppBar(context),
        backgroundColor: kwhite,
        body: Stack(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 80.0),
              child: Body(value:agrs.value),
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
            "My Job List",style: TextStyle(color: kPrimaryColor)

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
class cusIdArguments {
  final String value;

  cusIdArguments({@required this.value});

}
