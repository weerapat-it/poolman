import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/models/Cart.dart';
import 'package:JDPoolsApplication/components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

import 'package:JDPoolsApplication/screens/cart/cart_screen.dart';
import 'package:JDPoolsApplication/models/Product.dart';
import 'package:JDPoolsApplication/screens/details/details_screen.dart';
import 'package:JDPoolsApplication/components/product_card.dart';
class CartCard extends StatelessWidget {
  const CartCard({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

        Navigator.pushNamed(
          context,
          DetailsScreen.routeName,
          arguments: ProductDetailsArguments(product: cart.product),
        );
      },
      child: new Row(
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
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "${cart.product.price}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
                children: [
                  TextSpan(
                      text: " x${cart.numOfItem}",
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            ),
            SizedBox(height: 10),

          SizedBox(
            width: SizeConfig.screenWidth*0.5,
            height: 40,
            child: FlatButton(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: kPrimaryColor,
            onPressed:  () {
                  // if all are valid then go to success screen
                  // Navigator.pushNamed(context, QualityPageScreen.routeName);
                  Navigator.of(context).pushNamed( CartScreen.routeName);
                },
            child: Text(
                "Add to cart",
                style: TextStyle(
                fontSize: getProportionateScreenWidth(10),
                color: Colors.white,
                ),
              ),
            ),
          ),
          ],
        ),

      ],
    ),
    );
  }
}
