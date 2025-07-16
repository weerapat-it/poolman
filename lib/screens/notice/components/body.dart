import 'package:JDPoolsApplication/size_config.dart';
import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/constants.dart';
import 'package:JDPoolsApplication/screens/history/history_screen.dart';
import 'package:JDPoolsApplication/screens/history_payment/history_payment_screen.dart';

import 'product_card.dart';
import 'package:JDPoolsApplication/screens/notice/models/Cart.dart';
import 'package:JDPoolsApplication/screens/notice/models/Product.dart';
import 'package:JDPoolsApplication/screens/voucher/voucher_screen.dart';
import 'profile_menu.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
class Body extends StatefulWidget {



  @override
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  var userId;
  void initState() {
    getListImage();
  }
  List noticeList = [];

  getListImage() async {

    userId = "${await FlutterSession().get("userId")}";
    var url = Uri.https('jdpoolswebservice.com', '/spintest/notice.php', {'q': '{http}'});
    // String Url = "http://jdpoolswebservice.com/spintest/notice.php";
    var res = await http.post(
        url, headers: {"Accept": "application/json"},
        body: {
          "userid":userId,
        }
    );
    var resBody = json.decode(res.body);
    setState(() {
      noticeList = resBody;

    });
    print(noticeList);
    if(noticeList != null) {
      demoProducts = <Product>[
        for(int x = 0; x < noticeList.length; x++)


          Product(
            id: int.parse(noticeList[x]["notice_Id"]),


            title: noticeList[x]["notice_Name"],
            detail: noticeList[x]["notice_Detail"],
            type: int.parse(noticeList[x]["notice_Type"]),
            read: int.parse(noticeList[x]["notice_Read"]),
            voucher: noticeList[x]["voucher_ID"]  != null?int.parse(noticeList[x]["voucher_ID"]):0,
            status: noticeList[x]["voucher_Status"] != null?int.parse(noticeList[x]["voucher_Status"]):0,
          ),

      ];
      demoCarts = <Cart>[
        for(int y = 0; y < demoProducts.length; y++)
          Cart(product: demoProducts[y]),

      ];
    }else{
      noticeList = null;
    }
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: kwhite,
        child: Column(

          children: <Widget>[
             Column(
                  children: [

                    // ProfileMenu(
                    //   text: "History Spin",
                    //   icon: "assets/icons/Heart Icon.svg",
                    //   press: () {
                    //     Navigator.of(context).pushNamed( historyScreen.routeName);
                    //
                    //   },
                    // ),
                    ProfileMenu(
                      text: "Purchasing history",
                      icon: "assets/icons/receipt.svg",
                      press: () {
                        Navigator.of(context).pushNamed( historyPaymentScreen.routeName);

                      },
                    ),

                    // ProfileMenu(
                    //   text: "Voucher",
                    //   icon: "assets/icons/Question mark.svg",
                    //   press: () {
                    //     Navigator.of(context).pushNamed( voucherScreen.routeName);
                    //
                    //   },
                    // ),



                  ],
                ),




            // SizedBox(height: getProportionateScreenHeight(20)),


            // SizedBox(height: getProportionateScreenHeight(20)),
            Container(
              width: MediaQuery.of(context).size.width,height: 5,

              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  // stops: [0.1, 0.5, 0.7, 0.9],
                  colors: [
                    Colors.cyan.shade600,
                    Colors.blue.shade900
                  ],

                ),
              ),
            ),
            // Here... Wrap your "SingleChildScrollView" with "Expanded"
            Container(
              color: Colors.grey,
              width: SizeConfig.screenWidth,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text.rich(
                  TextSpan(
                    text: "All notices",
                    style: TextStyle(color: Colors.black, fontSize: 16),

                  ),
                ),
              ),
            ),
            Padding(
              padding:
              EdgeInsets.only(bottom: getProportionateScreenHeight(20) ),
              child: SizedBox(
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight * 0.4,
                child: ListView.builder(
                  itemCount: demoCarts.length,
                  itemBuilder: (context, index) =>
                      Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border(
                           bottom: BorderSide(width: 1.0, color: Colors.lightBlue.shade900),
                          ),
                        ),

                        child: CartCard(cart: demoCarts[index]),

                      ),
                ),

              ),

            ),



          ],

        ),
      ),

    );
  }
}
