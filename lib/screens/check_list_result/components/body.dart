<<<<<<< HEAD
import 'package:flutter/gestures.dart';
=======
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/components/default_button.dart';
import 'package:JDPoolsApplication/models/Product.dart';
import 'package:JDPoolsApplication/size_config.dart';
<<<<<<< HEAD
import 'package:flutter_svg/svg.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'package:smooth_star_rating/smooth_star_rating.dart';
=======

>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
import 'package:JDPoolsApplication/components/rounded_icon_btn.dart';
import 'package:JDPoolsApplication/screens/cart/cart_screen.dart';
import 'color_dots.dart';
import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';
import 'slideshow.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
<<<<<<< HEAD
import 'package:path/path.dart';
=======
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
import 'popular_product.dart';
import 'package:JDPoolsApplication/screens/sign_in/sign_in_screen.dart';

import 'dart:async';
import 'package:flutter_session/flutter_session.dart';
class Body extends StatefulWidget {
<<<<<<< HEAD
  final String value;

  Body({Key key, @required this.value}) : super(key: key);
=======
  final Product product;

  const Body({Key key, @required this.product}) : super(key: key);
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc

  @override
  _Body createState() => new _Body();

}

class _Body extends State<Body> {
<<<<<<< HEAD
  int select01,select02,select03,select04,select05;
  int score = 0;
  String dataControl,dataControl1,dataControldes,datestart,dateend,userfirst,userlast,empname,empId,urlqr;
  var userId;
  var index = 0;
  List jobdetailList = [];

  // getPostToCart() async {
  //   // String Url = "http://jdpoolswebservice.com/spintest/addItemToCart.php";
  //   var url = Uri.https('jdpoolswebservice.com', '/spintest/addItemToCart.php', {'q': '{http}'});
  //   var res = await http.post(
  //       url, headers: {"Accept": "application/json"},
  //       body: {
  //         "userid": userId,
  //         "id": widget.product.id.toString(),
  //         "title": widget.product.title.toString(),
  //         "price": widget.product.price.toString(),
  //         "qty": qty.toString(),
  //
  //         if(widget.product.product_id != 0)
  //           "cart_id":widget.product.product_id.toString() ,
  //       }
  //   );
  //   var resBody = json.decode(res.body);
  //   print(resBody);
  // }
  @override
  void initState() {
    // TODO: implement initState
    // if(widget.product.qty.toInt() == 0){
    //   qty = 1;
    // }else{
    //   qty = widget.product.qty.toInt();
    // }
    print("value"+widget.value);
    _getThingsOnStartup().then((value){
      getJobDetail();
    });
    super.initState();
  }

