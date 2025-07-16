import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/screens/pool_information/components/pool_design_card.dart';
import 'package:JDPoolsApplication/screens/pool_information/models/Product.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../size_config.dart';
import 'section_title.dart';

import 'package:flutter_session/flutter_session.dart';
class PoolData extends StatefulWidget {

  @override
  _PoolData createState() => new _PoolData();
}
class _PoolData extends State<PoolData> {
  var userId;
  void initState() {
    getListImage();
  }
  List poolList = [];

  getListImage() async {

    userId = "${await FlutterSession().get("userId")}";
    var url = Uri.https('jdpoolswebservice.com', '/spintest/poolList.php', {'q': '{http}'});
    // String Url = "http://jdpoolswebservice.com/spintest/poolList.php";
    var res = await http.post(
        url, headers: {"Accept": "application/json"},
        body: {
          // "customer":_dropDownValue,
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

            title: poolList[x]["pool_Data_Name"],
            width: double.parse(poolList[x]["pool_Data_Width"]),
            height: double.parse(poolList[x]["pool_Data_Height"]),
            depth: double.parse(poolList[x]["pool_Data_Depth"]),
            type: poolList[x]["pool_Data_Type"],
            chemical: poolList[x]["pool_Data_Chemical"],

          ),

      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    if(poolList != null) {
      return Column(
        children: [
          Padding(
            padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            child: SectionTitle(title: "My pools", press: () {}),
          ),
          SizedBox(height: getProportionateScreenWidth(20)),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ...List.generate(
                  demoProducts.length,
                      (index) {
                    if (demoProducts[index] != null)
                      return Padding(
                        padding: const EdgeInsets.only(left: 10.0,bottom: 10.0,top: 10.0),
                        child: PoolDesignCard(product: demoProducts[index]),
                      );

                    return SizedBox
                        .shrink(); // here by default width and height is 0
                  },
                ),
                SizedBox(width: getProportionateScreenWidth(20)),
              ],
            ),
          )

        ],
      );
    }else{
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("No Pool")
          ],
        ),
      );
    }
  }
}
