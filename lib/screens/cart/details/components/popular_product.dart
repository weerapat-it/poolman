import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/components/product_card.dart';
import 'package:JDPoolsApplication/models/Product.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatefulWidget {

  @override
  _PopularProducts createState() => new _PopularProducts();
}
class _PopularProducts extends State<PopularProducts> {
  void initState() {
    getListImage();
  }
  List productList = [];

  getListImage() async {
    var url = Uri.https('jdpoolswebservice.com', '/spintest/productList.php', {'q': '{http}'});
    // String Url = "http://jdpoolswebservice.com/spintest/productList.php";
    var res = await http.get(
      url, headers: {"Accept": "application/json"},
      // body: {
      //   "serial":serial_code,
      //   "item" : _dropDownValue,
      // }
    );
    var resBody = json.decode(res.body);
    setState(() {
      productList = resBody;

    });
    print(productList);
    demoProductspop = <Product>[
      for(int x =0 ; x < productList.length;x++)


        Product(
          id: int.parse(productList[x]["product_ID"]),
          images: [
            productList[x]["product_Pic1"],
            // productList[x]["product_Pic2"],
            // productList[x]["product_Pic3"],
            // productList[x]["product_Pic4"],
          ],

          title: productList[x]["product_Name"],
          price: int.parse(productList[x]["product_Price"]),
          description: productList[x]["product_Detail"],

        ),

    ];
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          child: SectionTitle(title: "Product", press: () {}),
        ),
        // SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoProductspop.length,
                    (index) {
                  if (demoProductspop[index] != null)
                    return ProductCard(product: demoProductspop[index]);

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
  }
}
