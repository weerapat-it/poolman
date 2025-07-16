import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/models/Cart.dart';

import 'components/body.dart';
import 'components/check_out_card.dart';

class MailScreen extends StatelessWidget {
  static String routeName = "/mail";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      // bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Column(
        children: [
          Text(
            "Your Mail",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${demoCarts.length} items",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
