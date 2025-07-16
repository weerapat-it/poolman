import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:JDPoolsApplication/models/Cart.dart';
import 'package:JDPoolsApplication/models/Product.dart';
import 'dart:io';
import 'package:flutter_session/flutter_session.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../size_config.dart';
import 'product_card.dart';
class ProductPage extends StatefulWidget {
  final String value;

  const ProductPage({Key key, @required this.value}) : super(key: key);
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  var userId;
  void initState() {
    if(demoProducts != null) {
      demoProducts.clear();
    }
    if(demoCartsQuality != null) {
      demoCartsQuality.clear();
    }
    _getThingsOnStartup().then((value){
      getListImage();
    });
    super.initState();
    // getListImage();
  }
  List productList = [];

  getListImage() async {

    userId = "${await FlutterSession().get("userId")}";
    var url = Uri.https('jdpoolswebservice.com', '/spintest/productList.php', {'q': '{http}'});
    // String Url = "http://jdpoolswebservice.com/spintest/productList.php";
    var res = await http.post(
        url, headers: {"Accept": "application/json"},
      body: {
        "userid":userId,
        "data":widget.value,
      }
    );
    var resBody = json.decode(res.body);
    setState(() {
      productList = resBody;

    });
    print(productList);
  if(productList != null) {
    demoProducts = <Product>[
      for(int x = 0; x < productList.length; x++)


        Product(
          product_id: int.parse(productList[x]["product_ID"]),
          id: int.parse(productList[x]["product_ID"]),
          images: [
            productList[x]["product_Pic1"],
            productList[x]["product_Pic2"],
            productList[x]["product_Pic3"],
            productList[x]["product_Pic4"],
          ],
          qty: productList[x]["qty"],
          title: productList[x]["product_Name"],
          price: int.parse(productList[x]["product_Price"]),
          description: productList[x]["product_Detail"],

        ),

    ];
    demoCartsQuality = <Cart>[
      for(int y = 0; y < demoProducts.length; y++)
        Cart(product: demoProducts[y], numOfItem: productList[y]['qty']),

    ];
  }else{
    productList = null;
  }
  }
  @override
  Widget build(BuildContext context) {
    if(productList != null) {
      return Padding(
        padding:
        EdgeInsets.only(left: getProportionateScreenWidth(20),right: getProportionateScreenWidth(20),bottom: getProportionateScreenHeight(20) ),
        child: SizedBox(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight * 0.33,
          child: ListView.builder(
            itemCount: demoCartsQuality.length,
            itemBuilder: (context, index) =>
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),

                    child: CartCard(cart: demoCartsQuality[index]),

                ),
          ),

        ),

      );
    }else{
      return Padding(
        padding:
        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SizedBox(
          width: SizeConfig.screenWidth,
          height: SizeConfig.screenHeight * 0.5,


        ),

      );
    }

  }

  Future _getThingsOnStartup() async {
    await Future.delayed(Duration(seconds: 1));
  }
}