import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/screens/job_detail/models/Cart.dart';

import 'package:JDPoolsApplication/screens/check_list/check_list_screen.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';

import 'package:http/http.dart' as http;
class CartCard extends StatelessWidget {
   CartCard({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final Cart cart;
  List jobdetailList = [];
  var userId;
  int index = 0;
  String userfirst,userlast,empname;
  getJobDetail() async {
    userId = "${await FlutterSession().get("userId")}";
    var url = Uri.https('jdpoolswebservice.com', '/spintest/job_detail.php', {'q': '{http}'});
    // String Url = "http://jdpoolswebservice.com/spintest/productSearch.php";
    var res = await http.post(
        url, headers: {"Accept": "application/json"},
        body: {
          "userid":userId,
          "id":cart.product.jobdetail_id.toString(),

        }
    );
    var resBody = json.decode(res.body);

    jobdetailList = resBody;


    print(jobdetailList);


    if(jobdetailList != null) {
      userfirst = jobdetailList[index]["user_Firstname"].toString();
      userlast = jobdetailList[index]["user_Lastname"].toString();
      empname = userfirst + " " + userlast;
    }
  }
  void initState() {
    // if(demoProducts != null) {
    //   demoProducts.clear();
    // }
    // if(demoCarts != null) {
    //   demoCarts.clear();
    // }
    // getListImage();

    _getThingsOnStartup().then((value){
      getJobDetail();
    });

  }
  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
        onTap: () {
      // Navigator.of(context).canPop();
      Navigator.of(context).pushNamed( checkListScreen.routeName,arguments: jobListArguments(cart.product.jobdetail_id.toString(),empname.toString()));

        },

    child:Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              // child: Image.asset(cart.product.images[0]),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart.product.period,
              style: TextStyle(color:kPrimaryColor2, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "Date : ${cart.product.start}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.black),
                // children: [
                //   TextSpan(
                //       text: " x${cart.numOfItem}",
                //       style: Theme.of(context).textTheme.bodyText1),
                // ],
              ),

            ),
            Text.rich(
              TextSpan(
                text: "Name : ${cart.product.end}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.black),
                // children: [
                //   TextSpan(
                //       text: " x${cart.numOfItem}",
                //       style: Theme.of(context).textTheme.bodyText1),
                // ],
              ),

            ),

          ],
        )
      ],
    ),
    );
  }
}
Future _getThingsOnStartup() async {
  await Future.delayed(Duration(seconds: 1));
}