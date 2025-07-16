<<<<<<< HEAD
import 'package:JDPoolsApplication/constants.dart';
import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/screens/shop/components/product_card.dart';
import 'package:JDPoolsApplication/screens/shop/components/categorries.dart';
import 'package:JDPoolsApplication/models/Product.dart';

import 'package:flutter_session/flutter_session.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../size_config.dart';
import '../shop_screen.dart';

class Body extends StatefulWidget {
  final String search;

  Body({
    Key key,
    this.search
  }) : super(key: key);
  @override
  _Body createState() => new _Body();
}
class _Body extends State<Body> {
  var userId;
  void initState() {
    _getThingsOnStartup().then((value){
      getListImage();
    });

  }
  List productList = [];
  List<String> categories = ["Chlorine", "pH", "Salt", "etc"];
  // By default our first item will be selected
  int selectedIndex = 3;
  getListImage() async {

    userId = "${await FlutterSession().get("userId")}";
    var url = Uri.https('jdpoolswebservice.com', '/spintest/productSearch.php', {'q': '{http}'});
    // String Url = "http://jdpoolswebservice.com/spintest/productSearch.php";
    var res = await http.post(
        url, headers: {"Accept": "application/json"},
      body: {
        "search":widget.search.toString(),
        "userid":userId,

      }
    );
    var resBody = json.decode(res.body);
    setState(() {
      productList = resBody;

    });
    print(productList);


    if(productList != null) {
      demoProductspop = <Product>[
        for(int x = 0; x < productList.length; x++)


          Product(
            id: int.parse(productList[x]["product_ID"]),
            product_id: int.parse(productList[x]["check_Cart_Id"]),
            qty: int.parse(productList[x]["qty"]),
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
  }
  getListImageCatagory(String word) async {
    userId = "${await FlutterSession().get("userId")}";
    var url = Uri.https('jdpoolswebservice.com', '/spintest/productSearch.php', {'q': '{http}'});
    // String Url = "http://jdpoolswebservice.com/spintest/productSearch.php";
    var res = await http.post(
        url, headers: {"Accept": "application/json"},
        body: {
          "search": word,
          "userid": userId,

        }
    );
    var resBody = json.decode(res.body);
    setState(() {
      productList = resBody;
    });
    if(productList != null) {
      demoProductspop = <Product>[
        for(int x = 0; x < productList.length; x++)


          Product(
            id: int.parse(productList[x]["product_ID"]),
            product_id: int.parse(productList[x]["check_Cart_Id"]),
            qty: int.parse(productList[x]["qty"]),
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
  }

  @override
  Widget build(BuildContext context) {
    if(productList != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            // child: Text(
            //   "Shop",
            //   style: Theme.of(context)
            //       .textTheme
            //       .headline5
            //       .copyWith(fontWeight: FontWeight.bold),
            // ),
          ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                height: 30,
                child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) => buildCategory(index),
                ),
              ),
            ),
          // Categories(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                height: 200,
                child: GridView.builder(
                    itemCount: demoProductspop.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20.0,
                      crossAxisSpacing: 20.0,
                      childAspectRatio: 0.75,
                    ),
                    itemBuilder: (context, index) =>
                        ProductCard(
                          product: demoProductspop[index],

                        )),
              ),
            ),
          ),
        ],
      );
    }else{
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("No Product")
          ],
        ),
      );
    }
  }
  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          if(index == 0){
            getListImageCatagory("Chlorine");
          }else if(index == 1){
            getListImageCatagory("pH");
          }else if(index == 2){
            getListImageCatagory("Salt");
          }else if(index == 3){
            getListImageCatagory("");
          }

        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? kPrimaryColor2 : Colors.grey,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20 / 4), //top padding 5
              height: 2,
              width: 30,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
            )
          ],
=======
import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/components/no_account_text.dart';
import 'package:JDPoolsApplication/components/socal_card.dart';
import '../../../size_config.dart';
import 'sign_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "JDPOOLS",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sign in with your email and password  \n",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     SocalCard(
                //       icon: "assets/icons/google-icon.svg",
                //       press: () {},
                //     ),
                //     SocalCard(
                //       icon: "assets/icons/facebook-2.svg",
                //       press: () {},
                //     ),
                //     SocalCard(
                //       icon: "assets/icons/twitter.svg",
                //       press: () {},
                //     ),
                //   ],
                // ),
                SizedBox(height: getProportionateScreenHeight(20)),
                NoAccountText(),
              ],
            ),
          ),
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
        ),
      ),
    );
  }
}
<<<<<<< HEAD
Future _getThingsOnStartup() async {
  await Future.delayed(Duration(seconds: 1));
}
=======
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
