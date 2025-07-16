import 'package:JDPoolsApplication/bottom_navigation_view/bottom_bar_view.dart';
import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/models/Cart.dart';
import 'package:JDPoolsApplication/enums.dart';
import 'package:JDPoolsApplication/components/coustom_bottom_nav_bar.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants.dart';
import '../../size_config.dart';
import 'components/body.dart';
import 'components/check_out_card.dart';

class checkListScreen extends StatelessWidget {
  static String routeName = "/check_list";



  @override
  Widget build(BuildContext context) {
    final agrs =
        ModalRoute.of(context).settings.arguments as jobListArguments;
    return Scaffold(
      // appBar: buildAppBar(context),
      backgroundColor: kwhite,
      body: Stack(
        children: <Widget>[
          Container(
            height: 241,

            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
              image: DecorationImage(
                  image: AssetImage("assets/images/bgjob.png"),
                  fit: BoxFit.cover),
            ),

              child: Padding(
                padding: const EdgeInsets.only(top: 54.0),
                child: Column(
                  children: [

                    new Row(
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
                          padding: const EdgeInsets.only(left: 110),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Check Lists",
                                style: TextStyle(
                                  fontSize: getProportionateScreenWidth(
                                      16),
                                  fontWeight: FontWeight.w700,
                                  color: kwhite,
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],

                    ),
                    new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 80,
                          width: 80,


                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child:Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SvgPicture.asset(
                                "assets/icons/user-circle.svg",
                                color: Colors.white,
                              ),
                            ),


                          ),
                        ),

                        ],

                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                       Text.rich(

                            TextSpan(
                              text: "customer name",
                              style: TextStyle(fontSize: 10, color: Colors.white),
                            ),
                            textAlign: TextAlign.center,
                          ),



                      ],

                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text.rich(

                            TextSpan(
                              text: agrs.value2.isNotEmpty ?agrs.value2 : "customer name",
                              style: TextStyle(fontSize: 16, color: Colors.white),
                            ),
                            textAlign: TextAlign.center,
                          ),



                      ],

                    ),
                  ],
                ),
              ),
            ),

          Padding(
            padding: const EdgeInsets.only(top: 240.0),
            child: Body(value:agrs.value),
          ),
          // bottomBar(),
        ],
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
            "Poolcare Report",style: TextStyle(color: kPrimaryColor)

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
class jobListArguments {
  final String value;
  final String value2;

  jobListArguments(this.value, this.value2);

}
