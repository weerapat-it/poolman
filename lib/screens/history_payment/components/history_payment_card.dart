import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:JDPoolsApplication/screens/history_payment/models/Cart.dart';

import 'package:JDPoolsApplication/screens/payment/payment_card_page_detail.dart';
import 'package:JDPoolsApplication/screens/quality_page/quality_page_screen.dart';
import 'package:flutter_svg/svg.dart';
=======
import 'package:JDPoolsApplication/screens/history/models/Cart.dart';

import 'package:JDPoolsApplication/screens/quality_page/quality_page_screen.dart';
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
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
<<<<<<< HEAD
      // Navigator.of(context).pushNamedAndRemoveUntil( QualityPageScreen.routeName, (Route<dynamic> route) => false,arguments: PoolDataDetailsArguments(value:cart.product.spin_id.toString()));
      Navigator.push(context, MaterialPageRoute(
        builder: (context) =>
            paymentDetailPage(
              voucher:cart.product.voucher_id.toString(),
              payment:cart.product.payment_history_id.toString(),
              status:cart.product.status.toString(),
              // file: _image,
            ),
      ));
=======
      Navigator.of(context).pushNamedAndRemoveUntil( QualityPageScreen.routeName, (Route<dynamic> route) => false,arguments: PoolDataDetailsArguments(value:cart.product.spin_id.toString()));

>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
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
<<<<<<< HEAD
              child: SvgPicture.asset(
                  "assets/icons/bill-svgrepo-com.svg",
                  color: kPrimaryColor2,
                  semanticsLabel: 'A red up arrow'
              )
=======
              child: Image.asset(cart.product.images[0]),
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
<<<<<<< HEAD
              cart.product.price.toString(),
              style: TextStyle(color:kPrimaryColor2, fontSize: 16),
=======
              cart.product.title,
              style: TextStyle(color:kPrimaryColor, fontSize: 16),
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
<<<<<<< HEAD
                text: "Status : ${cart.product.status}",
=======
                text: "Width : ${cart.product.width}",
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
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
<<<<<<< HEAD
                text: "date : ${cart.product.datetime}",
=======
                text: "Height : ${cart.product.height}",
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.black),
                // children: [
                //   TextSpan(
                //       text: " x${cart.numOfItem}",
                //       style: Theme.of(context).textTheme.bodyText1),
                // ],
              ),

            ),
<<<<<<< HEAD

=======
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
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
          ],
        )
      ],
    ),
    );
  }
}
