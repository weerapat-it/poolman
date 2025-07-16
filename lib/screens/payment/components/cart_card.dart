import 'package:flutter/material.dart';
<<<<<<< HEAD
// import 'package:JDPoolsApplication/screens/payment/models/Cart.dart';

import 'package:JDPoolsApplication/models/Cart.dart';
import 'package:JDPoolsApplication/screens/cart/details/details_screen.dart';
=======
import 'package:JDPoolsApplication/models/Cart.dart';

>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
import '../../../constants.dart';
import '../../../size_config.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final Cart cart;
<<<<<<< HEAD
  static String result;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {


          Navigator.pushNamed(
              context,
              DetailsCartScreen.routeName,
              arguments: ProductDetailsArgumentsCart(product: cart.product,item:cart.numOfItem)

          );

    },
    child:Container(
=======

  @override
  Widget build(BuildContext context) {
    return Container(
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
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
                // borderRadius: BorderRadius.circular(15),
              ),
              child: cart.product.images[0]!= '' ?Image.network(cart.product.images[0]):Icon(
                Icons.camera_alt,
                color: Colors.grey[800]),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart.product.title,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "${cart.product.price}",
                style: TextStyle(
<<<<<<< HEAD
                    fontWeight: FontWeight.w600, color: kPrimaryColor2),
=======
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
                children: [
                  TextSpan(
                      text: " x${cart.numOfItem}",
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            )
          ],
        )
      ],
    ),
<<<<<<< HEAD
    ),
=======
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
    );
  }
}
