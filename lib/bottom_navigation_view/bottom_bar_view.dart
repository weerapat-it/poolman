import 'dart:math' as math;
<<<<<<< HEAD
import 'package:JDPoolsApplication/bottom_navigation_view/navapp_theme.dart';
import 'package:JDPoolsApplication/enums.dart';
import 'package:JDPoolsApplication/helper/dialog_helper.dart';
import 'package:JDPoolsApplication/models/tabIcon_data.dart';
import 'package:JDPoolsApplication/screens/homepage_poolman.dart';

import 'package:JDPoolsApplication/screens/home.dart';
import 'package:flutter/material.dart';

import 'package:JDPoolsApplication/screens/voucher/voucher_screen.dart';
import 'package:JDPoolsApplication/screens/home/components/icon_btn_with_counter.dart';
import 'package:JDPoolsApplication/constants.dart';
import 'package:JDPoolsApplication/screens/shop/shop_screen.dart';
import 'package:JDPoolsApplication/screens/home/home_screen.dart';
import 'package:JDPoolsApplication/screens/history/history_screen.dart';
import 'package:JDPoolsApplication/screens/history_payment/history_payment_screen.dart';
import 'package:JDPoolsApplication/screens/profile/profile_screen.dart';
import 'package:JDPoolsApplication/screens/home.dart';

import 'package:JDPoolsApplication/screens/sign_in/sign_in_screen.dart';
import 'package:JDPoolsApplication/screens/notice/notice_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import '../constants.dart';
import '../../main.dart';
import '../models/tabIcon_data.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:flutter_session/flutter_session.dart';
class BottomBarView extends StatefulWidget {
  const BottomBarView({Key key, @required this.selectedMenu,}) : super(key: key);


  final MenuState selectedMenu;

=======
import 'package:best_flutter_ui_templates/fitness_app/fitness_app_theme.dart';
import 'package:best_flutter_ui_templates/fitness_app/models/tabIcon_data.dart';
import 'package:best_flutter_ui_templates/main.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../models/tabIcon_data.dart';

class BottomBarView extends StatefulWidget {
  const BottomBarView(
      {Key? key, this.tabIconsList, this.changeIndex, this.addClick})
      : super(key: key);

  final Function(int index)? changeIndex;
  final Function()? addClick;
  final List<TabIconData>? tabIconsList;
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
  @override
  _BottomBarViewState createState() => _BottomBarViewState();
}

class _BottomBarViewState extends State<BottomBarView>
    with TickerProviderStateMixin {
<<<<<<< HEAD
  AnimationController animationController;
  var userId,tokenIds,permission;
  String tokenId,sstatus;
  List data = [];
  int intdata = 0;
  int numOfitem = 0;
=======
  AnimationController? animationController;

>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
<<<<<<< HEAD
      duration: const Duration(milliseconds:0),
    );
    animationController?.forward();

