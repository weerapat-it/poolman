import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/models/Cart.dart';
import 'package:JDPoolsApplication/components/default_button.dart';
import 'package:intl/intl.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

import 'dart:convert';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
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

  getPostToCart() async {
    var url = Uri.https('jdpoolswebservice.com', '/spintest/addItemToCart.php', {'q': '{http}'});
    // String Url = "http://jdpoolswebservice.com/spintest/addItemToCart.php";

    var res = await http.post(
        url, headers: {"Accept": "application/json"},
        body: {
          "userid": "${await FlutterSession().get("userId")}",
          "id": cart.product.id.toString(),
          "title": cart.product.title.toString(),
          "price": cart.product.price.toString(),
          "qty": cart.numOfItem.toString(),
        }
    );
    var resBody = json.decode(res.body);
    print(resBody);
  }
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
              maxLines: 1,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "${NumberFormat.decimalPattern().format(cart.product.price)}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor2),
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
            color: kPrimaryColor2,
            onPressed:  () {
                  // if all are valid then go to success screen
                  // Navigator.pushNamed(context, QualityPageScreen.routeName);
              getPostToCart();
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
