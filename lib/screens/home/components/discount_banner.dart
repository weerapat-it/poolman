import 'package:flutter/material.dart';

import '../../../size_config.dart';
import 'package:JDPoolsApplication/screens/voucher/voucher_screen.dart';
import '../../../constants.dart';
class DiscountBanner extends StatelessWidget {
  const DiscountBanner({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 90,
      width: double.infinity,
      margin: EdgeInsets.all(getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(15),
      ),
      decoration: BoxDecoration(
        color: kPrimaryColor2,
        // color: Color(0xFFf17b26),
        borderRadius: BorderRadius.circular(20),
      ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed( voucherScreen.routeName);
          },


      child: Text.rich(

        TextSpan(
          style: TextStyle(color: Colors.white),
          children: [
            TextSpan(text: "Get the Coupons\n"),
            TextSpan(
              text: "Coupons",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(24),
                fontWeight: FontWeight.bold,
              ),
            ),

          ],
        ),
      ),

        ),
    );
  }
}
