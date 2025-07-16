import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:JDPoolsApplication/screens/history/models/Cart.dart';

import 'package:JDPoolsApplication/screens/history/history_screen.dart';
import 'package:JDPoolsApplication/screens/history/models/Product.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../size_config.dart';
import 'history_card.dart';

import 'package:flutter_session/flutter_session.dart';
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var userId;
  List historyList = [];
  void initState() {
    if(demoProducts != null) {
      demoProducts.clear();
    }
    if(demoCarts != null) {
      demoCarts.clear();
    }
    getListImage();
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
    var url = Uri.https('jdpoolswebservice.com', '/spintest/historyList.php', {'q': '{http}'});
    // String Url = "http://jdpoolswebservice.com/spintest/historyList.php";
    var res = await http.post(
        url, headers: {"Accept": "application/json"},
        body: {
          "id":userId,

        }
    );
    var resBody = json.decode(res.body);
    setState(() {
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
    if(historyList != null) {
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
            Text("No History")
          ],
        ),
      );
    }
  }
}
