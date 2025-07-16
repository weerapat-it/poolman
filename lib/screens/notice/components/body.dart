<<<<<<< HEAD
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
=======
import 'package:flutter/material.dart';

import 'package:JDPoolsApplication/screens/history/history_screen.dart';
import 'package:JDPoolsApplication/screens/history_payment/history_payment_screen.dart';
import 'package:JDPoolsApplication/screens/sign_in/sign_in_screen.dart';
import 'package:JDPoolsApplication/screens/payment/credit_card_page.dart';
import 'package:JDPoolsApplication/screens/home/home_screen.dart';
import 'package:JDPoolsApplication/screens/edit_profile/edit_profile_screen.dart';
import 'package:JDPoolsApplication/screens/voucher/voucher_screen.dart';
import 'package:JDPoolsApplication/screens/regis_pool/register_pools.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:JDPoolsApplication/screens/pool_list/pool_list_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
class Body extends StatefulWidget {

<<<<<<< HEAD

=======
  GetStorage box = GetStorage();
  _save(String token) async{

    final value = token;

    // box.write(key, value);

  }
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc

  @override
  _Body createState() => _Body();
}

class _Body extends State<Body> {
<<<<<<< HEAD
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

=======
  bool _isVisible = true;
  var status;
  String data;
  List data2 = [];
  var tokenIds,userId;
  Future check()  async {
    status = "${await FlutterSession().get("status")}";
    tokenIds = "${await FlutterSession().get("tokenId")}";

    userId = "${await FlutterSession().get("userId")}";
    // data = status.toString();

    data2.add(tokenIds.toString());
    data2.add(userId.toString());
    data2.add(status.toString());

    print(data2);
    return data2;
  }
  @override
  void initState() {
    super.initState();
    check().then((result) {
      // print("result: "+result);
      setState(() {
        status = result[2];
        print("statusaaa"+status);
        if(status != '0'&& status != 0 && status != null){
          _isVisible = true;
        }else{
          _isVisible = false;
        }
      });

    });



  }
  LogoutMethod()async{
    String Url = "http://jdpoolswebservice.com/spintest/logout.php";
    var res = await http.post(Uri.encodeFull(Url),headers:{"Accept" : "application/json"},
        body: {
          // "customer":_dropDownValue,
          "tokenId" : tokenIds !=null?tokenIds:"",

        }
    );
    var resBody = json.decode(res.body);
    print(resBody);
    setState(() {
      data = resBody;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          // ProfilePic(),
          // SizedBox(height: 20),
          // ProfileMenu(
          //   text: "My Account",
          //   icon: "assets/icons/User Icon.svg",
          //   press: () {
          //   Navigator.of(context).pushNamed( EditProfileScreen.routeName);
          //   },
          // ),
          // ProfileMenu(
          //   text: "Credit Card",
          //   icon: "assets/icons/Bell.svg",
          //   press: () {
          //     Navigator.of(context).pushNamed( CreditCardPage.routeName);
          //   },
          // ),
          ProfileMenu(
            text: "History Spin",
            icon: "assets/icons/Heart Icon.svg",
            press: () {
              Navigator.of(context).pushNamed( historyScreen.routeName);

            },
          ),
          ProfileMenu(
            text: "History Payment",
            icon: "assets/icons/receipt.svg",
            press: () {
              Navigator.of(context).pushNamed( historyPaymentScreen.routeName);

            },
          ),
          ProfileMenu(
            text: "Credit Card",
            icon: "assets/icons/credit-card-svgrepo-com.svg",
            press: () {
              Navigator.of(context).pushNamed( CreditCardPage.routeName);
            },
          ),
          // ProfileMenu(
          //   text: "Settings",
          //   icon: "assets/icons/Settings.svg",
          //   press: () {},
          // ),
          ProfileMenu(
            text: "Voucher",
            icon: "assets/icons/Question mark.svg",
            press: () {
              Navigator.of(context).pushNamed( voucherScreen.routeName);

            },
          ),
          ProfileMenu(
            text: "My Pools",
            icon: "assets/icons/Question mark.svg",
            press: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => PoolListScreen()
              ));

            },
          ),
      Visibility (

        visible: _isVisible,
        // visible: true,
          child: ProfileMenu(
                text: "Log Out",
                icon: "assets/icons/Log out.svg",
                press: () {
                  check().then((result) {
                    // print("result: "+result);
                    setState(() {
                      tokenIds = result[0];
                      LogoutMethod();
                      FlutterSession().set('userId','');
                      FlutterSession().set('status','0');
                      FlutterSession().set('tokenId','');

                      // Navigator.of(context).pushNamedAndRemoveUntil( HomeScreen.routeName, (Route<dynamic> route) => false);
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));

                    });

                  });

                },
              ),
      ),
        ],
      ),
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
    );
  }
}
