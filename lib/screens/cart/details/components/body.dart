import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/components/default_button.dart';
import 'package:JDPoolsApplication/models/Product.dart';
import 'package:JDPoolsApplication/size_config.dart';

import 'package:JDPoolsApplication/components/rounded_icon_btn.dart';
import 'package:JDPoolsApplication/screens/cart/cart_screen.dart';
import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';
import 'slideshow.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'popular_product.dart';
import 'package:JDPoolsApplication/screens/sign_in/sign_in_screen.dart';

import 'dart:async';
import 'package:flutter_session/flutter_session.dart';
class Body extends StatefulWidget {
  final Product product;

  const Body({Key key, @required this.product}) : super(key: key);

  @override
  _Body createState() => new _Body();

}

class _Body extends State<Body> {

  var userId;

  Future check()  async {
    userId = "${await FlutterSession().get("userId")}";


    print(userId);
    return userId;
  }
  int qty = 1;
  getPostToCart() async {
    String Url = "http://jdpoolswebservice.com/spintest/addItemToCart.php";
    var res = await http.post(
        Uri.encodeFull(Url), headers: {"Accept": "application/json"},
        body: {
          "userid": userId,
          "id": widget.product.id.toString(),
          "title": widget.product.title.toString(),
          "price": widget.product.price.toString(),
          "qty": qty.toString(),
        }
    );
    var resBody = json.decode(res.body);
    print(resBody);
  }

  @override
  Widget build(BuildContext context) {

    return ListView(
      children: [
        ProductImages(product: widget.product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: widget.product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                      child: Row(
                        children: [
                        MyStatefulWidget(),
                        Spacer(),
                        RoundedIconBtn(
                          icon: Icons.remove,
                          press: () {
                          setState(() {
                          qty = qty >1? qty-1:qty;
                          });
                          },
                        ),
                        SizedBox(width: getProportionateScreenWidth(20)),
                        Text(
                          "$qty",
                          style: Theme.of(context).textTheme.headline6,
                        ),

                        SizedBox(width: getProportionateScreenWidth(20)),
                        RoundedIconBtn(
                          icon: Icons.add,
                          showShadow: true,
                          press: () {
                          setState(() {
                          qty = qty+1;
                          });
                        },
                        ),

                        ],

                      ),

                    ),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: "Add to cart",
                          press: () {

                            check().then((result) {
                              print("result: $result");
                              setState(() {
                                userId = result;
                                if(userId != ''&& userId != null){
                                  // Navigator.of(context).pushNamedAndRemoveUntil( HomeScreen.routeName, (Route<dynamic> route) => false);
                                  // print(userId);

                                  getPostToCart();
                                  Navigator.of(context).canPop();
                                  Navigator.pushNamed(context, CartScreen.routeName);
                                }else{
                                  Navigator.of(context).pushNamed( SignInScreen.routeName);
                                }
                              });

                            });
                            // getPostToCart();
                            // Navigator.of(context).canPop();
                            // Navigator.pushNamed(context, CartScreen.routeName);

                          },
                        ),
                      ),
                    ),
                  ],

                ),


              ),
            ],

          ),

        ),
         new PopularProducts(),
        SizedBox(height: SizeConfig.screenHeight * 0.02),
      ],
    );
  }
}
