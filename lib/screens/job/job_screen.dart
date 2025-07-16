import 'package:JDPoolsApplication/bottom_navigation_view/bottom_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/models/Cart.dart';
import 'package:JDPoolsApplication/enums.dart';
import 'package:JDPoolsApplication/components/coustom_bottom_nav_bar.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart';
import '../../size_config.dart';
import 'components/body.dart';
import 'components/body_history.dart';
import 'components/check_out_card.dart';

class jobScreen extends StatelessWidget {
  static String routeName = "/job";


  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
        length: 2,
        child:Scaffold(
      // appBar: buildAppBar(context),


        body: Stack(
          children: <Widget>[
            Container(
              height: 212,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/bgjob.png"),
                    fit: BoxFit.cover),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
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
                                Navigator.of(context).pop();
                              },
                              child:Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: SvgPicture.asset(
                                  "assets/icons/arrow-left.svg",
                                ),
                              ),


                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 14,top: 12),
                      child: Row(
                        children: [
                          Text(
                            "Job List",
                            style: TextStyle(
                              fontSize: getProportionateScreenWidth(
                                  28),
                              fontWeight: FontWeight.w700,
                              color: kwhite,
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],

                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 212.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  // ignore: prefer_const_literals_to_create_immutables
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0), color: Colors.white),
                    child: TabBar(
                      indicator: BoxDecoration(
                        color: Colors.white,

                        border: Border(

                          bottom: BorderSide(color: Color(0xFF87C6FF), width: 2),
                        ),
                      ),

                      labelColor: Colors.black,
                      indicatorColor: Colors.grey,
                      unselectedLabelColor: Colors.grey,
                      // ignore: prefer_const_literals_to_create_immutables
                      tabs: [
                        Tab(
                          // icon: Icon(
                          //   Icons.add_box,
                          //   color: Colors.black,
                          // ),
                          child: Text(
                            "Current",
                            style: TextStyle(fontFamily: "BarlowBold"),
                          ),
                        ),
                        Tab(
                          // icon: Icon(
                          //   Icons.video_call,
                          //   color: Colors.black,
                          // ),
                          child: Text(
                            "History",
                            style: TextStyle(fontFamily: "BarlowBold"),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(children: [
                      Body(),

                      BodyHistory(),

                      // MyPostTab(),
                      // MyReelsTab(),
                      // MyTagTab(),
                    ]),
                  )
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(top: 178.0),
            //   child: Body(),
            // ),

            // bottomBar(),
          ],
        ),

        ),
    );
  }

Widget bottomBar() {
  return Column(
    children: <Widget>[
      const Expanded(
        child: SizedBox(),
      ),
      BottomBarView(selectedMenu: null),

    ],
  );
}

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      iconTheme: IconThemeData(
        color: kPrimaryColor, //change your color here
      ),
      backgroundColor: kPrimaryColor2,
      centerTitle: true,
      title: Column(
        children: [
          Text(
            "My Job",style: TextStyle(color: kPrimaryColor)

          ),
          // Text(
          //   "${demoCarts.length} items",
          //   style: Theme.of(context).textTheme.caption,
          // ),
        ],
      ),
    );
  }
}
