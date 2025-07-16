import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/screens/edit_address/models/Cart.dart';

// import 'package:JDPoolsApplication/screens/payment/payment_card_page_detail.dart';
import 'package:JDPoolsApplication/screens/quality_page/quality_page_screen.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../constants.dart';
import '../../../../size_config.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  Widget build(BuildContext context) {
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
        },

    child:Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),

              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SvgPicture.asset(cart.product.images[0]),
              ),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
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


          ],
        )
      ],
    ),
    ),
        ),
    ),
    );
  }
}
