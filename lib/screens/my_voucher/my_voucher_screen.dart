import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/models/Cart.dart';
import 'package:JDPoolsApplication/enums.dart';
import 'package:JDPoolsApplication/components/coustom_bottom_nav_bar.dart';
import 'components/body.dart';
import 'components/check_out_card.dart';
import '../../constants.dart';
class voucherScreen extends StatelessWidget {
  static String routeName = "/voucher";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      // bottomNavigationBar: CheckoutCard(),

      // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.historyScreen),
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
            "My Voucher",
            style: TextStyle(color: Colors.white),
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
