import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/screens/voucher/models/Cart.dart';

import 'package:JDPoolsApplication/screens/shop/shop_screen.dart';
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
    return Row(
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
              child: cart.product.images[0]!= '' ?Image.network(cart.product.images[0]):Icon(
                  Icons.camera_alt,
                  color: Colors.grey[800]),
            ),
          ),
        ),
        SizedBox(width: 20),
        SizedBox(
          width: SizeConfig.screenWidth * 0.3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cart.product.title,
                style: TextStyle(color: kPrimaryColor2, fontSize: 16),
                maxLines: 2,
              ),
              SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text: "Value : ${cart.product.price}",
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
                  text: "Detail : ${cart.product.description}",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.black),
                  // children: [
                  //   TextSpan(
                  //       text: " x${cart.numOfItem}",
                  //       style: Theme.of(context).textTheme.bodyText1),
                  // ],
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: SizeConfig.screenWidth * 0.3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

                 FlatButton(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  color: kPrimaryColor2,
                  onPressed:  () {
                    // if all are valid then go to success screen
                    // Navigator.pushNamed(context, QualityPageScreen.routeName);
                    // Navigator.of(context).pushNamed( CartScreen.routeName);
                    // Navigator.pop(context, '${cart.product.id}');
                    Navigator.of(context).pushNamedAndRemoveUntil( shopScreen.routeName, (Route<dynamic> route) => false);

                    // Navigator.of(context).pop("${cart.product.id}");
                  },
                  child: cart.product.status == 0?Text(
                    "GET",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(10),
                      color: Colors.white,
                    ),
                  ):Text(
                    "USE",
                    style: TextStyle(
                      fontSize: getProportionateScreenWidth(10),
                      color: Colors.white,
                    ),
                  ),
                ),

            ],
          ),
        )
      ],
    );
  }
}
