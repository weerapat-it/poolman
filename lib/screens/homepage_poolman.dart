import 'package:JDPoolsApplication/bottom_navigation_view/bottom_bar_view.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/screens/imagePicker.dart';
import 'package:JDPoolsApplication/enums.dart';
<<<<<<< HEAD
import 'package:flutter_svg/svg.dart';
=======
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
import 'dart:io';

import '../constants.dart';
import '../size_config.dart';
import 'package:JDPoolsApplication/screens/job/job_screen.dart';
import 'display_picture_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:JDPoolsApplication/components/coustom_bottom_nav_bar.dart';
import 'input_screen.dart';
import 'imagePicker.dart';
import 'package:flutter_session/flutter_session.dart';

<<<<<<< HEAD
class MyHomePagePoolman extends StatefulWidget {
  static String routeName = "/homePoolman";
  @override
  _MyHomePagePoolmanState createState() => _MyHomePagePoolmanState();
}

class _MyHomePagePoolmanState extends State<MyHomePagePoolman> {
=======
class MyHomePageFirst extends StatefulWidget {
  static String routeName = "/homeFirst";
  @override
  _MyHomePageFirstState createState() => _MyHomePageFirstState();
}

class _MyHomePageFirstState extends State<MyHomePageFirst> {
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
   CameraDescription camera;
   var userId,tokenIds,status,permission;

   String tokenId;

   List data = [];
   Future check()  async {
     userId = "${await FlutterSession().get("userId")}";
     tokenIds = "${await FlutterSession().get("tokenId")}";
     status = "${await FlutterSession().get("status")}";
     permission = "${await FlutterSession().get("permission")}";
     data.add(userId.toString());
     data.add(tokenIds.toString());
     data.add(status.toString());
     data.add(permission.toString());

     print(data);
     return data;
   }
<<<<<<< HEAD

   showLoaderDialog(BuildContext context){



     showDialog(barrierDismissible: false,
       context:context,
       builder:(BuildContext context){
         return Image.asset("assets/images/spingif.gif",width: 30,height: 30,);
       },
     );

   }
=======
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
  @override
  void initState()  {

    _getThingsOnStartup().then((value){
      check().then((result) {
        print("result: "+result[0]+result[1]+result[2]+result[3]);
        setState(() {
          permission = result[3];

        });

      });
    });
    super.initState();



  }

  @override
  void dispose() {
    super.dispose();
  }

  void ca() async{
    final cameras = await availableCameras();

    // Get a specific camera from the list of available cameras.
    camera = cameras.first;
  }
   File _image;
   final picker = ImagePicker();
   Future _imgFromCamera() async {
     File image = await ImagePicker.pickImage(
         source: ImageSource.camera, imageQuality: 50
     );

     setState(() {
       _image = image;
     });

     return image;
   }

