import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:JDPoolsApplication/models/Cart.dart';

import 'package:JDPoolsApplication/models/Product.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../size_config.dart';
import 'cart_card.dart';

import 'package:JDPoolsApplication/screens/cart/cart_screen.dart';
import 'package:flutter_session/flutter_session.dart';
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var userId;
  void initState() {
    if(demoProducts != null) {
      demoProducts.clear();
    }
    if(demoCarts != null) {
      demoCarts.clear();
    }
    getListImage();
  }
  List productList = [];

  getListImage() async {
    userId = "${await FlutterSession().get("userId")}";
    // String Url = "http://jdpoolswebservice.com/spintest/cartList.php";
    var url = Uri.https('jdpoolswebservice.com', '/spintest/cartList.php', {'q': '{http}'});

    var res = await http.post(
        url, headers: {"Accept": "application/json"},
        body: {
          "id":userId,

        }
    );
    var resBody = json.decode(res.body);

    setState(() {


      // if(productList != null) {
      //   productList.clear();
      // }
      productList = resBody;

    });
    print(productList);
    if(productList != null) {

      demoProducts = <Product>[
        for(int x = 0; x < productList.length; x++)


          Product(
            id: int.parse(productList[x]["product_ID"]),
            product_id: int.parse(productList[x]["check_Cart_Id"]),
            images: [
              productList[x]["product_Pic1"],
              productList[x]["product_Pic2"],
              productList[x]["product_Pic3"],
              productList[x]["product_Pic4"],
            ],

            title: productList[x]["product_Name"],
            price: int.parse(productList[x]["product_Price"]),
            description: productList[x]["product_Detail"],

          ),

      ];
      demoCarts = <Cart>[
        for(int y = 0; y < demoProducts.length; y++)
          Cart(product: demoProducts[y],
              numOfItem: int.parse(productList[y]["qty"])),

      ];
    }
  }
  deleteListImage(String string) async {
    var url = Uri.https('jdpoolswebservice.com', '/spintest/delete_cart.php', {'q': '{http}'});
    // String Url = "http://jdpoolswebservice.com/spintest/delete_cart.php";
    var res = await http.post(
        url, headers: {"Accept": "application/json"},
        body: {
          "id":string,
        }
    );
    var resBody = json.decode(res.body);

    print(resBody);
    Navigator.pop(context);
    Navigator.pushNamed(context, CartScreen.routeName);

  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(5)),
      child: ListView.builder(
        itemCount: demoCarts.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(demoCarts[index].product.product_id.toString()),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                deleteListImage(demoCarts[index].product.product_id.toString());
                demoCarts.removeAt(index);
              });
            },
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFFFFE6E6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Spacer(),
                  SvgPicture.asset("assets/icons/Trash.svg"),
                ],
              ),
            ),
            child: CartCard(cart: demoCarts[index]),
          ),
        ),
      ),
    );
  }
}
