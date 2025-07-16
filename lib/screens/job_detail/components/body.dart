import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

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
          "id":widget.value,

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
