import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:JDPoolsApplication/screens/job/models/Cart.dart';

import 'package:JDPoolsApplication/screens/history/history_screen.dart';
import 'package:JDPoolsApplication/screens/job/models/Product.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../size_config.dart';
import '../../../constants.dart';
import 'job_card.dart';

import 'package:flutter_session/flutter_session.dart';
<<<<<<< HEAD
class BodyHistory extends StatefulWidget {
  @override
  _BodyHistoryState createState() => _BodyHistoryState();
}

class _BodyHistoryState extends State<BodyHistory> {
=======
class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
  var userId;
  String cusname;
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
    var url = Uri.https('jdpoolswebservice.com', '/spintest/task_list_history.php', {'q': '{http}'});
=======
    var url = Uri.https('jdpoolswebservice.com', '/spintest/task_list.php', {'q': '{http}'});
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
    var res = await http.post(
        url, headers: {"Accept": "application/json"},
        body: {
          "id":userId,

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
            job_id: int.parse(jobList[x]["checklist_data_Id"].toString()),
            job_list_id: int.parse(jobList[x]["cus_ID"].toString()),
            images: [
              "assets/images/doc.png",
            ],

            title: jobList[x]["task_list_Name"].toString(),
            date: jobList[x]["task_list_Date"].toString(),
            name: jobList[x]["user_Firstname"].toString() + " " + jobList[x]["user_Lastname"].toString(),
            tel: jobList[x]["user_Tel"].toString(),
            address: jobList[x]["user_Address1"].toString(),

          ),

      ];
      demoCarts = <Cart>[
        for(int y = 0; y < demoProducts.length; y++)
          Cart(product: demoProducts[y], numOfItem: 2),

      ];
    }
  }
  List<Widget> toogletab = <Widget>[
    Text('Before'),
    Text('After')
  ];

  final List<bool> _selectedtoogletab = <bool>[true, false];
  bool vertical = false;
  bool visibilityTag = true;
  @override
  Widget build(BuildContext context) {

    if(jobList != null) {
      return Container(
        color: bgjob,
        child: Padding(
          padding: const EdgeInsets.only(left: 12.0,right: 12.0),
          child: ListView.builder(
              itemCount: demoCarts.length,
              itemBuilder: (context, index) =>

                    Container(

                      // padding: EdgeInsets.all(10.0),
                      // decoration: BoxDecoration(
                      //   border: Border(
                      //     bottom: BorderSide( //                   <--- left side
                      //       color: kPrimaryColor2,
                      //       width: 2.0,
                      //     ),
                      //
                      //   ),
                      // ),
                      child:
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
                             CartCard(cart: demoCarts[index]),

                        // ),

                    ),


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
