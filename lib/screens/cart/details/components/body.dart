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
<<<<<<< HEAD
  final int item;
  const Body({Key key, @required this.product, @required this.item}) : super(key: key);
=======

  const Body({Key key, @required this.product}) : super(key: key);
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc

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
<<<<<<< HEAD

  getPostToCart() async {
    // String Url = "http://jdpoolswebservice.com/spintest/addItemToCart.php";
    var url = Uri.https('jdpoolswebservice.com', '/spintest/addItemToCart.php', {'q': '{http}'});
    var res = await http.post(
        url, headers: {"Accept": "application/json"},
=======
  getPostToCart() async {
    String Url = "http://jdpoolswebservice.com/spintest/addItemToCart.php";
    var res = await http.post(
        Uri.encodeFull(Url), headers: {"Accept": "application/json"},
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
        body: {
          "userid": userId,
          "id": widget.product.id.toString(),
          "title": widget.product.title.toString(),
          "price": widget.product.price.toString(),
          "qty": qty.toString(),
<<<<<<< HEAD
          "cart_id":widget.product.product_id.toString() ,
        }
    );
    // var resBody = json.decode(res.body);
    // print(resBody);
  }
  @override
  void initState() {
    // TODO: implement initState
    qty = widget.item.toInt();
    super.initState();
  }
=======
        }
    );
    var resBody = json.decode(res.body);
    print(resBody);
  }

>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
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
<<<<<<< HEAD

                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        // MyStatefulWidget(),
                        // Spacer(),
=======
                        children: [
                        MyStatefulWidget(),
                        Spacer(),
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
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
<<<<<<< HEAD
                                  if(widget.product.product_id.toString() != "0")
                                  Navigator.of(this.context).pop();
                                  Navigator.of(this.context).pop();
=======
                                  Navigator.of(context).canPop();
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
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
<<<<<<< HEAD
         // new PopularProducts(),
=======
         new PopularProducts(),
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
        SizedBox(height: SizeConfig.screenHeight * 0.02),
      ],
    );
  }
}
