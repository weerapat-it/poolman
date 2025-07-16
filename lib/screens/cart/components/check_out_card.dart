import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:JDPoolsApplication/components/default_button.dart';

import 'package:JDPoolsApplication/screens/payment/payment_card_page_detail.dart';
import 'package:JDPoolsApplication/screens/voucher/voucher_screen.dart';
import 'package:JDPoolsApplication/screens/voucher/components/body.dart';
import 'package:JDPoolsApplication/screens/cart/sign_in/sign_in_screen.dart';
import 'package:JDPoolsApplication/models/Cart.dart';
import 'package:JDPoolsApplication/models/Product.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

import 'package:flutter_session/flutter_session.dart';
class CheckoutCard extends StatefulWidget {
  const CheckoutCard({
    Key key,
  }) : super(key: key);

  @override
  _CheckoutCard createState() => _CheckoutCard();
}
class _CheckoutCard extends State<CheckoutCard> {
  var userId;
  void initState() {
    if(demoProducts != null) {
      demoProducts.clear();
    }
    if(demoCarts != null) {
      demoCarts.clear();
    }
    getListImage();
  }
  var tokenIds,status;
  String tokenId;
  String result,value;
  List data2 = [];
  Future check()  async {
    // userId = await FlutterSession().get("userId");
    tokenIds = "${await FlutterSession().get("tokenId")}";
    status = "${await FlutterSession().get("status")}";
    data2.add(userId.toString());
    data2.add(tokenIds.toString());
    data2.add(status.toString());

    print(data2);
    return data2;
  }
  List productList = [];
  int total = 0;
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
    print(resBody);