   Future _imgFromGallery() async {
     File image = await  ImagePicker.pickImage(
         source: ImageSource.gallery, imageQuality: 50
     );

     setState(() {
       _image = image;
     });
     return image;
   }
   void _showPicker(context) {
     showModalBottomSheet(
         context: context,
         builder: (BuildContext bc) {
           return SafeArea(
             child: Container(
               child: new Wrap(
                 children: <Widget>[
                   new ListTile(
                       leading: new Icon(Icons.photo_library),
                       title: new Text('Photo Library'),
                       onTap: () {

                         Navigator.of(context).pop();
                         _imgFromGallery().then((result) {
                           // print("result: $result");
                           setState(() {
                             _image = result;
                           });
                           if(_image != null) {

                             Navigator.push(context, MaterialPageRoute(
                               builder: (context) =>
                                   DisplayPictureScreen(

                                     file: _image,
                                   ),
                             ));
                           }else{

                           }
                         });

                       }),
                   new ListTile(
                     leading: new Icon(Icons.photo_camera),
                     title: new Text('Camera'),
                     onTap: () {

                       Navigator.of(context).pop();
                       _imgFromCamera().then((result) {
                         // print("result: $result");
                         setState(() {
                           _image = result;
                         });
                         if(_image != null) {
                           Navigator.push(context, MaterialPageRoute(
                             builder: (context) =>
                                 DisplayPictureScreen(

                                   file: _image,
                                 ),
                           ));
                         }else{

                         }
                       });
                     },
                   ),

                 ],
               ),
             ),
           );
         }
     );
   }
  @override
  Widget build(BuildContext context) {

<<<<<<< HEAD

      return new Scaffold(
        // extendBodyBehindAppBar: true,
        // appBar: buildAppBar(context),
        // appBar: new AppBar(
        //   iconTheme: IconThemeData(
        //     color: kPrimaryColor, //change your color here
        //   ),
        //   centerTitle: true,
        //   backgroundColor: Color(0x44000000),
        //   elevation: 0.0,
        //
        // ),
        body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Image.asset(
                'assets/images/bgpagejob.png',

                fit: BoxFit.fill,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Container(
                  width: double.infinity,
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[

                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: new Row(
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

                          ],

                        ),
                      ),
                      // new StakedIcons(),
                      // new Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: <Widget>[
                      //     Padding(
                      //       padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
                      //       child: new Text(
                      //         "J.D.Pools Service",
                      //         style: new TextStyle(fontSize: 30.0,color: kPrimaryColor2),
                      //       ),
                      //     )
                      //   ],
                      // ),
                      // Center(
                      //   child: GestureDetector(
                      //     onTap: () {
                      //       // _imgFromGallery();
                      //       _showPicker(context);
                      //     },
                      //     child: new Container(
                      //       child: SizedBox(
                      //         height: 200,
                      //         width: 200,
                      //         child: CircleAvatar(
                      //           backgroundColor:  Colors.grey[800],
                      //
                      //
                      //           child: _image != null
                      //               ? ClipRRect(
                      //             borderRadius: BorderRadius.circular(100),
                      //             child: Image.file(
                      //               _image,
                      //               width: MediaQuery.of(context).size.width,
                      //               height: MediaQuery.of(context).size.height,
                      //               fit: BoxFit.fitHeight,
                      //
                      //             ),
                      //           )
                      //               : Container(
                      //             decoration: BoxDecoration(
                      //                 color: Colors.grey[200],
                      //                 borderRadius: BorderRadius.circular(100)),
                      //             width: MediaQuery.of(context).size.width,
                      //             height: MediaQuery.of(context).size.height,
                      //             child: Icon(
                      //               Icons.camera_alt,
                      //               color: Colors.grey[800],
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //
                      //   ),
                      //
                      // ),
                      // new Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: <Widget>[
                      //     Expanded(
                      //       child: Padding(
                      //         padding: const EdgeInsets.only(
                      //             left: 20.0, right: 20.0, top: 60.0),
                      //
                      //         child: GestureDetector(
                      //           onTap: () {
                      //             Navigator.push(context, MaterialPageRoute(
                      //               builder: (context) => DisplayPictureScreen(
                      //
                      //                 file: _image,
                      //               ),
                      //             ));
                      //           },
                      //           child: new Container(
                      //               alignment: Alignment.center,
                      //               height: 60.0,
                      //               decoration: new BoxDecoration(
                      //                   color: Color(0xFFf17b26),
                      //                   borderRadius: new BorderRadius.circular(9.0)),
                      //               child: new Text("Start",
                      //                   style: new TextStyle(
                      //                       fontSize: 20.0, color: Colors.white))),
                      //         ),
                      //       ),
                      //     ),
                      //
                      //   ],
                      // ),
                      // // new Row(
                      // //   mainAxisAlignment: MainAxisAlignment.center,
                      // //   children: <Widget>[
                      // //     Expanded(
                      // //       child: Padding(
                      // //         padding: const EdgeInsets.only(
                      // //             left: 20.0, right: 5.0, top: 10.0),
                      // //         child: GestureDetector(
                      // //           onTap: () {
                      // //             Navigator.push(context, MaterialPageRoute(
                      // //               builder: (context) => imagePicker()
                      // //             ));
                      // //           },
                      // //           child: new Container(
                      // //               alignment: Alignment.center,
                      // //               height: 60.0,
                      // //               decoration: new BoxDecoration(
                      // //                   color: Color(0xFFf17b26),
                      // //                   borderRadius: new BorderRadius.circular(9.0)),
                      // //               child: new Text("Picker image",
                      // //                   style: new TextStyle(
                      // //                       fontSize: 20.0, color: Colors.white))),
                      // //         ),
                      // //       ),
                      // //     ),
                      // //
                      // //   ],
                      // // ),
                      // new Row(
                      //
                      //   children: <Widget>[
                      //     Expanded(
                      //       child: Padding(
                      //         padding: const EdgeInsets.only(
                      //             left: 20.0, right: 20.0, top: 10.0),
                      //         child: GestureDetector(
                      //           onTap: () {
                      //             Navigator.push(context, MaterialPageRoute(
                      //                 builder: (context) => inputScreen()
                      //             ));
                      //           },
                      //           child: new Container(
                      //               alignment: Alignment.center,
                      //               height: 60.0,
                      //               decoration: new BoxDecoration(
                      //                   color: Color(0xFFf17b26),
                      //                   borderRadius: new BorderRadius.circular(9.0)),
                      //               child: new Text("Test kit",
                      //                   style: new TextStyle(
                      //                       fontSize: 20.0, color: Colors.white))),
                      //         ),
                      //       ),
                      //     ),
                      //
                      //
                      //   ],
                      //
                      // ),

                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: SizedBox(

                          child: Image.asset(
                            "assets/images/imagelablogo.png",

                          ),

                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 40.0),
                      //   child: new Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: <Widget>[
                      //
                      //
                      //
                      //       SizedBox(
                      //         width: getProportionateScreenWidth(300),
                      //         height: getProportionateScreenHeight(82),
                      //         child: GestureDetector(
                      //           onTap: () {
                      //             // Navigator.push(context, MaterialPageRoute(
                      //             //   builder: (context) => DisplayPictureScreen(
                      //             //
                      //             //     file: _image,
                      //             //   ),
                      //             // ));
                      //             _showPicker(context);
                      //           },
                      //           child: Container(
                      //             decoration: BoxDecoration(
                      //               color: kwhite,
                      //               boxShadow: <BoxShadow>[
                      //                 BoxShadow(
                      //                     color: Color(0xFF979797).withOpacity(1),
                      //                     offset: const Offset(0, -2),
                      //                     blurRadius: 8.0),
                      //               ],
                      //               borderRadius: BorderRadius.only(
                      //                 bottomLeft: Radius.circular(50),
                      //                 bottomRight: Radius.circular(50),
                      //                 topLeft: Radius.circular(50),
                      //                 topRight: Radius.circular(50),
                      //               ),
                      //             ),
                      //
                      //             child: Padding(
                      //               padding: const EdgeInsets.only(left: 2.4,right: 4.5),
                      //               child: Row(
                      //                 crossAxisAlignment: CrossAxisAlignment
                      //                     .start,
                      //                 children: [
                      //                   AspectRatio(
                      //                     aspectRatio: 1.02,
                      //                     child: Container(
                      //
                      //                       decoration: BoxDecoration(
                      //                         borderRadius: BorderRadius.circular(
                      //                             50),
                      //                       ),
                      //                       child: Hero(
                      //                         tag: "Spinner",
                      //                         child:
                      //                         Image.asset(
                      //                             "assets/images/spinner.png",
                      //
                      //                         ),
                      //                         // color: Colors.grey[800],
                      //
                      //                       ),
                      //                     ),
                      //                   ),
                      //
                      //                   Padding(
                      //                     padding: const EdgeInsets.only(top: 10.0),
                      //                     child: Column(
                      //                       crossAxisAlignment: CrossAxisAlignment.start,
                      //                       children: [
                      //                         Text(
                      //                           "Spinner",
                      //                           textAlign: TextAlign.left,
                      //                           style: TextStyle(
                      //                             fontSize: getProportionateScreenWidth(
                      //                                 18),
                      //                             fontWeight: FontWeight.w600,
                      //                             color: Colors.black,
                      //                           ),
                      //                         ),
                      //                         Text(
                      //                           "description detail",
                      //                           textAlign: TextAlign.left,
                      //                           style: TextStyle(
                      //                             fontSize: getProportionateScreenWidth(
                      //                                 14),
                      //                             fontWeight: FontWeight.w400,
                      //                             color: Colors.black,
                      //                           ),
                      //                         ),
                      //                         // InkWell(
                      //                         //   borderRadius: BorderRadius.circular(50),
                      //                         //   onTap: () {},
                      //                         //   child: Container(
                      //                         //     padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                      //                         //     height: getProportionateScreenWidth(28),
                      //                         //     width: getProportionateScreenWidth(28),
                      //                         //     decoration: BoxDecoration(
                      //                         //       color: product.isFavourite
                      //                         //           ? kPrimaryColor.withOpacity(0.15)
                      //                         //           : kSecondaryColor.withOpacity(0.1),
                      //                         //       shape: BoxShape.circle,
                      //                         //     ),
                      //                         //     child: SvgPicture.asset(
                      //                         //       "assets/icons/Heart Icon_2.svg",
                      //                         //       color: product.isFavourite
                      //                         //           ? Color(0xFFFF4848)
                      //                         //           : Color(0xFFDBDEE4),
                      //                         //     ),
                      //                         //   ),
                      //                         // ),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                   Padding(
                      //                     padding: const EdgeInsets.only(top: 25,left: 40),
                      //                     child: Row(
                      //                       mainAxisAlignment: MainAxisAlignment
                      //                           .end,
                      //                       children: [
                      //                         Container(
                      //                           height: 40,
                      //                           width: 40,
                      //                           decoration: BoxDecoration(
                      //                             borderRadius: BorderRadius.circular(10),
                      //                             color: Colors.white,
                      //                             boxShadow: [
                      //                               BoxShadow(
                      //                                   color: Color(0xFF979797).withOpacity(
                      //                                       0.5),
                      //                                   offset: const Offset(0, 0),
                      //                                   blurRadius: 10.0),
                      //                             ],
                      //                           ),
                      //
                      //                           child: InkWell(
                      //                             onTap: () {
                      //                               // Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context) => shopScreen(search : null)), (route) => false);
                      //                             },
                      //                             child:Padding(
                      //                               padding: const EdgeInsets.all(12.0),
                      //                               child: SvgPicture.asset(
                      //                                 "assets/icons/arrow-right.svg",
                      //                               ),
                      //                             ),
                      //
                      //
                      //                           ),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ),
                      //
                      //                 ],
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //
                      //
                      //
                      //
                      //     ],
                      //
                      //   ),
                      // ),

                      // Padding(
                      //   padding: const EdgeInsets.only(top: 24.0),
                      //   child: new Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: <Widget>[
                      //
                      //
                      //
                      //       SizedBox(
                      //         width: getProportionateScreenWidth(300),
                      //         height: getProportionateScreenHeight(82),
                      //         child: GestureDetector(
                      //           onTap: () {
                      //             Navigator.push(context, MaterialPageRoute(
                      //                 builder: (context) => inputScreen()
                      //             ));
                      //           },
                      //           child: Container(
                      //             decoration: BoxDecoration(
                      //               color: kwhite,
                      //               boxShadow: <BoxShadow>[
                      //                 BoxShadow(
                      //                     color: Color(0xFF979797).withOpacity(1),
                      //                     offset: const Offset(0, -2),
                      //                     blurRadius: 8.0),
                      //               ],
                      //               borderRadius: BorderRadius.only(
                      //                 bottomLeft: Radius.circular(50),
                      //                 bottomRight: Radius.circular(50),
                      //                 topLeft: Radius.circular(50),
                      //                 topRight: Radius.circular(50),
                      //               ),
                      //             ),
                      //
                      //             child: Padding(
                      //               padding: const EdgeInsets.only(left: 2.4,right: 4.5),
                      //               child: Row(
                      //                 crossAxisAlignment: CrossAxisAlignment
                      //                     .start,
                      //                 children: [
                      //                   AspectRatio(
                      //                     aspectRatio: 1.02,
                      //                     child: Container(
                      //
                      //                       decoration: BoxDecoration(
                      //
                      //                         borderRadius: BorderRadius.circular(
                      //                             50),
                      //                       ),
                      //                       child: Hero(
                      //                         tag: "Manual",
                      //                         child:
                      //                         Image.asset(
                      //                           "assets/images/manual.png",
                      //
                      //                         ),
                      //                         // color: Colors.grey[800],
                      //
                      //                       ),
                      //                     ),
                      //                   ),
                      //
                      //                   Padding(
                      //                     padding: const EdgeInsets.only(top: 10.0),
                      //                     child: Column(
                      //                       crossAxisAlignment: CrossAxisAlignment.start,
                      //                       children: [
                      //                         Text(
                      //                           "Manual",
                      //                           textAlign: TextAlign.left,
                      //                           style: TextStyle(
                      //                             fontSize: getProportionateScreenWidth(
                      //                                 18),
                      //                             fontWeight: FontWeight.w600,
                      //                             color: Colors.black,
                      //                           ),
                      //                         ),
                      //                         Text(
                      //                           "description detail",
                      //                           textAlign: TextAlign.left,
                      //                           style: TextStyle(
                      //                             fontSize: getProportionateScreenWidth(
                      //                                 14),
                      //                             fontWeight: FontWeight.w400,
                      //                             color: Colors.black,
                      //                           ),
                      //                         ),
                      //                         // InkWell(
                      //                         //   borderRadius: BorderRadius.circular(50),
                      //                         //   onTap: () {},
                      //                         //   child: Container(
                      //                         //     padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                      //                         //     height: getProportionateScreenWidth(28),
                      //                         //     width: getProportionateScreenWidth(28),
                      //                         //     decoration: BoxDecoration(
                      //                         //       color: product.isFavourite
                      //                         //           ? kPrimaryColor.withOpacity(0.15)
                      //                         //           : kSecondaryColor.withOpacity(0.1),
                      //                         //       shape: BoxShape.circle,
                      //                         //     ),
                      //                         //     child: SvgPicture.asset(
                      //                         //       "assets/icons/Heart Icon_2.svg",
                      //                         //       color: product.isFavourite
                      //                         //           ? Color(0xFFFF4848)
                      //                         //           : Color(0xFFDBDEE4),
                      //                         //     ),
                      //                         //   ),
                      //                         // ),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                   Padding(
                      //                     padding: const EdgeInsets.only(top: 25,left: 40),
                      //                     child: Row(
                      //                       mainAxisAlignment: MainAxisAlignment
                      //                           .end,
                      //                       children: [
                      //                         Container(
                      //                           height: 40,
                      //                           width: 40,
                      //                           decoration: BoxDecoration(
                      //                             borderRadius: BorderRadius.circular(10),
                      //                             color: Colors.white,
                      //                             boxShadow: [
                      //                               BoxShadow(
                      //                                   color: Color(0xFF979797).withOpacity(
                      //                                       0.5),
                      //                                   offset: const Offset(0, 0),
                      //                                   blurRadius: 10.0),
                      //                             ],
                      //                           ),
                      //
                      //                           child: InkWell(
                      //                             onTap: () {
                      //                               // Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context) => shopScreen(search : null)), (route) => false);
                      //                             },
                      //                             child:Padding(
                      //                               padding: const EdgeInsets.all(12.0),
                      //                               child: SvgPicture.asset(
                      //                                 "assets/icons/arrow-right.svg",
                      //                               ),
                      //                             ),
                      //
                      //
                      //                           ),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ),
                      //
                      //                 ],
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //
                      //
                      //
                      //
                      //     ],
                      //
                      //   ),
                      // ),

                      // Padding(
                      //   padding: const EdgeInsets.only(top: 20.0),
                      //   child: new Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: <Widget>[
                      //
                      //
                      //       Padding(
                      //         padding: EdgeInsets.only(
                      //             left: getProportionateScreenWidth(20)),
                      //         child: SizedBox(
                      //           width: getProportionateScreenWidth(140),
                      //           child: GestureDetector(
                      //             onTap: () {
                      //               Navigator.push(context, MaterialPageRoute(
                      //                   builder: (context) => inputScreen()
                      //               ));
                      //
                      //             },
                      //             child: Container(
                      //               decoration: BoxDecoration(
                      //                 color: kwhite,
                      //                 boxShadow: <BoxShadow>[
                      //                   BoxShadow(
                      //                       color: Color(0xFF979797).withOpacity(
                      //                           1),
                      //                       offset: const Offset(0, -2),
                      //                       blurRadius: 8.0),
                      //                 ],
                      //                 borderRadius: BorderRadius.only(
                      //                   bottomLeft: Radius.circular(20),
                      //                   bottomRight: Radius.circular(20),
                      //                   topLeft: Radius.circular(20),
                      //                   topRight: Radius.circular(20),
                      //                 ),
                      //               ),
                      //
                      //               child: Padding(
                      //                 padding: const EdgeInsets.all(20.0),
                      //                 child: Column(
                      //                   crossAxisAlignment: CrossAxisAlignment
                      //                       .start,
                      //                   children: [
                      //                     AspectRatio(
                      //                       aspectRatio: 1.02,
                      //                       child: Container(
                      //                         padding: EdgeInsets.all(
                      //                             getProportionateScreenWidth(
                      //                                 20)),
                      //                         decoration: BoxDecoration(
                      //                           color: kwhite.withOpacity(0.1),
                      //                           borderRadius: BorderRadius
                      //                               .circular(15),
                      //                         ),
                      //                         child: Hero(
                      //                           tag: "Manual",
                      //                           // child: Icon(
                      //                           //   Icons.camera_alt,
                      //                           //   color: Colors.grey[800],
                      //                           // ),
                      //                           child: Image.asset(
                      //                               "assets/images/testing.png"),
                      //                         ),
                      //                       ),
                      //                     ),
                      //                     const SizedBox(height: 10),
                      //
                      //                     Row(
                      //                       mainAxisAlignment: MainAxisAlignment
                      //                           .center,
                      //                       children: [
                      //                         Text(
                      //                           "Manual",
                      //                           style: TextStyle(
                      //                             fontSize: getProportionateScreenWidth(
                      //                                 18),
                      //                             fontWeight: FontWeight.w600,
                      //                             color: kPrimaryColor2,
                      //                           ),
                      //                         ),
                      //                         // InkWell(
                      //                         //   borderRadius: BorderRadius.circular(50),
                      //                         //   onTap: () {},
                      //                         //   child: Container(
                      //                         //     padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                      //                         //     height: getProportionateScreenWidth(28),
                      //                         //     width: getProportionateScreenWidth(28),
                      //                         //     decoration: BoxDecoration(
                      //                         //       color: product.isFavourite
                      //                         //           ? kPrimaryColor.withOpacity(0.15)
                      //                         //           : kSecondaryColor.withOpacity(0.1),
                      //                         //       shape: BoxShape.circle,
                      //                         //     ),
                      //                         //     child: SvgPicture.asset(
                      //                         //       "assets/icons/Heart Icon_2.svg",
                      //                         //       color: product.isFavourite
                      //                         //           ? Color(0xFFFF4848)
                      //                         //           : Color(0xFFDBDEE4),
                      //                         //     ),
                      //                         //   ),
                      //                         // ),
                      //                       ],
                      //                     )
                      //                   ],
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //
                      //     ],
                      //
                      //   ),
                      // ),


                      Padding(
                        padding: const EdgeInsets.only(top: 24.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[



                            SizedBox(
                              width: getProportionateScreenWidth(300),
                              height: getProportionateScreenHeight(82),
                              child: GestureDetector(
                                onTap: () {
                                  showLoaderDialog(context);
                                  new Future.delayed(new Duration(seconds: 1), () async {
                                    Navigator.pop(context); //pop dialog

                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => jobScreen()
                                    ));
                                  });
=======
    if(permission == "poolman") {
      return new Scaffold(

        appBar: buildAppBar(context),
        body: Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // new StakedIcons(),
                    // new Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: <Widget>[
                    //     Padding(
                    //       padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
                    //       child: new Text(
                    //         "J.D.Pools Service",
                    //         style: new TextStyle(fontSize: 30.0,color: kPrimaryColor2),
                    //       ),
                    //     )
                    //   ],
                    // ),
                    // Center(
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       // _imgFromGallery();
                    //       _showPicker(context);
                    //     },
                    //     child: new Container(
                    //       child: SizedBox(
                    //         height: 200,
                    //         width: 200,
                    //         child: CircleAvatar(
                    //           backgroundColor:  Colors.grey[800],
                    //
                    //
                    //           child: _image != null
                    //               ? ClipRRect(
                    //             borderRadius: BorderRadius.circular(100),
                    //             child: Image.file(
                    //               _image,
                    //               width: MediaQuery.of(context).size.width,
                    //               height: MediaQuery.of(context).size.height,
                    //               fit: BoxFit.fitHeight,
                    //
                    //             ),
                    //           )
                    //               : Container(
                    //             decoration: BoxDecoration(
                    //                 color: Colors.grey[200],
                    //                 borderRadius: BorderRadius.circular(100)),
                    //             width: MediaQuery.of(context).size.width,
                    //             height: MediaQuery.of(context).size.height,
                    //             child: Icon(
                    //               Icons.camera_alt,
                    //               color: Colors.grey[800],
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //
                    //   ),
                    //
                    // ),
                    // new Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: <Widget>[
                    //     Expanded(
                    //       child: Padding(
                    //         padding: const EdgeInsets.only(
                    //             left: 20.0, right: 20.0, top: 60.0),
                    //
                    //         child: GestureDetector(
                    //           onTap: () {
                    //             Navigator.push(context, MaterialPageRoute(
                    //               builder: (context) => DisplayPictureScreen(
                    //
                    //                 file: _image,
                    //               ),
                    //             ));
                    //           },
                    //           child: new Container(
                    //               alignment: Alignment.center,
                    //               height: 60.0,
                    //               decoration: new BoxDecoration(
                    //                   color: Color(0xFFf17b26),
                    //                   borderRadius: new BorderRadius.circular(9.0)),
                    //               child: new Text("Start",
                    //                   style: new TextStyle(
                    //                       fontSize: 20.0, color: Colors.white))),
                    //         ),
                    //       ),
                    //     ),
                    //
                    //   ],
                    // ),
                    // // new Row(
                    // //   mainAxisAlignment: MainAxisAlignment.center,
                    // //   children: <Widget>[
                    // //     Expanded(
                    // //       child: Padding(
                    // //         padding: const EdgeInsets.only(
                    // //             left: 20.0, right: 5.0, top: 10.0),
                    // //         child: GestureDetector(
                    // //           onTap: () {
                    // //             Navigator.push(context, MaterialPageRoute(
                    // //               builder: (context) => imagePicker()
                    // //             ));
                    // //           },
                    // //           child: new Container(
                    // //               alignment: Alignment.center,
                    // //               height: 60.0,
                    // //               decoration: new BoxDecoration(
                    // //                   color: Color(0xFFf17b26),
                    // //                   borderRadius: new BorderRadius.circular(9.0)),
                    // //               child: new Text("Picker image",
                    // //                   style: new TextStyle(
                    // //                       fontSize: 20.0, color: Colors.white))),
                    // //         ),
                    // //       ),
                    // //     ),
                    // //
                    // //   ],
                    // // ),
                    // new Row(
                    //
                    //   children: <Widget>[
                    //     Expanded(
                    //       child: Padding(
                    //         padding: const EdgeInsets.only(
                    //             left: 20.0, right: 20.0, top: 10.0),
                    //         child: GestureDetector(
                    //           onTap: () {
                    //             Navigator.push(context, MaterialPageRoute(
                    //                 builder: (context) => inputScreen()
                    //             ));
                    //           },
                    //           child: new Container(
                    //               alignment: Alignment.center,
                    //               height: 60.0,
                    //               decoration: new BoxDecoration(
                    //                   color: Color(0xFFf17b26),
                    //                   borderRadius: new BorderRadius.circular(9.0)),
                    //               child: new Text("Test kit",
                    //                   style: new TextStyle(
                    //                       fontSize: 20.0, color: Colors.white))),
                    //         ),
                    //       ),
                    //     ),
                    //
                    //
                    //   ],
                    //
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          SizedBox(
                            width: getProportionateScreenWidth(140),
                            child: GestureDetector(
                              onTap: () {
                                // Navigator.push(context, MaterialPageRoute(
                                //   builder: (context) => DisplayPictureScreen(
                                //
                                //     file: _image,
                                //   ),
                                // ));
                                _showPicker(context);
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

                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      AspectRatio(
                                        aspectRatio: 1.02,
                                        child: Container(
                                          padding: EdgeInsets.all(
                                              getProportionateScreenWidth(20)),
                                          decoration: BoxDecoration(
                                            color: kwhite.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(
                                                15),
                                          ),
                                          child: Hero(
                                            tag: "Spinner",
                                            child:
                                            Image.asset(
                                                "assets/images/lab.png"),
                                            // color: Colors.grey[800],

                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: [
                                          Text(
                                            "Spinner",
                                            style: TextStyle(
                                              fontSize: getProportionateScreenWidth(
                                                  18),
                                              fontWeight: FontWeight.w600,
                                              color: kPrimaryColor2,
                                            ),
                                          ),
                                          // InkWell(
                                          //   borderRadius: BorderRadius.circular(50),
                                          //   onTap: () {},
                                          //   child: Container(
                                          //     padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                                          //     height: getProportionateScreenWidth(28),
                                          //     width: getProportionateScreenWidth(28),
                                          //     decoration: BoxDecoration(
                                          //       color: product.isFavourite
                                          //           ? kPrimaryColor.withOpacity(0.15)
                                          //           : kSecondaryColor.withOpacity(0.1),
                                          //       shape: BoxShape.circle,
                                          //     ),
                                          //     child: SvgPicture.asset(
                                          //       "assets/icons/Heart Icon_2.svg",
                                          //       color: product.isFavourite
                                          //           ? Color(0xFFFF4848)
                                          //           : Color(0xFFDBDEE4),
                                          //     ),
                                          //   ),
                                          // ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(
                                left: getProportionateScreenWidth(20)),
                            child: SizedBox(
                              width: getProportionateScreenWidth(140),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => inputScreen()
                                  ));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: kwhite,
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color: Color(0xFF979797).withOpacity(
                                              1),
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

                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        AspectRatio(
                                          aspectRatio: 1.02,
                                          child: Container(
                                            padding: EdgeInsets.all(
                                                getProportionateScreenWidth(
                                                    20)),
                                            decoration: BoxDecoration(
                                              color: kwhite.withOpacity(0.1),
                                              borderRadius: BorderRadius
                                                  .circular(15),
                                            ),
                                            child: Hero(
                                              tag: "Manual",
                                              // child: Icon(
                                              //   Icons.camera_alt,
                                              //   color: Colors.grey[800],
                                              // ),
                                              child: Image.asset(
                                                  "assets/images/testing.png"),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Text(
                                              "Manual",
                                              style: TextStyle(
                                                fontSize: getProportionateScreenWidth(
                                                    18),
                                                fontWeight: FontWeight.w600,
                                                color: kPrimaryColor2,
                                              ),
                                            ),
                                            // InkWell(
                                            //   borderRadius: BorderRadius.circular(50),
                                            //   onTap: () {},
                                            //   child: Container(
                                            //     padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                                            //     height: getProportionateScreenWidth(28),
                                            //     width: getProportionateScreenWidth(28),
                                            //     decoration: BoxDecoration(
                                            //       color: product.isFavourite
                                            //           ? kPrimaryColor.withOpacity(0.15)
                                            //           : kSecondaryColor.withOpacity(0.1),
                                            //       shape: BoxShape.circle,
                                            //     ),
                                            //     child: SvgPicture.asset(
                                            //       "assets/icons/Heart Icon_2.svg",
                                            //       color: product.isFavourite
                                            //           ? Color(0xFFFF4848)
                                            //           : Color(0xFFDBDEE4),
                                            //     ),
                                            //   ),
                                            // ),
                                          ],
                                        )
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


                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[


                          Padding(
                            padding: EdgeInsets.only(
                                left: getProportionateScreenWidth(20)),
                            child: SizedBox(
                              width: getProportionateScreenWidth(140),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => jobScreen()
                                  ));
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: kwhite,
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
<<<<<<< HEAD
                                          color: Color(0xFF979797).withOpacity(1),
=======
                                          color: Color(0xFF979797).withOpacity(
                                              1),
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
                                          offset: const Offset(0, -2),
                                          blurRadius: 8.0),
                                    ],
                                    borderRadius: BorderRadius.only(
<<<<<<< HEAD
                                      bottomLeft: Radius.circular(50),
                                      bottomRight: Radius.circular(50),
                                      topLeft: Radius.circular(50),
                                      topRight: Radius.circular(50),
=======
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20),
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
                                    ),
                                  ),

                                  child: Padding(
<<<<<<< HEAD
                                    padding: const EdgeInsets.only(left: 2.4,right: 4.5),
                                    child: Row(
=======
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        AspectRatio(
                                          aspectRatio: 1.02,
                                          child: Container(
<<<<<<< HEAD

                                            decoration: BoxDecoration(

                                              borderRadius: BorderRadius.circular(
                                                  50),
                                            ),
                                            child: Hero(
                                              tag: "Joblist",
                                              child:
                                              Image.asset(
                                                "assets/images/joblist.png",

                                              ),
                                              // color: Colors.grey[800],

                                            ),
                                          ),
                                        ),

                                        Padding(
                                          padding: const EdgeInsets.only(top: 10.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Joblist",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: getProportionateScreenWidth(
                                                      18),
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                ),
                                              ),
                                          Visibility(
                                            visible: false,
                                            maintainState: true,
                                            maintainAnimation: true,
                                            maintainSize: true,
                                            child: Text(
                                                "description detail",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontSize: getProportionateScreenWidth(
                                                      14),
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black,
                                                ),
                                              ),
                                          ),
                                              // InkWell(
                                              //   borderRadius: BorderRadius.circular(50),
                                              //   onTap: () {},
                                              //   child: Container(
                                              //     padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                                              //     height: getProportionateScreenWidth(28),
                                              //     width: getProportionateScreenWidth(28),
                                              //     decoration: BoxDecoration(
                                              //       color: product.isFavourite
                                              //           ? kPrimaryColor.withOpacity(0.15)
                                              //           : kSecondaryColor.withOpacity(0.1),
                                              //       shape: BoxShape.circle,
                                              //     ),
                                              //     child: SvgPicture.asset(
                                              //       "assets/icons/Heart Icon_2.svg",
                                              //       color: product.isFavourite
                                              //           ? Color(0xFFFF4848)
                                              //           : Color(0xFFDBDEE4),
                                              //     ),
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 25,left: 40),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .end,
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
                                                    showLoaderDialog(context);
                                                    new Future.delayed(new Duration(seconds: 1), () async {
                                                      Navigator.pop(context); //pop dialog

                                                      Navigator.push(context, MaterialPageRoute(
                                                          builder: (context) => jobScreen()
                                                      ));
                                                    });
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

=======
                                            padding: EdgeInsets.all(
                                                getProportionateScreenWidth(
                                                    20)),
                                            decoration: BoxDecoration(
                                              color: kwhite.withOpacity(0.1),
                                              borderRadius: BorderRadius
                                                  .circular(15),
                                            ),
                                            child: Hero(
                                              tag: "Job list",
                                              // child: Icon(
                                              //   Icons.camera_alt,
                                              //   color: Colors.grey[800],
                                              // ),
                                              child: Image.asset(
                                                  "assets/images/testing.png"),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Text(
                                              "Job list",
                                              style: TextStyle(
                                                fontSize: getProportionateScreenWidth(
                                                    18),
                                                fontWeight: FontWeight.w600,
                                                color: kPrimaryColor2,
                                              ),
                                            ),
                                            // InkWell(
                                            //   borderRadius: BorderRadius.circular(50),
                                            //   onTap: () {},
                                            //   child: Container(
                                            //     padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                                            //     height: getProportionateScreenWidth(28),
                                            //     width: getProportionateScreenWidth(28),
                                            //     decoration: BoxDecoration(
                                            //       color: product.isFavourite
                                            //           ? kPrimaryColor.withOpacity(0.15)
                                            //           : kSecondaryColor.withOpacity(0.1),
                                            //       shape: BoxShape.circle,
                                            //     ),
                                            //     child: SvgPicture.asset(
                                            //       "assets/icons/Heart Icon_2.svg",
                                            //       color: product.isFavourite
                                            //           ? Color(0xFFFF4848)
                                            //           : Color(0xFFDBDEE4),
                                            //     ),
                                            //   ),
                                            // ),
                                          ],
                                        )
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


                  ],
                ),
              ),

              bottomBar(),
            ],
          ),
        ),

        // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.homeFirst),
      );
    }else{
      return new Scaffold(

        appBar: buildAppBar(context),
        body: Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: Stack(
            children: <Widget>[
              Container(
                width: double.infinity,
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    // new StakedIcons(),
                    // new Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: <Widget>[
                    //     Padding(
                    //       padding: const EdgeInsets.only(top: 30.0, bottom: 30.0),
                    //       child: new Text(
                    //         "J.D.Pools Service",
                    //         style: new TextStyle(fontSize: 30.0,color: kPrimaryColor2),
                    //       ),
                    //     )
                    //   ],
                    // ),
                    // Center(
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       // _imgFromGallery();
                    //       _showPicker(context);
                    //     },
                    //     child: new Container(
                    //       child: SizedBox(
                    //         height: 200,
                    //         width: 200,
                    //         child: CircleAvatar(
                    //           backgroundColor:  Colors.grey[800],
                    //
                    //
                    //           child: _image != null
                    //               ? ClipRRect(
                    //             borderRadius: BorderRadius.circular(100),
                    //             child: Image.file(
                    //               _image,
                    //               width: MediaQuery.of(context).size.width,
                    //               height: MediaQuery.of(context).size.height,
                    //               fit: BoxFit.fitHeight,
                    //
                    //             ),
                    //           )
                    //               : Container(
                    //             decoration: BoxDecoration(
                    //                 color: Colors.grey[200],
                    //                 borderRadius: BorderRadius.circular(100)),
                    //             width: MediaQuery.of(context).size.width,
                    //             height: MediaQuery.of(context).size.height,
                    //             child: Icon(
                    //               Icons.camera_alt,
                    //               color: Colors.grey[800],
                    //             ),
                    //           ),
                    //         ),
                    //       ),
                    //     ),
                    //
                    //   ),
                    //
                    // ),
                    // new Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: <Widget>[
                    //     Expanded(
                    //       child: Padding(
                    //         padding: const EdgeInsets.only(
                    //             left: 20.0, right: 20.0, top: 60.0),
                    //
                    //         child: GestureDetector(
                    //           onTap: () {
                    //             Navigator.push(context, MaterialPageRoute(
                    //               builder: (context) => DisplayPictureScreen(
                    //
                    //                 file: _image,
                    //               ),
                    //             ));
                    //           },
                    //           child: new Container(
                    //               alignment: Alignment.center,
                    //               height: 60.0,
                    //               decoration: new BoxDecoration(
                    //                   color: Color(0xFFf17b26),
                    //                   borderRadius: new BorderRadius.circular(9.0)),
                    //               child: new Text("Start",
                    //                   style: new TextStyle(
                    //                       fontSize: 20.0, color: Colors.white))),
                    //         ),
                    //       ),
                    //     ),
                    //
                    //   ],
                    // ),
                    // // new Row(
                    // //   mainAxisAlignment: MainAxisAlignment.center,
                    // //   children: <Widget>[
                    // //     Expanded(
                    // //       child: Padding(
                    // //         padding: const EdgeInsets.only(
                    // //             left: 20.0, right: 5.0, top: 10.0),
                    // //         child: GestureDetector(
                    // //           onTap: () {
                    // //             Navigator.push(context, MaterialPageRoute(
                    // //               builder: (context) => imagePicker()
                    // //             ));
                    // //           },
                    // //           child: new Container(
                    // //               alignment: Alignment.center,
                    // //               height: 60.0,
                    // //               decoration: new BoxDecoration(
                    // //                   color: Color(0xFFf17b26),
                    // //                   borderRadius: new BorderRadius.circular(9.0)),
                    // //               child: new Text("Picker image",
                    // //                   style: new TextStyle(
                    // //                       fontSize: 20.0, color: Colors.white))),
                    // //         ),
                    // //       ),
                    // //     ),
                    // //
                    // //   ],
                    // // ),
                    // new Row(
                    //
                    //   children: <Widget>[
                    //     Expanded(
                    //       child: Padding(
                    //         padding: const EdgeInsets.only(
                    //             left: 20.0, right: 20.0, top: 10.0),
                    //         child: GestureDetector(
                    //           onTap: () {
                    //             Navigator.push(context, MaterialPageRoute(
                    //                 builder: (context) => inputScreen()
                    //             ));
                    //           },
                    //           child: new Container(
                    //               alignment: Alignment.center,
                    //               height: 60.0,
                    //               decoration: new BoxDecoration(
                    //                   color: Color(0xFFf17b26),
                    //                   borderRadius: new BorderRadius.circular(9.0)),
                    //               child: new Text("Test kit",
                    //                   style: new TextStyle(
                    //                       fontSize: 20.0, color: Colors.white))),
                    //         ),
                    //       ),
                    //     ),
                    //
                    //
                    //   ],
                    //
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          SizedBox(
                            width: getProportionateScreenWidth(140),
                            child: GestureDetector(
                              onTap: () {
                                // Navigator.push(context, MaterialPageRoute(
                                //   builder: (context) => DisplayPictureScreen(
                                //
                                //     file: _image,
                                //   ),
                                // ));
                                _showPicker(context);
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

                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      AspectRatio(
                                        aspectRatio: 1.02,
                                        child: Container(
                                          padding: EdgeInsets.all(
                                              getProportionateScreenWidth(20)),
                                          decoration: BoxDecoration(
                                            color: kwhite.withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(
                                                15),
                                          ),
                                          child: Hero(
                                            tag: "Spinner",
                                            child:
                                            Image.asset(
                                                "assets/images/lab.png"),
                                            // color: Colors.grey[800],

                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .center,
                                        children: [
                                          Text(
                                            "Spinner",
                                            style: TextStyle(
                                              fontSize: getProportionateScreenWidth(
                                                  18),
                                              fontWeight: FontWeight.w600,
                                              color: kPrimaryColor2,
                                            ),
                                          ),
                                          // InkWell(
                                          //   borderRadius: BorderRadius.circular(50),
                                          //   onTap: () {},
                                          //   child: Container(
                                          //     padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                                          //     height: getProportionateScreenWidth(28),
                                          //     width: getProportionateScreenWidth(28),
                                          //     decoration: BoxDecoration(
                                          //       color: product.isFavourite
                                          //           ? kPrimaryColor.withOpacity(0.15)
                                          //           : kSecondaryColor.withOpacity(0.1),
                                          //       shape: BoxShape.circle,
                                          //     ),
                                          //     child: SvgPicture.asset(
                                          //       "assets/icons/Heart Icon_2.svg",
                                          //       color: product.isFavourite
                                          //           ? Color(0xFFFF4848)
                                          //           : Color(0xFFDBDEE4),
                                          //     ),
                                          //   ),
                                          // ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: EdgeInsets.only(
                                left: getProportionateScreenWidth(20)),
                            child: SizedBox(
                              width: getProportionateScreenWidth(140),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => inputScreen()
                                  ));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: kwhite,
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color: Color(0xFF979797).withOpacity(
                                              1),
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

                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        AspectRatio(
                                          aspectRatio: 1.02,
                                          child: Container(
                                            padding: EdgeInsets.all(
                                                getProportionateScreenWidth(
                                                    20)),
                                            decoration: BoxDecoration(
                                              color: kwhite.withOpacity(0.1),
                                              borderRadius: BorderRadius
                                                  .circular(15),
                                            ),
                                            child: Hero(
                                              tag: "Manual",
                                              // child: Icon(
                                              //   Icons.camera_alt,
                                              //   color: Colors.grey[800],
                                              // ),
                                              child: Image.asset(
                                                  "assets/images/testing.png"),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10),

                                        Row(
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Text(
                                              "Manual",
                                              style: TextStyle(
                                                fontSize: getProportionateScreenWidth(
                                                    18),
                                                fontWeight: FontWeight.w600,
                                                color: kPrimaryColor2,
                                              ),
                                            ),
                                            // InkWell(
                                            //   borderRadius: BorderRadius.circular(50),
                                            //   onTap: () {},
                                            //   child: Container(
                                            //     padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                                            //     height: getProportionateScreenWidth(28),
                                            //     width: getProportionateScreenWidth(28),
                                            //     decoration: BoxDecoration(
                                            //       color: product.isFavourite
                                            //           ? kPrimaryColor.withOpacity(0.15)
                                            //           : kSecondaryColor.withOpacity(0.1),
                                            //       shape: BoxShape.circle,
                                            //     ),
                                            //     child: SvgPicture.asset(
                                            //       "assets/icons/Heart Icon_2.svg",
                                            //       color: product.isFavourite
                                            //           ? Color(0xFFFF4848)
                                            //           : Color(0xFFDBDEE4),
                                            //     ),
                                            //   ),
                                            // ),
                                          ],
                                        )
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
<<<<<<< HEAD




                          ],

                        ),
                      ),

                      // Padding(
                      //   padding: const EdgeInsets.only(top: 20.0),
                      //   child: new Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: <Widget>[
                      //
                      //
                      //       Padding(
                      //         padding: EdgeInsets.only(
                      //             left: getProportionateScreenWidth(20)),
                      //         child: SizedBox(
                      //           width: getProportionateScreenWidth(140),
                      //           child: GestureDetector(
                      //             onTap: () {
                      //               showLoaderDialog(context);
                      //               new Future.delayed(new Duration(seconds: 1), () async {
                      //                 Navigator.pop(context); //pop dialog
                      //
                      //                 Navigator.push(context, MaterialPageRoute(
                      //                     builder: (context) => jobScreen()
                      //                 ));
                      //               });
                      //
                      //             },
                      //             child: Container(
                      //               decoration: BoxDecoration(
                      //                 color: kwhite,
                      //                 boxShadow: <BoxShadow>[
                      //                   BoxShadow(
                      //                       color: Color(0xFF979797).withOpacity(
                      //                           1),
                      //                       offset: const Offset(0, -2),
                      //                       blurRadius: 8.0),
                      //                 ],
                      //                 borderRadius: BorderRadius.only(
                      //                   bottomLeft: Radius.circular(20),
                      //                   bottomRight: Radius.circular(20),
                      //                   topLeft: Radius.circular(20),
                      //                   topRight: Radius.circular(20),
                      //                 ),
                      //               ),
                      //
                      //               child: Padding(
                      //                 padding: const EdgeInsets.all(20.0),
                      //                 child: Column(
                      //                   crossAxisAlignment: CrossAxisAlignment
                      //                       .start,
                      //                   children: [
                      //                     AspectRatio(
                      //                       aspectRatio: 1.02,
                      //                       child: Container(
                      //                         padding: EdgeInsets.all(
                      //                             getProportionateScreenWidth(
                      //                                 20)),
                      //                         decoration: BoxDecoration(
                      //                           color: kwhite.withOpacity(0.1),
                      //                           borderRadius: BorderRadius
                      //                               .circular(15),
                      //                         ),
                      //                         child: Hero(
                      //                           tag: "Job list",
                      //                           // child: Icon(
                      //                           //   Icons.camera_alt,
                      //                           //   color: Colors.grey[800],
                      //                           // ),
                      //                           child: Image.asset(
                      //                               "assets/images/testing.png"),
                      //                         ),
                      //                       ),
                      //                     ),
                      //                     const SizedBox(height: 10),
                      //
                      //                     Row(
                      //                       mainAxisAlignment: MainAxisAlignment
                      //                           .center,
                      //                       children: [
                      //                         Text(
                      //                           "Job list",
                      //                           style: TextStyle(
                      //                             fontSize: getProportionateScreenWidth(
                      //                                 18),
                      //                             fontWeight: FontWeight.w600,
                      //                             color: kPrimaryColor2,
                      //                           ),
                      //                         ),
                      //                         // InkWell(
                      //                         //   borderRadius: BorderRadius.circular(50),
                      //                         //   onTap: () {},
                      //                         //   child: Container(
                      //                         //     padding: EdgeInsets.all(getProportionateScreenWidth(8)),
                      //                         //     height: getProportionateScreenWidth(28),
                      //                         //     width: getProportionateScreenWidth(28),
                      //                         //     decoration: BoxDecoration(
                      //                         //       color: product.isFavourite
                      //                         //           ? kPrimaryColor.withOpacity(0.15)
                      //                         //           : kSecondaryColor.withOpacity(0.1),
                      //                         //       shape: BoxShape.circle,
                      //                         //     ),
                      //                         //     child: SvgPicture.asset(
                      //                         //       "assets/icons/Heart Icon_2.svg",
                      //                         //       color: product.isFavourite
                      //                         //           ? Color(0xFFFF4848)
                      //                         //           : Color(0xFFDBDEE4),
                      //                         //     ),
                      //                         //   ),
                      //                         // ),
                      //                       ],
                      //                     )
                      //                   ],
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //
                      //     ],
                      //
                      //   ),
                      // ),


                    ],
                  ),
=======
                          ),


                        ],

                      ),
                    ),


                  ],
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
                ),
              ),

              bottomBar(),
            ],
          ),
<<<<<<< HEAD


        // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.homeFirst),
      );


=======
        ),

        // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.homeFirst),
      );
    }
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc

  }

   Widget bottomBar() {
     return Column(
       children: <Widget>[
         const Expanded(
           child: SizedBox(),
         ),
         BottomBarView(selectedMenu: MenuState.homeFirst),
       ],
     );
   }
}
AppBar buildAppBar(BuildContext context) {
  return AppBar(
    backgroundColor: kPrimaryColor2,
    centerTitle: true,
    title: Column(
      children: [
        Text(
            "Pool Pro&Lab",style: TextStyle(color: kPrimaryColor)

        ),
        // Text(
        //   "${demoCarts.length} items",
        //   style: Theme.of(context).textTheme.caption,
        // ),
      ],
    ),
  );
}
Future _getThingsOnStartup() async {
  await Future.delayed(Duration(seconds: 1));
}