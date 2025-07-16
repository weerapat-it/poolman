import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/models/Cart.dart';
import 'package:JDPoolsApplication/enums.dart';
import 'package:JDPoolsApplication/components/coustom_bottom_nav_bar.dart';
import 'components/body.dart';
import 'components/check_out_card.dart';

import '../../constants.dart';
import 'package:JDPoolsApplication/screens/pool_list/models/Cart.dart';
import 'package:JDPoolsApplication/screens/regis_pool/register_pools.dart';

import 'package:JDPoolsApplication/screens/pool_information/pool_information_screen.dart';
class PoolListScreen extends StatelessWidget {
  static String routeName = "/poollist";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      // bottomNavigationBar: CheckoutCard(),
      floatingActionButton: FloatingActionButton(

        onPressed: () async {
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => registerPool(cart: null,)
          ));
        },
        child: const Icon(Icons.h_plus_mobiledata_rounded),
        backgroundColor: Colors.red,
      ),
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
            "My pools",
            style: TextStyle(color: kwhite),
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