    setState(() {

      // if(productList != null) {
      //   productList.clear();
      // }
      total =0;
      productList = resBody;

    });
    print(productList);
    if(productList != null) {
      for (int a = 0; a < productList.length; a++) {
        total = total + (int.parse(productList[a]["product_Price"]) * int.parse(productList[a]["qty"]) );
      }
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
      demoCarts = <Cart>[
        for(int y = 0; y < demoProducts.length; y++)
          Cart(product: demoProducts[y],
              numOfItem: int.parse(productList[y]["qty"])),

      ];
    }
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Image.asset("assets/icons/ThailandPost_Logo.png",height: 30,
                        width: 40,),
                      title: new Text('Cash on delivery'),
                      onTap: () {

                        Navigator.of(context).pop();

                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>
                                  paymentDetailPage(
                                      voucher:value != null && value != "null" ? value.toString():"0",
                                    payment: null,
                                    status: null,
                                    // file: _image,
                                  ),
                            ));

                      }),
                  new ListTile(
                    leading: new Image.asset("assets/icons/bank.png",height: 30,
                        width: 40),
                    title: new Text('Bank transfer'),
                    onTap: () {

                      // Navigator.of(context).pop();
                      // _imgFromCamera().then((result) {
                      //   // print("result: $result");
                      //   setState(() {
                      //     _image = result;
                      //   });
                      //   if(_image != null) {
                      //     Navigator.push(context, MaterialPageRoute(
                      //       builder: (context) =>
                      //           DisplayPictureScreen(
                      //
                      //             file: _image,
                      //           ),
                      //     ));
                      //   }else{
                      //
                      //   }
                      // });
                    },
                  ),
                  new ListTile(
                    leading: new Image.asset("assets/icons/smartphone.png",height: 30,
                        width: 40),
                    title: new Text('eBanking'),
                    onTap: () {

                      // Navigator.of(context).pop();
                      // _imgFromCamera().then((result) {
                      //   // print("result: $result");
                      //   setState(() {
                      //     _image = result;
                      //   });
                      //   if(_image != null) {
                      //     Navigator.push(context, MaterialPageRoute(
                      //       builder: (context) =>
                      //           DisplayPictureScreen(
                      //
                      //             file: _image,
                      //           ),
                      //     ));
                      //   }else{
                      //
                      //   }
                      // });
                    },
                  ), new ListTile(
                    leading: new Image.asset("assets/icons/paypal.png",height: 30,
                        width: 40),
                    title: new Text('Paypal'),
                    onTap: () {

                      // Navigator.of(context).pop();
                      // _imgFromCamera().then((result) {
                      //   // print("result: $result");
                      //   setState(() {
                      //     _image = result;
                      //   });
                      //   if(_image != null) {
                      //     Navigator.push(context, MaterialPageRoute(
                      //       builder: (context) =>
                      //           DisplayPictureScreen(
                      //
                      //             file: _image,
                      //           ),
                      //     ));
                      //   }else{
                      //
                      //   }
                      // });
                    },
                  ),
                  new ListTile(
                    leading: new Image.asset("assets/icons/visa.png",height: 30,
                        width: 40),
                    title: new Text('Visa'),
                    onTap: () {

                      // Navigator.of(context).pop();
                      // _imgFromCamera().then((result) {
                      //   // print("result: $result");
                      //   setState(() {
                      //     _image = result;
                      //   });
                      //   if(_image != null) {
                      //     Navigator.push(context, MaterialPageRoute(
                      //       builder: (context) =>
                      //           DisplayPictureScreen(
                      //
                      //             file: _image,
                      //           ),
                      //     ));
                      //   }else{
                      //
                      //   }
                      // });
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: getProportionateScreenWidth(40),
                  width: getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg",color: kPrimaryColor2,),
                ),
                Spacer(),
                  GestureDetector(
                    onTap: () async {
                      result = "${await Navigator.of(context).pushNamed( voucherScreen.routeName)}";
                      print("callback"+ result );
                       // String Url = "http://jdpoolswebservice.com/spintest/voucher.php";
                      var url = Uri.https('jdpoolswebservice.com', '/spintest/voucher.php', {'q': '{http}'});
                      var res = await http.post(
                          url, headers: {"Accept": "application/json"},
                          body: {
                            "voucherId":result,

                          }
                      );
                      var resBody = json.decode(res.body);
                      print(resBody);

                      setState(() {

                        result = resBody[0]['voucher_Name'];
                        value = resBody[0]['voucher_Value'].toString();
                        // value = (total*value)/100;
                      });
                      // setState(() {
                      //   result = result;
                      // });
                    },
                    child: result != "null" && result != null   ? new Text("${result.toString()}") : new Text("use coupon"),
                  ),

                const SizedBox(width: 10),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                  color: kTextColor,
                )
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Amount: ",
                    style: TextStyle(fontSize: 16, color: Colors.black),

                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: NumberFormat.decimalPattern().format(total).toString()+" THB",
                    style: TextStyle(fontSize: 16, color: Colors.black),

                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Discount: ",
                    style: TextStyle(fontSize: 16, color: Colors.black),

                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: value.toString()!= "null"?(total*int.parse(value)/100).round().toString()+" THB":"0"+" THB",
                    style: TextStyle(fontSize: 16, color: Colors.black),

                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Delivery fee: ",
                    style: TextStyle(fontSize: 16, color: Colors.black),

                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: (total!=0?(total >= 3000?"0"+" THB":"150"+" THB"):"0"+" THB"),
                    style: TextStyle(fontSize: 16, color: Colors.black),

                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total: ",
                    style: TextStyle(fontSize: 16, color: Colors.black),

                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: value.toString()!= "null"?NumberFormat.decimalPattern().format((total-(total*int.parse(value)/100).round())+((total!=0?(total >= 3000?0:150):0))).toString()+" THB":NumberFormat.decimalPattern().format(total+((total!=0?(total >= 3000?0:150):0))).toString()+" THB",
                    style: TextStyle(fontSize: 16, color: Colors.black),

                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [


                SizedBox(
                  width: getProportionateScreenWidth(190),
                  child: DefaultButton(
                    text: "Check out",
                    press: () {
                      if(total != 0)
                      check().then((result) {
                        print("result: $result");
                        setState(() {
                          status = result[2];

                        });
                        if(status != '0'&& status != "null"){
                          // Navigator.of(context).pushNamedAndRemoveUntil( HomeScreen.routeName, (Route<dynamic> route) => false);
                          // print(userId);

                          _showPicker(context);
                        }else{
                          Navigator.of(context).pushNamed( SignInCartScreen.routeName);
                        }
                      });

                    },
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
