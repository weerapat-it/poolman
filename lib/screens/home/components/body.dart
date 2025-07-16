import 'package:JDPoolsApplication/constants.dart';
import 'package:JDPoolsApplication/enums.dart';
import 'package:JDPoolsApplication/screens/home/components/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_svg/svg.dart';
import '../../../size_config.dart';
import 'package:JDPoolsApplication/screens/home.dart';
import 'package:JDPoolsApplication/screens/homepage_poolman.dart';
import 'categories.dart';
import 'slideshow.dart';
import 'discount_banner.dart';
import 'home_header.dart';
import 'popular_product.dart';
import 'special_offers.dart';
import 'spin_btn.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
class Body extends StatefulWidget {

  @override
  _Body createState() => _Body();
}
class _Body extends State<Body> {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  String tokenId,sstatus;
  List data = [];
  void initState() {
    // guest();
    _getThingsOnStartup().then((value){
      guest();
    });
    super.initState();
  }

  guest()  async {

    tokenId = await _firebaseMessaging.getToken();

    FlutterSession().set("tokenId",tokenId.toString() );
    print("token"+tokenId);
    var url = Uri.https('jdpoolswebservice.com', '/spintest/save_token.php', {'q': '{http}'});
    // String Url = "http://jdpoolswebservice.com/spintest/save_token.php";
    var res = await http.post(url,headers:{"Accept" : "application/json"},
        body: {
          "token" : tokenId.toString(),
        }
    );
    var resBody = json.decode(res.body);
    // print("Id"+resBody);
    data = resBody;
    print("Id"+data[0].toString()+"status"+data[1]+"permission"+data[2]);
    setState(()  {
        FlutterSession().set("userId",data[0].toString() );
        FlutterSession().set("permission",data[2].toString() );
        // FlutterSession().set("status",data[1] );
    });

    // print("aaa ${await FlutterSession().get("userId")}");
  }
  @override
  Widget build(BuildContext context) {



    return  SafeArea(
      child: Column(

          children: <Widget>[


            Expanded(
              child: SingleChildScrollView(
                child:
                // Container(
                //
                //   child: Column(
                //     children: [
                //
                //         Slideshow(),
                //
                //       SizedBox(height: getProportionateScreenHeight(100)),
                //       Center(
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //
                //             SizedBox(
                //               width: getProportionateScreenWidth(140),
                //               child: GestureDetector(
                //                 onTap: () {
                //
                //                   if(data[2] == "poolman"){
                //                     Navigator.of(context).pushNamedAndRemoveUntil( MyHomePagePoolman.routeName, (Route<dynamic> route) => false);
                //
                //                   }else{
                //                     Navigator.of(context).pushNamedAndRemoveUntil( MyHomePageFirst.routeName, (Route<dynamic> route) => false);
                //
                //                   }
                //
                //                 },
                //                 child: Container(
                //                   decoration: BoxDecoration(
                //                     color: kwhite,
                //                     boxShadow: <BoxShadow>[
                //                       BoxShadow(
                //                           color: Color(0xFF2196F3).withOpacity(1),
                //                           offset: const Offset(0, -2),
                //                           blurRadius: 8.0),
                //                     ],
                //                     borderRadius: BorderRadius.circular(100),
                //                   ),
                //
                //                   child:Padding(
                //                     padding: const EdgeInsets.all(10.0),
                //                     child: Column(
                //                       crossAxisAlignment: CrossAxisAlignment.start,
                //                       children: [
                //                         AspectRatio(
                //                           aspectRatio: 1.02,
                //                           child: Container(
                //                             padding: EdgeInsets.all(getProportionateScreenWidth(5)),
                //                             decoration: BoxDecoration(
                //                               color: kwhite.withOpacity(0.1),
                //                               borderRadius: BorderRadius.circular(15),
                //                             ),
                //                             child: Hero(
                //                               tag: "Spinner",
                //                               child:
                //                               Image.asset("assets/images/spintest.png"),
                //                               // color: Colors.grey[800],
                //
                //                             ),
                //                           ),
                //                         ),
                //
                //                       ],
                //                     ),
                //                   ),
                //                 ),
                //               ),
                //             ),
                //
                //           ],
                //         ),
                //       ),
                //
                //
                //     ],
                //
                //   ),
                //
                // ),

                Container(
                  width: double.infinity,
                  child: new Column(

                    children: <Widget>[
                      // Slideshow(),
                            //
                            // SizedBox(height: getProportionateScreenHeight(100)),
                      Padding(
                        padding: const EdgeInsets.only(top:10,left: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .start,
                          children: [

                            Hero(
                              tag: "Job list",
                              // child: Icon(
                              //   Icons.camera_alt,
                              //   color: Colors.grey[800],
                              // ),
                              child: Image.asset(
                                  "assets/images/logohead.png"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                "Pool Care",
                                style: TextStyle(
                                  fontSize: getProportionateScreenWidth(
                                      20),
                                  fontWeight: FontWeight.w700,
                                  color: kwhite,
                                ),
                              ),
                            ),
                            // SearchField(search :null),
                          ],

                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 63,left: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .start,
                          children: [
                            Text(
                              "Pool Water Testing Lab",
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(
                                    16),
                                fontWeight: FontWeight.w700,
                                color: texthead,
                              ),
                            ),

                        ],
                      ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 13),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment
                              .start,
                          children: [

                            Text(
                              "แล็บทดสอบคุณภาพสระว่ายน้ำ",
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(
                                    14),
                                fontWeight: FontWeight.w500,
                                color: textsubhead,
                              ),
                            ),

                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 27.0),


                        child: new Row(

                          children: <Widget>[

                            Expanded(

                              child: GestureDetector(
                                onTap: () {
                                  if(data[2] == "poolman"){
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) =>
                                          MyHomePagePoolman(),
                                    ));
                                    // Navigator.of(context).pushNamedAndRemoveUntil( MyHomePagePoolman.routeName, (Route<dynamic> route) => false);

                                  }else{
                                    Navigator.of(context).pushNamedAndRemoveUntil( MyHomePageFirst.routeName, (Route<dynamic> route) => false);

                                  }
                                },
                                child: Container(
                                  height: 200.5,
                                  // width: 199,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/images/menupoolpro.png"),
                                        fit: BoxFit.fill),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Pool man',
                                          style: TextStyle(fontSize: 18, color: Colors.black),
                                        ),
                                        Spacer(),
                                        Align(
                                          alignment: Alignment.bottomRight,
                                          child: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0xFF979797).withOpacity(0.5),
                                                  offset: Offset(0, 0),
                                                  blurRadius: 10.0,
                                                ),
                                              ],
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                if (data[2] == "poolman") {
                                                  Navigator.push(context, MaterialPageRoute(
                                                    builder: (context) => MyHomePagePoolman(),
                                                  ));
                                                } else {
                                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                                      MyHomePageFirst.routeName, (route) => false);
                                                }
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.all(10.0),
                                                child: SvgPicture.asset("assets/icons/arrow-right.svg"),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                ),
                              ),
                            ),

              Visibility(
                visible: false,
                maintainState: true,
                maintainAnimation: true,
                maintainSize: true,
                child: Expanded(

                              child: GestureDetector(
                                onTap: () {

                                },
                                child: Container(
                                  height: 200.5,
                                  width: 199,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/images/menupromotion.png"),
                                        fit: BoxFit.fill),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15.0,left: 27.0),

                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 15.0,left: 14.0),
                                          child: Row(
                                            children: [
                                              const Text(
                                                'Promotion',
                                                style: TextStyle(fontSize: 18, color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 60,left: 110),
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Color(0xFF979797).withOpacity(
                                                            0.5),
                                                        offset: const Offset(0, 0),
                                                        blurRadius: 10.0),
                                                  ],
                                                ),

                                                child: InkWell(
                                                  onTap: () {
                                                    // Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context) => shopScreen(search : null)), (route) => false);
                                                  },
                                                  child:Padding(
                                                    padding: const EdgeInsets.all(12.0),
                                                    child: SvgPicture.asset(
                                                      "assets/icons/arrow-right.svg",
                                                    ),
                                                  ),


                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                ),
                              ),
                            ),

                        ),



                          ],


                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 27.0),
                      //
                      //
                      //     child: new Row(
                      //
                      //       children: <Widget>[
                      //
                      //         Expanded(
                      //
                      //           child: GestureDetector(
                      //           onTap: () {
                      //
                      //             },
                      //           child: Container(
                      //             height: 200.5,
                      //             width: 199,
                      //             decoration: const BoxDecoration(
                      //               image: DecorationImage(
                      //                   image: AssetImage("assets/images/menupromotion.png"),
                      //                 fit: BoxFit.fill),
                      //             ),
                      //             child: Padding(
                      //               padding: const EdgeInsets.only(top: 15.0,left: 27.0),
                      //
                      //               child: Column(
                      //                 children: [
                      //                   Padding(
                      //                     padding: const EdgeInsets.only(top: 15.0,left: 14.0),
                      //                     child: Row(
                      //                       children: [
                      //                         const Text(
                      //                           'Promotion',
                      //                           style: TextStyle(fontSize: 18, color: Colors.black),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                   Padding(
                      //                     padding: const EdgeInsets.only(top: 60,left: 110),
                      //                     child: Row(
                      //                       children: [
                      //                     Container(
                      //                       height: 40,
                      //                       width: 40,
                      //                     decoration: BoxDecoration(
                      //                     borderRadius: BorderRadius.circular(10),
                      //                     color: Colors.white,
                      //                     boxShadow: [
                      //                       BoxShadow(
                      //                             color: Color(0xFF979797).withOpacity(
                      //                                 0.5),
                      //                             offset: const Offset(0, 0),
                      //                             blurRadius: 10.0),
                      //                               ],
                      //                            ),
                      //
                      //                       child: InkWell(
                      //                         onTap: () {
                      //                           // Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context) => shopScreen(search : null)), (route) => false);
                      //                           },
                      //                         child:Padding(
                      //                           padding: const EdgeInsets.all(12.0),
                      //                           child: SvgPicture.asset(
                      //                                 "assets/icons/arrow-right.svg",
                      //                               ),
                      //                         ),
                      //
                      //
                      //                       ),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //
                      //           ),
                      //           ),
                      //         ),
                      //
                      //
                      //         Expanded(
                      //
                      //           child: GestureDetector(
                      //             onTap: () {
                      //                   if(data[2] == "poolman"){
                      //                     Navigator.push(context, MaterialPageRoute(
                      //                       builder: (context) =>
                      //                           MyHomePagePoolman(),
                      //                     ));
                      //                      // Navigator.of(context).pushNamedAndRemoveUntil( MyHomePagePoolman.routeName, (Route<dynamic> route) => false);
                      //
                      //                   }else{
                      //                      Navigator.of(context).pushNamedAndRemoveUntil( MyHomePageFirst.routeName, (Route<dynamic> route) => false);
                      //
                      //                   }
                      //             },
                      //             child: Container(
                      //               height: 200.5,
                      //               width: 199,
                      //               decoration: const BoxDecoration(
                      //                 image: DecorationImage(
                      //                     image: AssetImage("assets/images/menupoolpro.png"),
                      //                     fit: BoxFit.fill),
                      //               ),
                      //               child: Padding(
                      //                 padding: const EdgeInsets.only(top: 15.0,left: 27.0),
                      //
                      //                 child: Column(
                      //                   children: [
                      //                     Padding(
                      //                       padding: const EdgeInsets.only(top: 15.0,left: 14.0),
                      //                       child: Row(
                      //                         children: [
                      //                           const Text(
                      //                             'Pool man',
                      //                             style: TextStyle(fontSize: 18, color: Colors.black),
                      //                           ),
                      //                         ],
                      //                       ),
                      //                     ),
                      //                     Padding(
                      //                       padding: const EdgeInsets.only(top: 60,left: 110),
                      //                       child: Row(
                      //                         children: [
                      //                           Container(
                      //                             height: 40,
                      //                             width: 40,
                      //                             decoration: BoxDecoration(
                      //                               borderRadius: BorderRadius.circular(10),
                      //                               color: Colors.white,
                      //                               boxShadow: [
                      //                                 BoxShadow(
                      //                                     color: Color(0xFF979797).withOpacity(
                      //                                         0.5),
                      //                                     offset: const Offset(0, 0),
                      //                                     blurRadius: 10.0),
                      //                               ],
                      //                             ),
                      //
                      //                             child: InkWell(
                      //                               onTap: () {
                      //                                 // Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context) => shopScreen(search : null)), (route) => false);
                      //                                 if(data[2] == "poolman"){
                      //                                   Navigator.push(context, MaterialPageRoute(
                      //                                     builder: (context) =>
                      //                                         MyHomePagePoolman(),
                      //                                   ));
                      //                                   // Navigator.of(context).pushNamedAndRemoveUntil( MyHomePagePoolman.routeName, (Route<dynamic> route) => false);
                      //
                      //                                 }else{
                      //                                   Navigator.of(context).pushNamedAndRemoveUntil( MyHomePageFirst.routeName, (Route<dynamic> route) => false);
                      //
                      //                                 }
                      //                               },
                      //                               child:Padding(
                      //                                 padding: const EdgeInsets.all(12.0),
                      //                                 child: SvgPicture.asset(
                      //                                   "assets/icons/arrow-right.svg",
                      //                                 ),
                      //                               ),
                      //
                      //
                      //                             ),
                      //                           ),
                      //                         ],
                      //                       ),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               ),
                      //
                      //             ),
                      //           ),
                      //         ),
                      //
                      //
                      //       ],
                      //
                      //
                      //   ),
                      // ),


                     // Row(
                     //
                     //      children: <Widget>[
                     //
                     //        Expanded(
                     //
                     //          child: GestureDetector(
                     //            onTap: () {
                     //
                     //            },
                     //            child: Container(
                     //              height: 200.5,
                     //              width: 199,
                     //              decoration: const BoxDecoration(
                     //                image: DecorationImage(
                     //                    image: AssetImage("assets/images/menusale.png"),
                     //                    fit: BoxFit.fill),
                     //              ),
                     //              child: Padding(
                     //                padding: const EdgeInsets.only(top: 15.0,left: 27.0),
                     //
                     //                child: Column(
                     //                  children: [
                     //                    Padding(
                     //                      padding: const EdgeInsets.only(top: 15.0,left: 14.0),
                     //                      child: Row(
                     //                        children: [
                     //                          const Text(
                     //                            'Shopping',
                     //                            style: TextStyle(fontSize: 18, color: Colors.black),
                     //                          ),
                     //                        ],
                     //                      ),
                     //                    ),
                     //                    Padding(
                     //                      padding: const EdgeInsets.only(top: 60,left: 110),
                     //                      child: Row(
                     //                        children: [
                     //                          Container(
                     //                            height: 40,
                     //                            width: 40,
                     //                            decoration: BoxDecoration(
                     //                              borderRadius: BorderRadius.circular(10),
                     //                              color: Colors.white,
                     //                              boxShadow: [
                     //                                BoxShadow(
                     //                                    color: Color(0xFF979797).withOpacity(
                     //                                        0.5),
                     //                                    offset: const Offset(0, 0),
                     //                                    blurRadius: 10.0),
                     //                              ],
                     //                            ),
                     //
                     //                            child: InkWell(
                     //                              onTap: () {
                     //                                // Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context) => shopScreen(search : null)), (route) => false);
                     //                              },
                     //                              child:Padding(
                     //                                padding: const EdgeInsets.all(12.0),
                     //                                child: SvgPicture.asset(
                     //                                  "assets/icons/arrow-right.svg",
                     //                                ),
                     //                              ),
                     //
                     //
                     //                            ),
                     //                          ),
                     //                        ],
                     //                      ),
                     //                    ),
                     //                  ],
                     //                ),
                     //              ),
                     //
                     //            ),
                     //          ),
                     //        ),
                     //
                     //
                     //        Expanded(
                     //
                     //          child: GestureDetector(
                     //            onTap: () {
                     //
                     //            },
                     //            child: Container(
                     //              height: 200.5,
                     //              width: 199,
                     //              decoration: const BoxDecoration(
                     //                image: DecorationImage(
                     //                    image: AssetImage("assets/images/menucoupon.png"),
                     //                    fit: BoxFit.fill),
                     //              ),
                     //              child: Padding(
                     //                padding: const EdgeInsets.only(top: 15.0,left: 27.0),
                     //
                     //                child: Column(
                     //                  children: [
                     //                    Padding(
                     //                      padding: const EdgeInsets.only(top: 15.0,left: 14.0),
                     //                      child: Row(
                     //                        children: [
                     //                          const Text(
                     //                            'Gift / Coupon',
                     //                            style: TextStyle(fontSize: 18, color: Colors.black),
                     //                          ),
                     //                        ],
                     //                      ),
                     //                    ),
                     //                    Padding(
                     //                      padding: const EdgeInsets.only(top: 60,left: 110),
                     //                      child: Row(
                     //                        children: [
                     //                          Container(
                     //                            height: 40,
                     //                            width: 40,
                     //                            decoration: BoxDecoration(
                     //                              borderRadius: BorderRadius.circular(10),
                     //                              color: Colors.white,
                     //                              boxShadow: [
                     //                                BoxShadow(
                     //                                    color: Color(0xFF979797).withOpacity(
                     //                                        0.5),
                     //                                    offset: const Offset(0, 0),
                     //                                    blurRadius: 10.0),
                     //                              ],
                     //                            ),
                     //
                     //                            child: InkWell(
                     //                              onTap: () {
                     //                                // Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context) => shopScreen(search : null)), (route) => false);
                     //                              },
                     //                              child:Padding(
                     //                                padding: const EdgeInsets.all(12.0),
                     //                                child: SvgPicture.asset(
                     //                                  "assets/icons/arrow-right.svg",
                     //                                ),
                     //                              ),
                     //
                     //
                     //                            ),
                     //                          ),
                     //                        ],
                     //                      ),
                     //                    ),
                     //                  ],
                     //                ),
                     //              ),
                     //
                     //            ),
                     //          ),
                     //        ),
                     //
                     //
                     //      ],
                     //
                     //
                     //
                     //  ),



                    ],
                  ),
                ),

              ),

            ),

          ],

        ),


    );
  }
}
Future _getThingsOnStartup() async {
  await Future.delayed(Duration(seconds: 1));
}