    _getThingsOnStartup().then((value){
      getNotice().then((result) {
        // print("result: "+result);
        setState(() {
          numOfitem = result;
        });

      });
    });
    super.initState();
  }
  Future getNotice()  async {

    userId = "${await FlutterSession().get("userId")}";

    // String Url = "http://jdpoolswebservice.com/spintest/notice.php";
    var url = Uri.https('jdpoolswebservice.com', '/spintest/notice.php', {'q': '{http}'});
    // var url = Uri.https('http://jdpoolswebservice.com/spintest/notice.php', '/books/v1/volumes', {'q': '{http}'});
    var res = await http.post(url,headers:{"Accept" : "application/json"},
        body: {
          "user_Id" : userId.toString(),
          "notice" : "1",
        }
    );
    var resBody = json.decode(res.body);
    // print("Id"+resBody);
    intdata = resBody;
    return intdata;

    // print("aaa ${await FlutterSession().get("userId")}");
  }
  Future check()  async {
    userId = "${await FlutterSession().get("userId")}";

    tokenIds = "${await FlutterSession().get("tokenId")}";

    permission = "${await FlutterSession().get("permission")}";
    print(tokenIds);
    return tokenIds;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color(0xFF979797).withOpacity(
                    1),
                offset: const Offset(0, 0),
                blurRadius: 1.0),
          ],
        ),
        // child: Stack(
        //   alignment: AlignmentDirectional.bottomCenter,
        //   children: <Widget>[
        //    Transform(
        //           transform: Matrix4.translationValues(0.0, 0.0, 0.0),
        //           child: PhysicalShape(
        //             color: kPrimaryColor2,
        //             elevation: 16.0,
        //             clipper: TabClipper(
        //                 radius: Tween<double>(begin: 0.0, end: 1.0)
        //                         .animate(CurvedAnimation(
        //                             parent: animationController,
        //                             curve: Curves.fastOutSlowIn))
        //                         .value *
        //                     0.0),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 60,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 8, right: 8, top: 4),
                            child: Row(
                              children: <Widget>[
                                // Column(
                                //     mainAxisSize: MainAxisSize.min,
                                //     children: [
                                //       IconButton(
                                //
                                //         icon: SvgPicture.asset(
                                //           "assets/icons/home.svg",
                                //           color: MenuState.home == widget.selectedMenu
                                //               ? ActiveIconColor
                                //               : inActiveIconColor,
                                //
                                //         ),
                                //          iconSize: 5,
                                //         onPressed: () =>
                                //
                                //         // Navigator.pushNamed(context, HomeScreen.routeName),
                                //         Navigator.of(context).pushNamedAndRemoveUntil( HomeScreen.routeName, (Route<dynamic> route) => false),
                                //
                                //       ),
                                //       Text('Home'),
                                //
                                //     ],
                                //
                                // ),
                            Expanded(
                            child: InkWell(
                                  onTap: () { Navigator.of(context).pushNamedAndRemoveUntil( HomeScreen.routeName, (Route<dynamic> route) => false);},
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      // Icon(Icons.home.svg,color:MenuState.home == widget.selectedMenu
                                      //               ? ActiveIconColor
                                      //               : inActiveIconColor),
                                  SvgPicture.asset(
                                            "assets/icons/home.svg",
                                            color: MenuState.home == widget.selectedMenu
                                                ? ActiveIconColor
                                                : inActiveIconColor,

                                          ),
                                      Text("Home",style: TextStyle(fontFamily: 'Kanit',color:MenuState.home == widget.selectedMenu
                                          ? ActiveIconColor
                                          : inActiveIconColor ))
                                    ],
                                  ),
                                ),
                            ),
                      // Expanded(
                      //   child: InkWell(
                      //             onTap: () { Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context) => shopScreen(search : null)), (route) => false);},
                      //             child: Column(
                      //               mainAxisSize: MainAxisSize.min,
                      //               children: <Widget>[
                      //                 SvgPicture.asset(
                      //                   "assets/icons/shopping-cart.svg",
                      //                   color: MenuState.shop == widget.selectedMenu
                      //                       ? ActiveIconColor
                      //                       : inActiveIconColor,
                      //
                      //                 ),
                      //
                      //                 Text("Store",style: TextStyle(fontFamily: 'Kanit',color:MenuState.shop == widget.selectedMenu
                      //                     ? ActiveIconColor
                      //                     : inActiveIconColor ))
                      //               ],
                      //             ),
                      //           ),
                      // ),

                                // Expanded(
                                //   child: InkWell(
                                //     onTap: () {
                                //       // Navigator.of(context).pushNamedAndRemoveUntil( NoticeScreen.routeName, (Route<dynamic> route) => false);
                                //       },
                                //     child: Column(
                                //       mainAxisSize: MainAxisSize.min,
                                //       children: <Widget>[
                                //         SvgPicture.asset(
                                //           "assets/icons/bell-ringing-2.svg",
                                //           color: MenuState.notice == widget.selectedMenu
                                //               ? ActiveIconColor
                                //               : inActiveIconColor,
                                //
                                //         ),
                                //
                                //         Text("Notification",style: TextStyle(fontFamily: 'Kanit',color:MenuState.notice == widget.selectedMenu
                                //             ? ActiveIconColor
                                //             : inActiveIconColor ))
                                //       ],
                                //     ),
                                //   ),
                                // ),

                                Expanded(
                                  child: InkWell(
                                    onTap: () { Navigator.of(context).pushNamed( ProfileScreen.routeName);},
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        SvgPicture.asset(
                                          "assets/icons/user-circle.svg",
                                          color: MenuState.profile == widget.selectedMenu
                                              ? ActiveIconColor
                                              : inActiveIconColor,

                                        ),

                                        Text("Me",style: TextStyle(fontFamily: 'Kanit',color:MenuState.profile == widget.selectedMenu
                                            ? ActiveIconColor
                                            : inActiveIconColor ))
                                      ],
                                    ),
                                  ),
                                ),





                                // IconBtnWithCounter(
                                //     svgSrc: "assets/icons/Chat bubble Icon.svg",
                                //       // color: MenuState.historyScreen == widget.selectedMenu
                                //       //     ? kPrimaryColor
                                //       //     : inActiveIconColor,
                                //     numOfitem: 3,
                                //     press: () =>
                                //
                                //         check().then((result) {
                                //           print("result: $result");
                                //           setState(() {
                                //             userId = result;
                                //             // if(userId != ''&& userId != null){
                                //             //   DialogHelper.exit(context);
                                //             // }else{
                                //             //   DialogHelper.exit(context);
                                //             // }
                                //             if(userId != ''&& userId != null){
                                //               // Navigator.of(context).pushNamedAndRemoveUntil( HomeScreen.routeName, (Route<dynamic> route) => false);
                                //               // print(userId);
                                //               Navigator.of(context).pushNamedAndRemoveUntil( historyScreen.routeName, (Route<dynamic> route) => false);
                                //             }else{
                                //               Navigator.of(context).pushNamed( SignInScreen.routeName);
                                //             }
                                //           });
                                //
                                //         }),
                                //
                                //   ),
                    // Expanded(
                    //             child:SizedBox(
                    //               width: Tween<double>(begin: 0.0, end: 1.0)
                    //                       .animate(CurvedAnimation(
                    //                           parent: animationController,
                    //                           curve: Curves.fastOutSlowIn))
                    //                       .value *
                    //                   64.0,
                    //             ),
                    // ),
                    //         InkWell(
                    //
                    //               borderRadius: BorderRadius.circular(100),
                    //               onTap: () =>
                    //                   check().then((result) {
                    //                     print("result: $result");
                    //                     setState(() {
                    //                       userId = result;
                    //                       // if(userId != ''&& userId != null){
                    //                       //   DialogHelper.exit(context);
                    //                       // }else{
                    //                       //   DialogHelper.exit(context);
                    //                       // }
                    //                       if(userId != ''&& userId != null){
                    //                         // Navigator.of(context).pushNamedAndRemoveUntil( HomeScreen.routeName, (Route<dynamic> route) => false);
                    //                         // print(userId);
                    //                         // Navigator.of(context).pushNamed( voucherScreen.routeName);
                    //                         Navigator.of(context).pushNamedAndRemoveUntil( NoticeScreen.routeName, (Route<dynamic> route) => false);
                    //
                    //
                    //                       }else{
                    //                         Navigator.of(context).pushNamed( SignInScreen.routeName);
                    //                       }
                    //                     });
                    //
                    //                   }),
                    //               child: Stack(
                    //                 overflow: Overflow.visible,
                    //                 children: [
                    //                   Container(
                    //                     padding: EdgeInsets.all(getProportionateScreenWidth(12)),
                    //                     height: getProportionateScreenWidth(46),
                    //                     width: getProportionateScreenWidth(46),
                    //
                    //                     child: SvgPicture.asset("assets/icons/Chat bubble Icon.svg",
                    //                       color: MenuState.notice == widget.selectedMenu
                    //                           ? ActiveIconColor
                    //                           : inActiveIconColor,),
                    //                   ),
                    //                   if (numOfitem != 0)
                    //                     Positioned(
                    //                       top: -3,
                    //                       right: 0,
                    //                       child: Container(
                    //                         height: getProportionateScreenWidth(16),
                    //                         width: getProportionateScreenWidth(16),
                    //                         decoration: BoxDecoration(
                    //                           color: Color(0xFFFF4848),
                    //                           shape: BoxShape.circle,
                    //                           border: Border.all(width: 1.5, color: Colors.white),
                    //                         ),
                    //                         child: Center(
                    //                           child: Text(
                    //                             "$numOfitem",
                    //                             style: TextStyle(
                    //                               fontSize: getProportionateScreenWidth(10),
                    //                               height: 1,
                    //                               fontWeight: FontWeight.w600,
                    //                               color: Colors.white,
                    //                             ),
                    //                           ),
                    //                         ),
                    //                       ),
                    //                     )
                    //                 ],
                    //               ),
                    //             ),

                                // Expanded(
                                //   child:IconButton(
                                //     icon: SvgPicture.asset("assets/icons/receipt.svg",
                                //       color: MenuState.historyPaymentScreen == widget.selectedMenu
                                //           ? kPrimaryColor
                                //           : inActiveIconColor,),
                                //
                                //     onPressed: () =>
                                //         check().then((result) {
                                //           print("result: $result");
                                //           setState(() {
                                //             userId = result;
                                //             if(userId != ''&& userId != null){
                                //
                                //               Navigator.of(context).pushNamedAndRemoveUntil( historyPaymentScreen.routeName, (Route<dynamic> route) => false);
                                //             }else{
                                //               Navigator.of(context).pushNamed( SignInScreen.routeName);
                                //             }
                                //           });
                                //
                                //         }),
                                //     // Navigator.pushNamed(context, ProfileScreen.routeName),
                                //     // Navigator.of(context).pushNamedAndRemoveUntil( historyScreen.routeName, (Route<dynamic> route) => false),
                                //
                                //   ),
                                // ),
                                // Expanded(
                                //   child: IconButton(
                                //     icon: SvgPicture.asset(
                                //       "assets/icons/User Icon.svg",
                                //       color: MenuState.profile == widget.selectedMenu
                                //           ? ActiveIconColor
                                //           : inActiveIconColor,
                                //     ),
                                //     onPressed: () =>
                                //         check().then((result) {
                                //           print("result: $result");
                                //           setState(() {
                                //             userId = result;
                                //             if(userId != ''&& userId != null){
                                //
                                //               // Navigator.of(context).pushNamedAndRemoveUntil( ProfileScreen.routeName, (Route<dynamic> route) => false);
                                //               Navigator.of(context).pushNamed( ProfileScreen.routeName);
                                //             }else{
                                //               Navigator.of(context).pushNamed( SignInScreen.routeName);
                                //             }
                                //           });
                                //
                                //         }),
                                //     // Navigator.pushNamed(context, ProfileScreen.routeName),
                                //     // Navigator.of(context).pushNamedAndRemoveUntil( ProfileScreen.routeName, (Route<dynamic> route) => false),
                                //
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).padding.bottom,
                        )
                      ],
                    ),
                //   ),
                // ),

            // Padding(
            //   padding:
            //       EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
            //   child: SizedBox(
            //     width: 38 * 2.0,
            //     height: 38 + 62.0,
            //     child: Container(
            //       alignment: Alignment.topCenter,
            //       color: Colors.transparent,
            //       child: SizedBox(
            //         width: 38 * 2.0,
            //         height: 38 * 2.0,
            //         child: Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: ScaleTransition(
            //             alignment: Alignment.center,
            //             scale: Tween<double>(begin: 0.0, end: 1.0).animate(
            //                 CurvedAnimation(
            //                     parent: animationController,
            //                     curve: Curves.fastOutSlowIn)),
            //             child: Container(
            //               // alignment: Alignment.center,s
            //               decoration: BoxDecoration(
            //                 color: ActiveIconColor,
            //                 // gradient: LinearGradient(
            //                 //     colors: [
            //                 //       kPrimaryColorbtn2,
            //                 //       kPrimaryColor2,
            //                 //     ],
            //                 //     begin: Alignment.topLeft,
            //                 //     end: Alignment.bottomRight),
            //                 shape: BoxShape.circle,
            //                 boxShadow: <BoxShadow>[
            //                   BoxShadow(
            //                       color: kTextColor
            //                           .withOpacity(0.6),
            //                       offset: const Offset(2.0, 2.0),
            //                       blurRadius: 8.0),
            //                 ],
            //               ),
            //               child: Material(
            //                 color: Colors.transparent,
            //                 child: InkWell(
            //                   splashColor: Colors.white.withOpacity(0.1),
            //                   highlightColor: Colors.transparent,
            //                   focusColor: Colors.transparent,
            //                   onTap: () => check().then((result) {
            //                     print("result: $result");
            //                     setState(() {
            //                       tokenIds = result;
            //                       // if(userId != ''&& userId != null){
            //                       if(tokenIds != ''&& tokenIds != null){
            //                         // Navigator.of(context).pushNamedAndRemoveUntil( HomeScreen.routeName, (Route<dynamic> route) => false);
            //                         // print(userId);
            //                         if(permission == "poolman") {
            //                           Navigator.of(context).pushNamedAndRemoveUntil(
            //                               MyHomePagePoolman.routeName, (
            //                               Route<dynamic> route) => false);
            //                         }else{
            //                           Navigator.of(context).pushNamedAndRemoveUntil(
            //                               MyHomePageFirst.routeName, (
            //                               Route<dynamic> route) => false);
            //                         }
            //                       }else{
            //                         Navigator.of(context).pushNamed( SignInScreen.routeName);
            //                       }
            //                     });
            //
            //                   }),
            //                   child: Image.asset("assets/images/water.png")
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
        //   ],
        // ),
      ),
    );
  }


}



