import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:JDPoolsApplication/screens/pool_list/models/Cart.dart';

import 'package:JDPoolsApplication/screens/pool_list/models/Product.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../size_config.dart';
import 'pool_list_card.dart';

import 'package:flutter_session/flutter_session.dart';
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var userId;
  void initState() {
    _getThingsOnStartup().then((value){
      getListImage();
    });
    super.initState();
    // getListImage();
  }
  List poolList = [];

  getListImage() async {
    userId = "${await FlutterSession().get("userId")}";
    var url = Uri.https('jdpoolswebservice.com', '/spintest/poolList.php', {'q': '{http}'});
    // String Url = "http://jdpoolswebservice.com/spintest/poolList.php";
    var res = await http.post(
        url, headers: {"Accept": "application/json"},
        body: {
          "userid":userId,

        }
    );
    var resBody = json.decode(res.body);
    setState(() {
      poolList = resBody;

    });
    print(poolList);
    if(poolList != null) {
      demoProducts = <Product>[
        for(int x = 0; x < poolList.length; x++)


          Product(
            id: int.parse(poolList[x]["pool_Data_Id"]),
            images: [
              poolList[x]["pool_Data_Pic"],
            ],
            // colors: [
            //   Color(0xFFF6625E),
            //   Color(0xFF836DB8),
            //   Color(0xFFDECB9C),
            //   Colors.white,
            // ],
            title: poolList[x]["pool_Data_Name"],
            width: double.parse(poolList[x]["pool_Data_Width"]),
            height: double.parse(poolList[x]["pool_Data_Height"]),
            depth: double.parse(poolList[x]["pool_Data_Depth"]),
            type: poolList[x]["pool_Data_Type"],
            chemical: poolList[x]["pool_Data_Chemical"],
            // description: description,
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
  deleteListImage(String string) async {
    // String Url = "http://jdpoolswebservice.com/spintest/delete_pool.php";
    var url = Uri.https('jdpoolswebservice.com', '/spintest/delete_pool.php', {'q': '{http}'});
    var res = await http.post(
        url, headers: {"Accept": "application/json"},
      body: {
        "id":string,
      }
    );
    var resBody = json.decode(res.body);

    print(resBody);


  }
  @override
  Widget build(BuildContext context) {
    if(poolList != null) {
      return Padding(
        padding:
        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: ListView.builder(
          itemCount: demoCarts.length,
          itemBuilder: (context, index) =>
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Dismissible(
                  key: Key(demoCarts[index].product.id.toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    setState(() {
                      deleteListImage(demoCarts[index].product.id.toString());
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
    }else{
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("No pool")
          ],
        ),
      );
    }
  }
}
Future _getThingsOnStartup() async {
  await Future.delayed(Duration(seconds: 1));
}