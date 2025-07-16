import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/models/Cart.dart';

import 'components/body.dart';
import 'components/check_out_card.dart';
import 'package:flutter_svg/svg.dart';
import 'package:JDPoolsApplication/models/Cart.dart';

import 'package:JDPoolsApplication/models/Product.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../size_config.dart';
import 'components/cart_card.dart';

import 'package:flutter_session/flutter_session.dart';
class CartScreen extends StatefulWidget {
  static String routeName = "/cart";
  @override
  _CartScreen createState() => _CartScreen();
}
class _CartScreen extends State<CartScreen> {
  var userId;

  void initState() {
    if(demoProducts != null) {
      demoProducts.clear();
    }
    if(demoCarts != null) {
      demoCarts.clear();
    }
    // getListImage();
    _getThingsOnStartup().then((value){
      getListImage();
    });
    super.initState();
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
      // demoCarts.clear();
      demoCarts = <Cart>[
        for(int y = 0; y < demoProducts.length; y++)
          Cart(product: demoProducts[y],
              numOfItem: int.parse(productList[y]["qty"])),

      ];
    }
  }
  @override
  Widget build(BuildContext context) {
    // getListImage();
    return Scaffold(

      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.of(context).pop('1'),
      ),
      title: Column(
        children: [
          Text(
            "My cart",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "${demoCarts.length} items",
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
Future _getThingsOnStartup() async {
  await Future.delayed(Duration(seconds: 1));
}