=======
      duration: const Duration(milliseconds: 1000),
    );
    animationController?.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        AnimatedBuilder(
          animation: animationController!,
          builder: (BuildContext context, Widget? child) {
            return Transform(
              transform: Matrix4.translationValues(0.0, 0.0, 0.0),
              child: PhysicalShape(
                color: FitnessAppTheme.white,
                elevation: 16.0,
                clipper: TabClipper(
                    radius: Tween<double>(begin: 0.0, end: 1.0)
                            .animate(CurvedAnimation(
                                parent: animationController!,
                                curve: Curves.fastOutSlowIn))
                            .value *
                        38.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 62,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 8, right: 8, top: 4),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: TabIcons(
                                  tabIconData: widget.tabIconsList?[0],
                                  removeAllSelect: () {
                                    setRemoveAllSelection(
                                        widget.tabIconsList?[0]);
                                    widget.changeIndex!(0);
                                  }),
                            ),
                            Expanded(
                              child: TabIcons(
                                  tabIconData: widget.tabIconsList?[1],
                                  removeAllSelect: () {
                                    setRemoveAllSelection(
                                        widget.tabIconsList?[1]);
                                    widget.changeIndex!(1);
                                  }),
                            ),
                            SizedBox(
                              width: Tween<double>(begin: 0.0, end: 1.0)
                                      .animate(CurvedAnimation(
                                          parent: animationController!,
                                          curve: Curves.fastOutSlowIn))
                                      .value *
                                  64.0,
                            ),
                            Expanded(
                              child: TabIcons(
                                  tabIconData: widget.tabIconsList?[2],
                                  removeAllSelect: () {
                                    setRemoveAllSelection(
                                        widget.tabIconsList?[2]);
                                    widget.changeIndex!(2);
                                  }),
                            ),
                            Expanded(
                              child: TabIcons(
                                  tabIconData: widget.tabIconsList?[3],
                                  removeAllSelect: () {
                                    setRemoveAllSelection(
                                        widget.tabIconsList?[3]);
                                    widget.changeIndex!(3);
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).padding.bottom,
                    )
                  ],
                ),
              ),
            );
          },
        ),
        Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
          child: SizedBox(
            width: 38 * 2.0,
            height: 38 + 62.0,
            child: Container(
              alignment: Alignment.topCenter,
              color: Colors.transparent,
              child: SizedBox(
                width: 38 * 2.0,
                height: 38 * 2.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ScaleTransition(
                    alignment: Alignment.center,
                    scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                            parent: animationController!,
                            curve: Curves.fastOutSlowIn)),
                    child: Container(
                      // alignment: Alignment.center,s
                      decoration: BoxDecoration(
                        color: FitnessAppTheme.nearlyDarkBlue,
                        gradient: LinearGradient(
                            colors: [
                              FitnessAppTheme.nearlyDarkBlue,
                              HexColor('#6A88E5'),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight),
                        shape: BoxShape.circle,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: FitnessAppTheme.nearlyDarkBlue
                                  .withOpacity(0.4),
                              offset: const Offset(8.0, 16.0),
                              blurRadius: 16.0),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: Colors.white.withOpacity(0.1),
                          highlightColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          onTap: widget.addClick,
                          child: Icon(
                            Icons.add,
                            color: FitnessAppTheme.white,
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void setRemoveAllSelection(TabIconData? tabIconData) {
    if (!mounted) return;
    setState(() {
      widget.tabIconsList?.forEach((TabIconData tab) {
        tab.isSelected = false;
        if (tabIconData!.index == tab.index) {
          tab.isSelected = true;
        }
      });
    });
  }
}

class TabIcons extends StatefulWidget {
  const TabIcons({Key? key, this.tabIconData, this.removeAllSelect})
      : super(key: key);

  final TabIconData? tabIconData;
  final Function()? removeAllSelect;
  @override
  _TabIconsState createState() => _TabIconsState();
}

class _TabIconsState extends State<TabIcons> with TickerProviderStateMixin {
  @override
  void initState() {
    widget.tabIconData?.animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    )..addStatusListener((AnimationStatus status) {
        if (status == AnimationStatus.completed) {
          if (!mounted) return;
          widget.removeAllSelect!();
          widget.tabIconData?.animationController?.reverse();
        }
      });
    super.initState();
  }

  void setAnimation() {
    widget.tabIconData?.animationController?.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Center(
        child: InkWell(
          splashColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          hoverColor: Colors.transparent,
          onTap: () {
            if (!widget.tabIconData!.isSelected) {
              setAnimation();
            }
          },
          child: IgnorePointer(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: <Widget>[
                ScaleTransition(
                  alignment: Alignment.center,
                  scale: Tween<double>(begin: 0.88, end: 1.0).animate(
                      CurvedAnimation(
                          parent: widget.tabIconData!.animationController!,
                          curve:
                              Interval(0.1, 1.0, curve: Curves.fastOutSlowIn))),
                  child: Image.asset(widget.tabIconData!.isSelected
                      ? widget.tabIconData!.selectedImagePath
                      : widget.tabIconData!.imagePath),
                ),
                Positioned(
                  top: 4,
                  left: 6,
                  right: 0,
                  child: ScaleTransition(
                    alignment: Alignment.center,
                    scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                            parent: widget.tabIconData!.animationController!,
                            curve: Interval(0.2, 1.0,
                                curve: Curves.fastOutSlowIn))),
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: FitnessAppTheme.nearlyDarkBlue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  left: 6,
                  bottom: 8,
                  child: ScaleTransition(
                    alignment: Alignment.center,
                    scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                            parent: widget.tabIconData!.animationController!,
                            curve: Interval(0.5, 0.8,
                                curve: Curves.fastOutSlowIn))),
                    child: Container(
                      width: 4,
                      height: 4,
                      decoration: BoxDecoration(
                        color: FitnessAppTheme.nearlyDarkBlue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 6,
                  right: 8,
                  bottom: 0,
                  child: ScaleTransition(
                    alignment: Alignment.center,
                    scale: Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                            parent: widget.tabIconData!.animationController!,
                            curve: Interval(0.5, 0.6,
                                curve: Curves.fastOutSlowIn))),
                    child: Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: FitnessAppTheme.nearlyDarkBlue,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc

class TabClipper extends CustomClipper<Path> {
  TabClipper({this.radius = 38.0});

  final double radius;

  @override
  Path getClip(Size size) {
    final Path path = Path();

    final double v = radius * 2;
    path.lineTo(0, 0);
    path.arcTo(Rect.fromLTWH(0, 0, radius, radius), degreeToRadians(180),
        degreeToRadians(90), false);
    path.arcTo(
        Rect.fromLTWH(
            ((size.width / 2) - v / 2) - radius + v * 0.04, 0, radius, radius),
        degreeToRadians(270),
        degreeToRadians(70),
        false);

    path.arcTo(Rect.fromLTWH((size.width / 2) - v / 2, -v / 2, v, v),
        degreeToRadians(160), degreeToRadians(-140), false);

    path.arcTo(
        Rect.fromLTWH((size.width - ((size.width / 2) - v / 2)) - v * 0.04, 0,
            radius, radius),
        degreeToRadians(200),
        degreeToRadians(70),
        false);
    path.arcTo(Rect.fromLTWH(size.width - radius, 0, radius, radius),
        degreeToRadians(270), degreeToRadians(90), false);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(TabClipper oldClipper) => true;

  double degreeToRadians(double degree) {
    final double redian = (math.pi / 180) * degree;
    return redian;
  }
}
<<<<<<< HEAD
class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
Future _getThingsOnStartup() async {
  await Future.delayed(Duration(seconds: 1));
}
=======
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
