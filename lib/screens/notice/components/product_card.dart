import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:JDPoolsApplication/screens/notice/models/Cart.dart';
import 'package:JDPoolsApplication/screens/notice/models/Product.dart';
=======
import 'package:JDPoolsApplication/models/Cart.dart';
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
import 'package:JDPoolsApplication/components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

<<<<<<< HEAD
import 'package:JDPoolsApplication/screens/notice/notice_screen.dart';
import 'package:JDPoolsApplication/screens/voucher/voucher_screen.dart';
import 'dart:convert';
import 'package:flutter_session/flutter_session.dart';

import 'package:JDPoolsApplication/screens/shop/shop_screen.dart';
=======
import 'dart:convert';
import 'package:flutter_session/flutter_session.dart';
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
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

<<<<<<< HEAD
  getPostVoucher() async {
    // String Url = "http://jdpoolswebservice.com/spintest/update_voucher.php";
    var url = Uri.https('jdpoolswebservice.com', '/spintest/update_voucher.php', {'q': '{http}'});
    var res = await http.post(
        url, headers: {"Accept": "application/json"},
        body: {
          "userid": "${await FlutterSession().get("userId")}",
          "id": cart.product.id.toString(),

        }
    );
    var resBody = json.decode(res.body);

    // print(resBody);

=======
  getPostToCart() async {
    String Url = "http://jdpoolswebservice.com/spintest/addItemToCart.php";

    var res = await http.post(
        Uri.encodeFull(Url), headers: {"Accept": "application/json"},
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
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
<<<<<<< HEAD
        if(cart.product.type == 1) {
          Navigator.of(context).pushNamed(voucherScreen.routeName);
        }

      },

      child: Container(
        color: kwhite,
        child: new Row(
        children: [
          SizedBox(
            width: 88,

            child: AspectRatio(
              aspectRatio: 0.88,
              child: Container(
                padding: EdgeInsets.all(getProportionateScreenWidth(5)),

                child:cart.product.type == 1?Image.asset("assets/images/couponlogo.png",scale: 15,):Icon(
                    Icons.doorbell,
                    size: 50,
                    color: Colors.grey[800]),
              ),
            ),
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              SizedBox(
                width: SizeConfig.screenWidth*0.5,
                child:Text(
                  cart.product.title,
                overflow: TextOverflow.ellipsis,

                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: kPrimaryColor2),
                  maxLines: 1,
                ),
              ),

              SizedBox(height: 10),
              Text.rich(
                TextSpan(
                  text: cart.product.detail,
                  style: TextStyle(color: Colors.black, fontSize: 12),

                ),
              ),

              SizedBox(height: 10),



            ],
          ),
            if(cart.product.type == 1)
              SizedBox(
                width: SizeConfig.screenWidth * 0.2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: kPrimaryColor2,
                      onPressed: () {
                        // if all are valid then go to success screen
                        // Navigator.pushNamed(context, QualityPageScreen.routeName);
                        // Navigator.of(context).pushNamed( CartScreen.routeName);
                        // Navigator.pop(context, '${cart.product.id}');
                        // Navigator.of(context).pop("${cart.product.id}");
                        if(cart.product.status == 0) {
                          getPostVoucher();
                          Navigator.of(context).pop();
                          Navigator.of(context).pushNamedAndRemoveUntil(
                              NoticeScreen.routeName, (Route<
                              dynamic> route) => false);
                        }else{
                          Navigator.of(context).pushNamedAndRemoveUntil( shopScreen.routeName, (Route<dynamic> route) => false);

                      }
                      },

                      child: cart.product.status == 0 ?Text(
                        "Get",
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(10),
                          color: Colors.white,
                        ),
                      ):Text(
                        "Use",
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
      ),
      ),
=======

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
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "\$${cart.product.price}",
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
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
    );
  }
}
