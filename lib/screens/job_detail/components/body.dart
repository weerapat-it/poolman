import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
<<<<<<< HEAD
import 'package:JDPoolsApplication/screens/job_detail/models/Cart.dart';
import 'package:intl/intl.dart';
import 'package:JDPoolsApplication/enums.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:JDPoolsApplication/screens/job_detail/models/Product.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../size_config.dart';
import 'job_detail_card.dart';
=======
import 'package:JDPoolsApplication/screens/job_list/models/Cart.dart';

import 'package:JDPoolsApplication/screens/job_list/models/Product.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../size_config.dart';
import 'job_list_card.dart';
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc

import 'package:flutter_session/flutter_session.dart';
class Body extends StatefulWidget {
  final String value;

  Body({Key key, @required this.value}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
<<<<<<< HEAD
  var userId;
  List productList = [];
  static String result;
  final double width = 100;
  void initState() {
    _getThingsOnStartup().then((value){
      getJobDetail();
    });

  }
  showLoaderDialog(BuildContext context){



    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return Image.asset("assets/images/spingif.gif",width: 30,height: 30,);
      },
    );

  }

  getJobDetail() async {
    userId = "${await FlutterSession().get("userId")}";
    var url = Uri.https('jdpoolswebservice.com', '/spintest/job_detail.php', {'q': '{http}'});
    // String Url = "http://jdpoolswebservice.com/spintest/productSearch.php";
    var res = await http.post(
        url, headers: {"Accept": "application/json"},
        body: {
          "userid":userId,
=======

  var userId;
  List jobList = [];
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
    var url = Uri.https('jdpoolswebservice.com', '/spintest/job_list.php', {'q': '{http}'});
    // String Url = "http://jdpoolswebservice.com/spintest/historyList.php";
    var res = await http.post(
        url, headers: {"Accept": "application/json"},
        body: {
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
          "id":widget.value,

        }
    );
    var resBody = json.decode(res.body);
    setState(() {
<<<<<<< HEAD
      productList = resBody;

    });
    print(productList);


    // if(productList != null) {
    //   demoProducts = <Product>[
    //     for(int x = 0; x < productList.length; x++)
    //
    //
    //       Product(
    //           jobdetail_id: int.parse(productList[x]["checklist_data_Id"]),
    //           period: productList[x]["checklist_data_Period"],
    //           start: productList[x]["checklist_data_Start"],
    //           end: productList[x]["checklist_data_End"],
    //           date: productList[x]["checklist_data_Date"],
    //           name: productList[x]["user_Firstname"],
    //           lastname: productList[x]["user_Lastname"],
    //           address: productList[x]["user_Address1"],
    //
    //       ),
    //
    //   ];
    // }
  }
  @override
  Widget build(BuildContext context) {

      return Padding(
        padding: EdgeInsets.only(left: getProportionateScreenWidth(10),right: getProportionateScreenWidth(10),top:getProportionateScreenWidth(10),bottom: getProportionateScreenWidth(10) ),
        child: SizedBox(
          width: getProportionateScreenWidth(width),
          height: getProportionateScreenHeight(140),
          child: GestureDetector(
            onTap: () {

              Navigator.of(context).canPop();
              showLoaderDialog(context);


            },
            child: Container(
              decoration: BoxDecoration(
                color: kwhite,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Color(0xFF979797).withOpacity(1),
                      offset: const Offset(0, -2),
                      blurRadius: 8.0),
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),

              child:Padding(
                padding: const EdgeInsets.all(1.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [


                    Text(
                      productList[0]["user_Firstname"],
                      style: TextStyle(color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: getProportionateScreenWidth(10),),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Date : ",
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(10),

                                color: Colors.black,
                              ),
                            ),
                            Text(
                              productList[0]["checklist_data_Date"],
                              style: TextStyle(color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: getProportionateScreenWidth(10),),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                            ),
                            // Text(
                            //   "฿${NumberFormat.decimalPattern().format(productList[0]["checklist_data_Date"])}",
                            //   style: TextStyle(
                            //     fontSize: getProportionateScreenWidth(10),
                            //     fontWeight: FontWeight.w600,
                            //     color: kPrimaryColor2,
                            //   ),
                            // ),

                          ],
                        ),

                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
  }
}
Future _getThingsOnStartup() async {
  await Future.delayed(Duration(seconds: 1));
}
=======
      jobList = resBody;

    });
    print(jobList);
    if(jobList != null) {
      demoProducts = <Product>[
        for(int x = 0; x < jobList.length; x++)


          Product(
            job_id: int.parse(jobList[x]["checklist_data_Id"].toString()),
            images: [
              "assets/images/doc.png",
            ],

            period: jobList[x]["checklist_data_Period"].toString(),
            start: jobList[x]["checklist_data_Start"].toString(),
            end: jobList[x]["checklist_data_End"].toString(),

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
    if(jobList != null) {
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
            Text("No Job")
          ],
        ),
      );
    }
  }
}
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
