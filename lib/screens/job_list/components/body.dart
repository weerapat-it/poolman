import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
<<<<<<< HEAD
import 'package:JDPoolsApplication/screens/job_list/models/Cart.dart';

import 'package:JDPoolsApplication/screens/job_list/models/Product.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../size_config.dart';
import 'job_list_card.dart';

import 'package:flutter_session/flutter_session.dart';
class Body extends StatefulWidget {
  final String value;

  Body({Key key, @required this.value}) : super(key: key);
=======
import 'package:JDPoolsApplication/screens/job/models/Cart.dart';

import 'package:JDPoolsApplication/screens/history/history_screen.dart';
import 'package:JDPoolsApplication/screens/job/models/Product.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../size_config.dart';
import 'job_card.dart';

import 'package:flutter_session/flutter_session.dart';
class Body extends StatefulWidget {
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
<<<<<<< HEAD

=======
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
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
<<<<<<< HEAD
    var url = Uri.https('jdpoolswebservice.com', '/spintest/job_list.php', {'q': '{http}'});
=======
    var url = Uri.https('jdpoolswebservice.com', '/spintest/historyList.php', {'q': '{http}'});
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
    // String Url = "http://jdpoolswebservice.com/spintest/historyList.php";
    var res = await http.post(
        url, headers: {"Accept": "application/json"},
        body: {
<<<<<<< HEAD
          "id":widget.value,
=======
          "id":userId,
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc

        }
    );
    var resBody = json.decode(res.body);
    setState(() {
      jobList = resBody;

    });
    print(jobList);
    if(jobList != null) {
      demoProducts = <Product>[
        for(int x = 0; x < jobList.length; x++)


          Product(
<<<<<<< HEAD
            job_id: int.parse(jobList[x]["checklist_data_Id"].toString()),
=======
            job_id: int.parse(jobList[x]["task_list_Id"].toString()),
            job_list_id: int.parse(jobList[x]["cus_ID"].toString()),
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
            images: [
              "assets/images/doc.png",
            ],

<<<<<<< HEAD
            period: jobList[x]["checklist_data_Period"].toString(),
            start: jobList[x]["checklist_data_Start"].toString(),
            end: jobList[x]["checklist_data_End"].toString(),
=======
            title: jobList[x]["task_list_Name"].toString(),
            date: jobList[x]["task_list_Date"].toString(),
            name: jobList[x]["user_Firstname"].toString(),
            tel: jobList[x]["user_Tel"].toString(),
            address: jobList[x]["user_Address1"].toString(),
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc

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
