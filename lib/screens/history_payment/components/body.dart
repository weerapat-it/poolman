import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
<<<<<<< HEAD
import 'package:JDPoolsApplication/screens/history_payment/models/Cart.dart';

import 'package:JDPoolsApplication/screens/history/history_screen.dart';
import 'package:JDPoolsApplication/screens/history_payment/models/Product.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../size_config.dart';
import 'history_payment_card.dart';
=======
import 'package:JDPoolsApplication/screens/history/models/Cart.dart';

import 'package:JDPoolsApplication/screens/history/history_screen.dart';
import 'package:JDPoolsApplication/screens/history/models/Product.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../size_config.dart';
import 'history_card.dart';
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc

import 'package:flutter_session/flutter_session.dart';
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var userId;
<<<<<<< HEAD
  List historyPaymentList = [];
=======
  List historyList = [];
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
  void initState() {
    if(demoProducts != null) {
      demoProducts.clear();
    }
    if(demoCarts != null) {
      demoCarts.clear();
    }
<<<<<<< HEAD
    // getListImage();
    _getThingsOnStartup().then((value){
      getListImage();
    });
=======
    getListImage();
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
  }

  // deleteListImage(String string) async {
  //   String Url = "http://jdpoolswebservice.com/spintest/delete_cart.php";
  //   var res = await http.post(
  //       Uri.encodeFull(Url), headers: {"Accept": "application/json"},
  //       body: {
  //         "id":string,
  //       }
  //   );
  //   var resBody = json.decode(res.body);
  //
  //   print(resBody);
  //   Navigator.pop(context);
  //   Navigator.pushNamed(context, historyScreen.routeName);
  //
  // }
  getListImage() async {
    userId = "${await FlutterSession().get("userId")}";
<<<<<<< HEAD
    var url = Uri.https('jdpoolswebservice.com', '/spintest/paymentHistory.php', {'q': '{http}'});
    // String Url = "http://jdpoolswebservice.com/spintest/paymentHistory.php";
    var res = await http.post(
        url, headers: {"Accept": "application/json"},
        body: {
          "userid":userId,
=======
    String Url = "http://jdpoolswebservice.com/spintest/historyList.php";
    var res = await http.post(
        Uri.encodeFull(Url), headers: {"Accept": "application/json"},
        body: {
          "id":userId,
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc

        }
    );
    var resBody = json.decode(res.body);
    setState(() {
<<<<<<< HEAD
      historyPaymentList = resBody;

    });
    print(historyPaymentList);
    if(historyPaymentList != null) {
      demoProducts = <Product>[
        for(int x = 0; x < historyPaymentList.length; x++)


          Product(
            payment_history_id: int.parse(historyPaymentList[x]["payment_Id"].toString()),
            voucher_id: int.parse(historyPaymentList[x]["voucher_ID"].toString()),
            price: int.parse(historyPaymentList[x]["payment_Price"].toString()),
            images: [
              "assets/images/Bill-Transparent.png",
            ],
            status: int.parse(historyPaymentList[x]["payment_Status"].toString()),
            datetime: historyPaymentList[x]["payment_Create"].toString(),
=======
      historyList = resBody;

    });
    print(historyList);
    if(historyList != null) {
      demoProducts = <Product>[
        for(int x = 0; x < historyList.length; x++)


          Product(
            history_id: int.parse(historyList[x]["history_Spin_Id"].toString()),
            spin_id: int.parse(historyList[x]["spin_Data_Id"].toString()),
            images: [
              "assets/images/doc.png",
            ],

            title: historyList[x]["pool_Data_Name"].toString(),
            width: double.parse(historyList[x]["pool_Data_Width"].toString()),
            height: double.parse(historyList[x]["pool_Data_Height"].toString()),
            depth: double.parse(historyList[x]["pool_Data_Depth"].toString()),
            description: description,
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc

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
<<<<<<< HEAD
    if(historyPaymentList != null) {
      return Padding(
        padding:
        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: ListView.builder(
          itemCount: demoCarts.length,
          itemBuilder: (context, index) =>
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                // child: Dismissible(
                //   key: Key(demoCarts[index].product.history_id.toString()),
                //   direction: DismissDirection.endToStart,
                // onDismissed: (direction) {
                //   setState(() {
                //     // deleteListImage(demoCarts[index].product.history_id.toString());
                //     // demoCarts.removeAt(index);
                //   });
                // },
                // background: Container(
                //   padding: EdgeInsets.symmetric(horizontal: 20),
                //   decoration: BoxDecoration(
                //     color: Color(0xFFFFE6E6),
                //     borderRadius: BorderRadius.circular(15),
                //   ),
                //   child: Row(
                //     children: [
                //       Spacer(),
                //       SvgPicture.asset("assets/icons/Trash.svg"),
                //     ],
                //   ),
                // ),
                child: CartCard(cart: demoCarts[index]),

                // ),
              ),

        ),

      );
    }else{
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("No Payment")
          ],
        ),
      );
    }
  }
}
Future _getThingsOnStartup() async {
  await Future.delayed(Duration(seconds: 1));
}
=======
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: demoCarts.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
          // child: Dismissible(
          //   key: Key(demoCarts[index].product.history_id.toString()),
          //   direction: DismissDirection.endToStart,
            // onDismissed: (direction) {
            //   setState(() {
            //     // deleteListImage(demoCarts[index].product.history_id.toString());
            //     // demoCarts.removeAt(index);
            //   });
            // },
            // background: Container(
            //   padding: EdgeInsets.symmetric(horizontal: 20),
            //   decoration: BoxDecoration(
            //     color: Color(0xFFFFE6E6),
            //     borderRadius: BorderRadius.circular(15),
            //   ),
            //   child: Row(
            //     children: [
            //       Spacer(),
            //       SvgPicture.asset("assets/icons/Trash.svg"),
            //     ],
            //   ),
            // ),
            child: CartCard(cart: demoCarts[index]),

          // ),
        ),

      ),

    );
  }
}
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
