import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:JDPoolsApplication/screens/voucher/models/Cart.dart';

import 'package:JDPoolsApplication/screens/voucher/models/Product.dart';
import '../../../size_config.dart';
import 'voucher_card.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_session/flutter_session.dart';
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var userId;
  void initState() {
    getListImage();
  }
  List voucherList = [];

  getListImage() async {

    userId = "${await FlutterSession().get("userId")}";
<<<<<<< HEAD
    var url = Uri.https('jdpoolswebservice.com', '/spintest/voucher.php', {'q': '{http}'});
    // String Url = "http://jdpoolswebservice.com/spintest/voucher.php";
    var res = await http.post(
        url, headers: {"Accept": "application/json"},
=======
    String Url = "http://jdpoolswebservice.com/spintest/voucher.php";
    var res = await http.post(
        Uri.encodeFull(Url), headers: {"Accept": "application/json"},
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
        body: {
          "userid":userId,

        }
    );
    var resBody = json.decode(res.body);
    setState(() {
      voucherList = resBody;

    });
    print(voucherList);
    if(voucherList != null) {
      demoProducts = <Product>[
        for(int x = 0; x < voucherList.length; x++)


          Product(
            id: int.parse(voucherList[x]["voucher_ID"]),
            images: [
              voucherList[x]["voucher_Pic"],
            ],
            // colors: [
            //   Color(0xFFF6625E),
            //   Color(0xFF836DB8),
            //   Color(0xFFDECB9C),
            //   Colors.white,
            // ],
            title: voucherList[x]["voucher_Name"],
            price: int.parse(voucherList[x]["voucher_Value"]),
            description: voucherList[x]["voucher_Detail"],
            status: int.parse(voucherList[x]["voucher_Status"]),
            // rating: 4.8,
            // isFavourite: true,
            // isPopular: true,
          ),

      ];
      demoCarts = <Cart>[
        for(int y = 0; y < demoProducts.length; y++)
          Cart(product: demoProducts[y], numOfItem: 2),

      ];
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: demoCarts.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child:  CartCard(cart: demoCarts[index]),
          ),
        ),

    );
  }
}
