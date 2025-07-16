import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:JDPoolsApplication/screens/edit_address/models/Cart.dart';

// import 'package:JDPoolsApplication/screens/payment/payment_card_page_detail.dart';
import 'package:JDPoolsApplication/screens/quality_page/quality_page_screen.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';
=======
import 'package:JDPoolsApplication/screens/history_payment/models/Cart.dart';

import 'package:JDPoolsApplication/screens/payment/payment_card_page_detail.dart';
import 'package:JDPoolsApplication/screens/quality_page/quality_page_screen.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc

class CartCard extends StatelessWidget {
  const CartCard({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return   Container(
        decoration: BoxDecoration(
        color:Colors.white,
        boxShadow: <BoxShadow>[
        BoxShadow(
        color: Color(0xFF979797).withOpacity(0.3),
    offset: const Offset(0, 2),
    blurRadius: 5),
    ],
    borderRadius: BorderRadius.only(
    bottomLeft: Radius.circular(10),
    bottomRight: Radius.circular(10),
    topLeft: Radius.circular(10),
    topRight: Radius.circular(10),
    ),
    ),
    child: Padding(
    padding: EdgeInsets.all(20.0),
    child: SizedBox(
    width: getProportionateScreenWidth(140),
    child:GestureDetector(
        onTap: () {
      // Navigator.of(context).canPop();
      // Navigator.of(context).pushNamedAndRemoveUntil( QualityPageScreen.routeName, (Route<dynamic> route) => false,arguments: PoolDataDetailsArguments(value:cart.product.spin_id.toString()));
      // Navigator.push(context, MaterialPageRoute(
      //   builder: (context) =>
      //       paymentDetailPage(
      //         voucher:cart.product.voucher_id.toString(),
      //         payment:cart.product.payment_history_id.toString(),
      //         status:cart.product.status.toString(),
      //         // file: _image,
      //       ),
      // ));
=======
    return   GestureDetector(
        onTap: () {
      Navigator.of(context).canPop();
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
<<<<<<< HEAD

              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SvgPicture.asset(cart.product.images[0]),
              ),
=======
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
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
              cart.product.user_Tax.toString()!=null ||cart.product.user_Tax.toString()!="null"?cart.product.user_Tax.toString():"",
              style: TextStyle(color:kPrimaryColor2, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 5),
            Text(
              cart.product.user_Firstname.toString(),
              style: TextStyle(color:Colors.black),
              maxLines: 2,
            ),
            SizedBox(height: 5),
            // Row(
            //   children: [
            //       Text(
            //          "Address : ${cart.product.user_Address1}",
            //         style: TextStyle(
            //             fontWeight: FontWeight.w600, color: Colors.black),
            //         maxLines: 1,
            //         softWrap: false,
            //         overflow: TextOverflow.fade,
            //         // children: [
            //         //   TextSpan(
            //         //       text: " x${cart.numOfItem}",
            //         //       style: Theme.of(context).textTheme.bodyText1),
            //         // ],
            //       ),
            //
            //
            //   ],
            // ),
            Container(
              width: 200,

              child: Text("${cart.product.user_Address1 != null ?cart.product.user_Address1:""}",style: TextStyle( color: Colors.black), maxLines: 3),
            ),
            Container(
              width: 200,

              child: Text("${cart.product.user_Address2 != null ?cart.product.user_Address2:""}",style: TextStyle( color: Colors.black), maxLines: 3),
            ),
            // Row(
            //   children: [
            //        Text(
            //         " ${cart.product.user_Address2}",
            //         style: TextStyle(
            //             fontWeight: FontWeight.w600, color: Colors.black),
            //         maxLines: 1,
            //         softWrap: false,
            //         overflow: TextOverflow.fade,
            //         // children: [
            //         //   TextSpan(
            //         //       text: " x${cart.numOfItem}",
            //         //       style: Theme.of(context).textTheme.bodyText1),
            //         // ],
            //       ),
            //
            //   ],
            // ),

=======
              cart.product.price.toString(),
              style: TextStyle(color:kPrimaryColor2, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "Status : ${cart.product.status}",
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
                text: "date : ${cart.product.datetime}",
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
<<<<<<< HEAD
    ),
        ),
    ),
=======
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
    );
  }
}
