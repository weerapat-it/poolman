import 'dart:io';
import 'package:JDPoolsApplication/size_config.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'package:path_provider/path_provider.dart';
import 'dart:convert';
class Slideshow extends StatefulWidget {

  @override
  _Slideshow createState() => new _Slideshow();
}
class _Slideshow extends State<Slideshow> {
  List imageList = [];
  String _result;
  int countitems;
  @override
  // ignore: must_call_super
  void initState() {
    getListImage();
  }
  getListImage()async{
    var url = Uri.https('jdpoolswebservice.com', '/spintest/slideshowList.php', {'q': '{http}'});
    // String Url = "http://jdpoolswebservice.com/spintest/slideshowList.php";
    var res = await http.get(url,headers:{"Accept" : "application/json"},
      // body: {
      //   "serial":serial_code,
      //   "item" : _dropDownValue,
      // }
    );
    var resBody = json.decode(res.body);
    setState(() {

        imageList = resBody;

        // for(int x=0;x< imageList.length;x++){
        //   precacheImage(imageList[x].image, context);
        // }
    });


    // precacheImage(imageList[0].image, context);
    print(imageList);

  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: new Container(
          height: 200,
          width: SizeConfig.screenWidth,

          child:Swiper(
            key: UniqueKey(),
        autoplay: true,
        autoplayDelay: 5000,
        loop: true,
        itemBuilder: (BuildContext context, int index) {

          return new Image.network(

            imageList[index],
            fit: BoxFit.fill,

          );

        },
        pagination: new SwiperPagination(margin: new EdgeInsets.all(5.0)),
        itemCount: imageList.length,
        viewportFraction: 1,
        scale: 1,
      ),

      ),
    );
  }
}