  getJobDetail() async {
    userId = "${await FlutterSession().get("userId")}";
    var url = Uri.https('jdpoolswebservice.com', '/spintest/job_detail_result.php', {'q': '{http}'});
    // String Url = "http://jdpoolswebservice.com/spintest/productSearch.php";
    var res = await http.post(
        url, headers: {"Accept": "application/json"},
        body: {
          "userid":userId,
          "id":widget.value,

        }
    );
    var resBody = json.decode(res.body);
    setState(() {
      jobdetailList = resBody;

    });
    print(jobdetailList);
    if(jobdetailList != null) {

      dataControl =  jobdetailList[index]["checklist_data_Chlorine"].toString();
      dataControl1 =  jobdetailList[index]["checklist_data_Ph"].toString();
      dataControldes =  jobdetailList[index]["checklist_data_Des"].toString();
      select01 = int.parse(jobdetailList[index]["checklist_data_Check1"]);
      select02 = int.parse(jobdetailList[index]["checklist_data_Check2"]);
      select03 = int.parse(jobdetailList[index]["checklist_data_Check3"]);
      select04 = int.parse(jobdetailList[index]["checklist_data_Check4"]);
      select05 = int.parse(jobdetailList[index]["checklist_data_Check5"]);
      datestart = jobdetailList[index]["checklist_data_Start"].toString();
      dateend = jobdetailList[index]["checklist_data_End"].toString();
      userfirst = jobdetailList[index]["user_Firstname"].toString();
      userlast = jobdetailList[index]["user_Lastname"].toString();
      empname = userfirst + " " + userlast;
      score = select01+select02+select03;
      empId = jobdetailList[index]["user_ID"].toString();
      urlqr = 'https://jdpoolswebservice.com/spintest/pageMain/ratingforcustomer.php?emp_Id='+empId+'&checklist_Id='+userId;
    }

=======

  var userId;

  Future check()  async {
    userId = "${await FlutterSession().get("userId")}";


    print(userId);
    return userId;
  }
  int qty = 1;
  getPostToCart() async {
    // String Url = "http://jdpoolswebservice.com/spintest/addItemToCart.php";
    var url = Uri.https('jdpoolswebservice.com', '/spintest/addItemToCart.php', {'q': '{http}'});
    var res = await http.post(
        url, headers: {"Accept": "application/json"},
        body: {
          "userid": userId,
          "id": widget.product.id.toString(),
          "title": widget.product.title.toString(),
          "price": widget.product.price.toString(),
          "qty": qty.toString(),

          if(widget.product.product_id != 0)
            "cart_id":widget.product.product_id.toString() ,
        }
    );
    var resBody = json.decode(res.body);
    print(resBody);
  }
  @override
  void initState() {
    // TODO: implement initState
    if(widget.product.qty.toInt() == 0){
      qty = 1;
    }else{
      qty = widget.product.qty.toInt();
    }

    super.initState();
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
  }
  @override
  Widget build(BuildContext context) {

<<<<<<< HEAD
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(top: 100.0,left: 20.0,right: 20.0),
        child: ListView(
          children: [
            // ProductImages(product: widget.product),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),

              ),
              child: Column(
                  children: [
                    // ProductDescription(
                    //   product: widget.product,
                    //   pressOnSeeMore: () {},
                    // ),
                    SizedBox(height: SizeConfig.screenHeight * 0.02),
                    Text.rich(

                      TextSpan(
                        text: "การให้บริการดูแลสระ",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.02),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,right: 20),
                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(

                            TextSpan(
                              text: "วันที่ให้บริการ ",
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            ),

                          ),

                          Text.rich(

                            TextSpan(
                              text: datestart,
                              style: TextStyle(fontSize: 16, color: Colors.black),
                            ),

                          ),
                        ],

                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,right: 20),
                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text.rich(

                            TextSpan(
                              text: "โดยพนักงาน ",
                              style: TextStyle(fontSize: 16, color: Colors.grey),
                            ),

                          ),

                          Text.rich(

                            TextSpan(
                              text: empname,
                              style: TextStyle(fontSize: 16, color: Colors.black),
                            ),

                          ),
                        ],

                      ),
                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.02),

