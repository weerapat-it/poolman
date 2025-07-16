import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/screens/history/models/Cart.dart';

import 'package:JDPoolsApplication/screens/quality_page/quality_page_screen.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
        onTap: () {
      Navigator.of(context).canPop();
      Navigator.of(context).pushNamedAndRemoveUntil( QualityPageScreen.routeName, (Route<dynamic> route) => false,arguments: PoolDataDetailsArguments(value:cart.product.spin_id.toString()));

        },

    child:Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(cart.product.images[0]),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart.product.title,
              style: TextStyle(color:kPrimaryColor, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "Width : ${cart.product.width}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.black),
                // children: [
                //   TextSpan(
                //       text: " x${cart.numOfItem}",
                //       style: Theme.of(context).textTheme.bodyText1),
                // ],
              ),

            ),
            Text.rich(
              TextSpan(
                text: "Height : ${cart.product.height}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.black),
                // children: [
                //   TextSpan(
                //       text: " x${cart.numOfItem}",
                //       style: Theme.of(context).textTheme.bodyText1),
                // ],
              ),

            ),
            Text.rich(
              TextSpan(
                text: "Depth : ${cart.product.depth}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.black),
                // children: [
                //   TextSpan(
                //       text: " x${cart.numOfItem}",
                //       style: Theme.of(context).textTheme.bodyText1),
                // ],
              ),

            ),
          ],
        )
      ],
    ),
    );
  }
}