                    Container(
                      decoration: BoxDecoration(
                        border: Border(

                          top: BorderSide( //                    <--- top side
                            color: Color(0xffeaeaea),
                            width: 1.0,
                          ),
                        ),
                      ),

                    ),
                    SizedBox(height: SizeConfig.screenHeight * 0.02),
                    Container(
                      width: 500,
                      color: Color(0xffeaeaea),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text.rich(

                          TextSpan(
                            text: "สระว่ายน้ำก่อนให้บริการ",
                            style: TextStyle(fontSize: 16, color: Colors.black),

                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(

                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                            child: Column(

                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                // MyStatefulWidget(),
                                // Spacer(),
                                //   Text.rich(
                                //
                                //     TextSpan(
                                //       text: "สระว่ายน้ำก่อนให้บริการ",
                                //       style: TextStyle(fontSize: 16, color: Colors.black),
                                //
                                //     ),
                                //
                                //   ),
                                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text.rich(

                                        TextSpan(
                                          text: "Chlorine",
                                          style: TextStyle(fontSize: 16, color: Colors.black),
                                        ),

                                      ),
                                      Container(
                                        width: 150,
                                        color: Color(0xffedf6ff),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text.rich(

                                            TextSpan(
                                              text: dataControl != ""?dataControl:"0",
                                              style: TextStyle(fontSize: 16, color: Color(0xff4082cb),fontWeight: FontWeight.bold),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text.rich(

                                        TextSpan(
                                          text: "pH",
                                          style: TextStyle(fontSize: 16, color: Colors.black),
                                        ),

                                      ),
                                      Container(
                                        width: 150,
                                        color: Color(0xffedf6ff),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text.rich(

                                            TextSpan(
                                              text: dataControl1 != ""?dataControl1:"0",
                                              style: TextStyle(fontSize: 16, color: Color(0xff4082cb),fontWeight: FontWeight.bold),
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text.rich(

                                        TextSpan(
                                          text: "คะแนนความสะอาด",
                                          style: TextStyle(fontSize: 16, color: Colors.black),
                                        ),

                                      ),
                                      if(score==0)
                                      Container(
                                        width: 150,
                                        color: Color(0xffedf6ff),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [

                                              Text.rich(

                                                TextSpan(
                                                  text: "คะแนน",
                                                  style: TextStyle(fontSize: 16, color: Color(0xff4082cb),fontWeight: FontWeight.bold),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),

                                              SvgPicture.asset(
                                                "assets/icons/mood-smile.svg",
                                                  color: Color(0xff227a08),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      if(score>=1 && score<=4)
                                        Container(
                                          width: 150,
                                          color: Color(0xffedf6ff),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [

                                                Text.rich(

                                                  TextSpan(
                                                    text: "ดี",
                                                    style: TextStyle(fontSize: 16, color: Color(0xff4082cb),fontWeight: FontWeight.bold),
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),

                                                SvgPicture.asset(
                                                  "assets/icons/mood-smile.svg",
                                                  color: Color(0xff227a08),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),

                                      if(score>4 && score<=8)
                                        Container(
                                          width: 150,
                                          color: Color(0xffedf6ff),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [

                                                Text.rich(

                                                  TextSpan(
                                                    text: "ปานกลาง",
                                                    style: TextStyle(fontSize: 16, color: Color(0xff4082cb),fontWeight: FontWeight.bold),
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),

                                                SvgPicture.asset(

                                                  "assets/icons/mood-smile.svg",

                                                  color: Color(0xffffb55d),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      if(score>8)
                                        Container(
                                          width: 150,
                                          color: Color(0xffedf6ff),
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [

                                                Text.rich(

                                                  TextSpan(
                                                    text: "ไม่ดี",
                                                    style: TextStyle(fontSize: 16, color: Color(0xff4082cb),fontWeight: FontWeight.bold),
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),

                                                SvgPicture.asset(

                                                  "assets/icons/mood-smile.svg",

                                                  color: Color(0xffff5d5d),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),


                              // SmoothStarRating(
                              //
                              //             allowHalfRating: false,
                              //             onRated: (v) {
                              //
                              //             },
                              //
                              //             starCount: 5,
                              //             // rating: double.parse(valuedata.toString()).toDouble(),
                              //             rating: 2.0,
                              //             size: 40.0,
                              //             isReadOnly:true,
                              //             filledIconData: Icons.star,
                              //             halfFilledIconData: Icons.star,
                              //             color: Colors.green,
                              //             borderColor: Colors.green,
                              //             spacing:0.0
                              //         ),
                                ],

                            ),
                          ),
                                SizedBox(height: SizeConfig.screenHeight * 0.02),
                                Container(
                                  width: 500,
                                  color: Color(0xffeaeaea),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text.rich(

                                      TextSpan(
                                        text: "การให้บริการสำหรับวันนี้",
                                        style: TextStyle(fontSize: 16, color: Colors.black),

                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),

                          SizedBox(height: SizeConfig.screenHeight * 0.02),
                                Padding(
                                  padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right: 5.0),
                                            child: SvgPicture.asset(
                                              "assets/icons/truetoogle.svg",
                                            ),
                                          ),

                                          Text.rich(

                                            TextSpan(
                                              text: "ปรับค่า",
                                              style: TextStyle(fontSize: 12, color: Colors.black),
                                            ),

                                          ),
                                        ],
                                      ),

                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right: 5.0),
                                            child: SvgPicture.asset(
                                              "assets/icons/truetoogle.svg",
                                            ),
                                          ),

                                          Text.rich(

                                            TextSpan(
                                              text: "ตรวจระบบ",
                                              style: TextStyle(fontSize: 12, color: Colors.black),
                                            ),

                                          ),
                                        ],
                                      ),

                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(right: 5.0),
                                            child: SvgPicture.asset(
                                              "assets/icons/truetoogle.svg",
                                            ),
                                          ),

                                          Text.rich(

                                            TextSpan(
                                              text: "ทำความสะอาด",
                                              style: TextStyle(fontSize: 12, color: Colors.black),
                                            ),

                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),


                          SizedBox(height: SizeConfig.screenHeight * 0.02),

                          Container(
                            decoration: BoxDecoration(
                              border: Border(

                                top: BorderSide( //                    <--- top side
                                  color: Color(0xffeaeaea),
                                  width: 1.0,
                                ),
                              ),
                            ),

                          ),
                          SizedBox(height: SizeConfig.screenHeight * 0.02),
                         Padding(
                           padding: const EdgeInsets.only(left: 15.0,right: 15.0),
                           child: Row(

                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text.rich(

                                      TextSpan(
                                        text: "เสร็จสิ้นเมื่อ ",
                                        style: TextStyle(fontSize: 12, color: Colors.black),
                                      ),

                                    ),

                                    Text.rich(

                                      TextSpan(
                                        text: dateend,
                                        style: TextStyle(fontSize: 12, color: Colors.black),
                                      ),

                                    ),
                                    ],

                              ),
                         ),
                          SizedBox(height: SizeConfig.screenHeight * 0.02),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: getProportionateScreenWidth(20)),
                            child:  DefaultButton(
                              text: "Review",

                              press: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        scrollable: true,
                                        title: Text('Review'),
                                        content: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 150,
                                            height: 220,
                                            color: Colors.white,
                                            child: Column(
                                              children: <Widget>[

                                                QrImage(
                                                  data: urlqr,
                                                  version: QrVersions.auto,
                                                  size: 200.0,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        actions: [
                                          Padding(
                                            padding: const EdgeInsets.only(bottom: 30.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [

                                                Padding(
                                                  padding: const EdgeInsets.only(right: 0.0),
                                                  child: Text.rich(

                                                    TextSpan(
                                                        text: "Back to menu",
                                                        style: TextStyle(fontSize: 20, color: Colors.black),
                                                        recognizer: TapGestureRecognizer()
                                                          ..onTap = () {
                                                            Navigator.of(context).pop();
                                                          }
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                SvgPicture.asset(
                                                  "assets/icons/Shape.svg",
                                                  color: Colors.black,
                                                ),

                                              ],

                                            ),
                                          ),
                                        ],
                                      );
                                    });
                              },
                            ),
                          ),
                          SizedBox(height: SizeConfig.screenHeight * 0.02),
                        ],

                      ),


                    ),
                  ],

                ),
              ),


             // new PopularProducts(),
            SizedBox(height: SizeConfig.screenHeight * 0.02),

          ],
        ),
      ),
    );
  }
}
Future _getThingsOnStartup() async {
  await Future.delayed(Duration(seconds: 1));
}
=======
    return ListView(
      children: [
        ProductImages(product: widget.product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: widget.product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    Padding(
                        padding:
                        EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                      child: Row(

                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        // MyStatefulWidget(),
                        // Spacer(),
                        RoundedIconBtn(
                          icon: Icons.remove,
                          press: () {
                          setState(() {
                          qty = qty >1? qty-1:qty;
                          });
                          },
                        ),
                        SizedBox(width: getProportionateScreenWidth(20)),
                        Text(
                          "$qty",
                          style: Theme.of(context).textTheme.headline6,
                        ),

                        SizedBox(width: getProportionateScreenWidth(20)),
                        RoundedIconBtn(
                          icon: Icons.add,
                          showShadow: true,
                          press: () {
                          setState(() {
                          qty = qty+1;
                          });
                        },
                        ),

                        ],

                      ),

                    ),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: "Add to cart",
                          press: () {

                            check().then((result) {
                              print("result: $result");
                              setState(() {
                                userId = result;
                                if(userId != ''&& userId != null){
                                  // Navigator.of(context).pushNamedAndRemoveUntil( HomeScreen.routeName, (Route<dynamic> route) => false);
                                  // print(userId);

                                  getPostToCart();
                                  Navigator.of(context).canPop();
                                  Navigator.pushNamed(context, CartScreen.routeName);
                                }else{
                                  Navigator.of(context).pushNamed( SignInScreen.routeName);
                                }
                              });

                            });
                            // getPostToCart();
                            // Navigator.of(context).canPop();
                            // Navigator.pushNamed(context, CartScreen.routeName);

                          },
                        ),
                      ),
                    ),
                  ],

                ),


              ),
            ],

          ),

        ),
         // new PopularProducts(),
        SizedBox(height: SizeConfig.screenHeight * 0.02),
      ],
    );
  }
}
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
