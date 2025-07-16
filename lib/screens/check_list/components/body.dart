import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/services.dart';
import 'package:JDPoolsApplication/screens/check_list/models/Cart.dart';
import 'package:geolocator/geolocator.dart';
import "package:async/async.dart";
import 'package:image_picker/image_picker.dart';
import 'package:JDPoolsApplication/components/default_button.dart';
import 'package:JDPoolsApplication/screens/check_list/models/Product.dart';
import 'package:JDPoolsApplication/screens/check_list_result/check_list_result_screen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'check_list_card.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:path_provider/path_provider.dart';
import 'package:JDPoolsApplication/helper/keyboard.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:fk_toggle/fk_toggle.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
class Body extends StatefulWidget {
  final String value;

  Body({Key key, @required this.value}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  File _image;
  String imageurlstr;
  List jobdetailList = [];
  List checkInList = [];
  List checkOutList = [];
  List multipleSelected1 = [];
  // List<Widget> itemList = [
  //   Widget("1"),
  //   "2",
  //   "3",
  // ];
  // List<String> itemList2 = [
  //   "NO",
  //   "YES",
  // ];
  // List checkListItems1 = [
  //   {
  //     "id": 0,
  //     "value": false,
  //     "title": "ปั๊ม",
  //   },
  //   {
  //     "id": 1,
  //     "value": false,
  //     "title": "ไฟใต้น้ำ",
  //   },
  //   {
  //     "id": 2,
  //     "value": false,
  //     "title": "ตู้คอนโทรล",
  //   },
  //   {
  //     "id": 3,
  //     "value": false,
  //     "title": "วาล์ว",
  //   },
  //   {
  //     "id": 4,
  //     "value": false,
  //     "title": "ลูกลอย",
  //   },
  //
  // ];
  List checkListItems1 = [
    {
      "id": 0,
      "value": false,
      "title": "ระบบ",
    },


  ];
  List multipleSelected2 = [];
  // List checkListItems2 = [
  //   {
  //     "id": 0,
  //     "value": false,
  //     "title": "ตักใบไม้",
  //   },
  //   {
  //     "id": 1,
  //     "value": false,
  //     "title": "ดูดตะกอน",
  //   },
  //   {
  //     "id": 2,
  //     "value": false,
  //     "title": "ล้างถุงกรอง",
  //   },
  //   {
  //     "id": 3,
  //     "value": false,
  //     "title": "ขัดตะไคร่",
  //   },
  //
  //
  // ];
  List checkListItems2 = [
    {
      "id": 0,
      "value": false,
      "title": "ทำความสะอาด",
    },



  ];

  String senddata;
  bool visibilityTag = true;
  bool visibilityObs = false;
  var locationMessage = "";
  var index = 0;
  final _formKey = GlobalKey<FormState>();
  static int selected1,selected2,selected3,selected4,selected5,selected6;

  String _picked = "Two";
  String check1,check2 = "";
  List<String> _checked1,_checked2 = [];
  var userId;
  List jobList = [];

  int select01,select02,select03,select04,select05;
  void urlToFile(String imageUrl) async {
    // Fetch the image bytes
    final response = await http.get(Uri.parse(imageUrl));

    if (response.statusCode == 200) {
      // Get the temporary directory
      final directory = await getTemporaryDirectory();

      // Create a new file path in the temp directory
      final filePath = '${directory.path}/imageUrl.png';

      // Save the image as a file
      final file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);
      setState(() {
        _image = file;

      });
      print(_image);

    } else {
      throw Exception('Failed to load image');
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
    selected1 = 0;
    selected2 = 0;
    selected3 = 0;
    selected4 = 0;
    selected5 = 0;
    selected6 = 0;
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
  List<bool> isSelected1 = [false, false, false];
  List<bool> isSelected2 = [false, false, false];
  List<bool> isSelected3 = [false, false, false];
  List<bool> isSelected4 = [false, false];
  List<bool> isSelected5 = [false, false];

  List<String> strlist1 = ["assets/icons/1.svg", "assets/icons/2.svg", "assets/icons/3.svg"];
  List<String> strlist2 = ["assets/icons/1.svg", "assets/icons/2.svg", "assets/icons/3.svg"];
  List<String> strlist3 = ["assets/icons/1.svg", "assets/icons/2.svg", "assets/icons/3.svg"];
  List<String> strlist4 = ["assets/icons/truetoogle.svg", "assets/icons/truetoogle.svg"];
  List<String> strlist4s = ["ปกติ", "ผิดปกติ"];
  List<String> strlist5 = ["assets/icons/truetoogle.svg", "assets/icons/truetoogle.svg"];
  List<String> strlist5s = ["เรียบร้อย", "ไม่เรียบร้อย"];
  final OnSelected select1 = (index,instance) {

    print("Select" +index.toString());
    selected1 = index;
  };
  final OnSelected select2 = (index,instance) {
    print("Select"+index.toString());
    selected2 = index;
  };
  final OnSelected select3 = (index,instance) {
    print("Select"+index.toString());
    selected3 = index;
  };
  final OnSelected select4 = (index,instance) {
    print("Select"+index.toString());
    selected4 = index;
  };
  final OnSelected select5 = (index,instance) {
    print("Select"+index.toString());
    selected5 = index;
  };
  final OnSelected select6 = (index,instance) {
    print("Select"+index.toString());
    selected6 = index;
  };

  var arr,arr1,arr2,arr3,arr4,arr5,arr6,arr7,arr8,arr9,arr10,arr11,arrdes  = "";

  //
  // String _dropDownValue;
  TextEditingController dataControl = TextEditingController();
  TextEditingController dataControl1 = TextEditingController();
  TextEditingController dataControl2 = TextEditingController();
  TextEditingController dataControldes = TextEditingController();
  // TextEditingController dataControl3 = TextEditingController();
  // TextEditingController dataControl4 = TextEditingController();
  // TextEditingController dataControl5 = TextEditingController();
  // TextEditingController dataControl6 = TextEditingController();
  // TextEditingController dataControl7 = TextEditingController();
  // TextEditingController dataControl8 = TextEditingController();
  // TextEditingController dataControl9 = TextEditingController();
  // TextEditingController dataControl10 = TextEditingController();
  String get data1 => dataControl.text;
  String get data2 => dataControl1.text;
  String get data3 => dataControl2.text;
  String get datades => dataControldes.text;
  // String get data4 => dataControl3.text;
  // String get data5 => dataControl4.text;
  // String get data6 => dataControl5.text;
  // String get data7 => dataControl6.text;
  // String get data8 => dataControl7.text;
  // String get data9 => dataControl8.text;
  // String get data10 => dataControl9.text;
  // String get data11 => dataControl10.text;
  // var locationMessage = "";
  // List customerList = List();

  // InsertMethod()async{
  //   userId = "${await FlutterSession().get("userId")}";
  //   var url = Uri.https('jdpoolswebservice.com', '/spintest/addDataSpin.php', {'q': '{http}'});
  //   // String Url = "http://jdpoolswebservice.com/spintest/addDataSpin.php";
  //   var res = await http.post(url,headers:{"Accept" : "application/json"},
  //       body: {
  //         // "customer":_dropDownValue,
  //         "userid":userId,
  //         "data1" : data1,
  //         "data2" : data2,
  //         "data3" : data3,
  //         "data4" : data4,
  //         "data5" : data5,
  //         "data6" : data6,
  //         "data7" : data7,
  //         "data8" : data8,
  //         "data9" : data9,
  //         "data10" : data10,
  //         "data11" : data11,
  //
  //       }
  //   );
  //   var resBody = json.decode(res.body);
  //   print(resBody);
  // }
  // getListImage() async {
  //   userId = "${await FlutterSession().get("userId")}";
  //   var url = Uri.https('jdpoolswebservice.com', '/spintest/job_list.php', {'q': '{http}'});
  //   // String Url = "http://jdpoolswebservice.com/spintest/historyList.php";
  //   var res = await http.post(
  //       url, headers: {"Accept": "application/json"},
  //       body: {
  //         "id":widget.value,
  //
  //       }
  //   );
  //   var resBody = json.decode(res.body);
  //   setState(() {
  //     jobList = resBody;
  //
  //   });
  //   print(jobList);
  //   if(jobList != null) {
  //     demoProducts = <Product>[
  //       for(int x = 0; x < jobList.length; x++)
  //
  //
  //         Product(
  //           job_id: int.parse(jobList[x]["checklist_data_Id"].toString()),
  //           images: [
  //             "assets/images/doc.png",
  //           ],
  //
  //           period: jobList[x]["checklist_data_Period"].toString(),
  //           start: jobList[x]["checklist_data_Start"].toString(),
  //           end: jobList[x]["checklist_data_End"].toString(),
  //
  //         ),
  //
  //     ];
  //     demoCarts = <Cart>[
  //       for(int y = 0; y < demoProducts.length; y++)
  //         Cart(product: demoProducts[y], numOfItem: 2),
  //
  //     ];
  //   }
  // }
  getJobDetail() async {
    userId = "${await FlutterSession().get("userId")}";
    var url = Uri.https('jdpoolswebservice.com', '/spintest/job_detail.php', {'q': '{http}'});
    // String Url = "http://jdpoolswebservice.com/spintest/productSearch.php";
    var res = await http.post(
        url, headers: {"Accept": "application/json"},
        body: {
          "userid":userId,
          "id":widget.value,

        }
    );
    var resBody = json.decode(res.body);
    setState(() {
      jobdetailList = resBody;

    });
    print(jobdetailList);


    if(jobdetailList != null){
      if(jobdetailList[index]["checklist_data_Img"].toString() == ""){
        _image = null;
        print(_image);
        print(jobdetailList[index]["checklist_data_Des"].toString());
      }else{
        print(jobdetailList[index]["checklist_data_Des"].toString());
        print(jobdetailList[index]["checklist_data_Img"].toString());
        urlToFile("http://jdpoolswebservice.com/spintest/"+jobdetailList[index]["checklist_data_Img"].toString());
        imageurlstr = "http://jdpoolswebservice.com/spintest/"+jobdetailList[index]["checklist_data_Img"].toString();

        urlToFile("http://jdpoolswebservice.com/spintest/"+jobdetailList[index]["checklist_data_Img"].toString());
        print("fileimg"+imageurlstr);
        print(_image);
      }

      dataControl = TextEditingController()..text = jobdetailList[index]["checklist_data_Chlorine"].toString();
      dataControl1 = TextEditingController()..text = jobdetailList[index]["checklist_data_Ph"].toString();

      dataControldes = TextEditingController()..text = jobdetailList[index]["checklist_data_Des"].toString();
      select01 = int.parse(jobdetailList[index]["checklist_data_Check1"]);
      select02 = int.parse(jobdetailList[index]["checklist_data_Check2"]);
      select03 = int.parse(jobdetailList[index]["checklist_data_Check3"]);
      select04 = int.parse(jobdetailList[index]["checklist_data_Check4"]);
      select05 = int.parse(jobdetailList[index]["checklist_data_Check5"]);
      select1(int.parse(jobdetailList[index]["checklist_data_Check1"]),null);
      select2(int.parse(jobdetailList[index]["checklist_data_Check2"]),null);
      select3(int.parse(jobdetailList[index]["checklist_data_Check3"]),null);
      select4(int.parse(jobdetailList[index]["checklist_data_Check4"]),null);
      select5(int.parse(jobdetailList[index]["checklist_data_Check5"]),null);
      isSelected1[select01] = true;
      isSelected2[select02] = true;
      isSelected3[select03] = true;
      isSelected4[select04] = true;
      isSelected5[select05] = true;
    }else{
      dataControl = TextEditingController()..text = "0";
      dataControl1 = TextEditingController()..text = "0";
      dataControldes = TextEditingController()..text = "";

      _image = null;
    }
  }
  getCurrentLocation() async {

    var position = await Geolocator.getCurrentPosition(desiredAccuracy:LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    print(lastPosition);
    setState(() {
      // locationMessage = "{$position.latitude , $position.longitude}";

      locationMessage = lastPosition.toString();
    });
    print("getlat"+locationMessage);
  }
  CheckIn()async{
    print(jobdetailList[index]["checklist_data_Id"].toString());
    userId = "${await FlutterSession().get("userId")}";
    // getCurrentLocation();
    var position = await Geolocator.getCurrentPosition(desiredAccuracy:LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    print(lastPosition);
    setState(() {
      // locationMessage = "{$position.latitude , $position.longitude}";

      locationMessage = lastPosition.toString();
    });
    print("datalatlon"+locationMessage);
    var url = Uri.https('jdpoolswebservice.com', '/spintest/checkin.php', {'q': '{http}'});
    // String Url = "http://jdpoolswebservice.com/spintest/productSearch.php";
    var res = await http.post(
        url, headers: {"Accept": "application/json"},
        body: {
          "userid":userId,
          "id":jobdetailList[index]["checklist_data_Id"].toString(),
          "checklist_data_Latlon":locationMessage.toString(),

        }
    );
    var resBody = json.decode(res.body);
    setState(() {
      checkInList = resBody;
      jobdetailList[index]["checklist_data_Start"] = checkInList[index]["checklist_data_Start"];
    });
    print(checkInList);

  }




  InsertMethod()async{
    userId = "${await FlutterSession().get("userId")}";
    print("aaaa"+selected1.toString());
    // getCurrentLocation();

    var position = await Geolocator.getCurrentPosition(desiredAccuracy:LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    print(lastPosition);
    setState(() {
      // locationMessage = "{$position.latitude , $position.longitude}";

      locationMessage = lastPosition.toString();
    });
    // if(_dropDownValue == null){
    //   _dropDownValue.text = spcace;
    // }else{
    //   _dropDownValue = _dropDownValue;
    // }
    // if(_dropDownValue2 == null){
    //   _dropDownValue2.text = spcace;
    // }else{
    //   _dropDownValue2 = _dropDownValue2;
    // }
    userId = "${await FlutterSession().get("userId")}";

    // List<int> imageBytes = _image.readAsBytesSync();
    var url = Uri.https('jdpoolswebservice.com', '/spintest/checkoutpoolcare.php', {'q': '{http}'});
    // String Url = "http://jdpoolswebservice.com/spintest/check_update_pool.php";
    var request = new http.MultipartRequest("POST", url);
    if(_image == null){
      // request.files.add(" ");
      print("errorimage");
    }else {
      var stream = new http.ByteStream(_image.openRead());
      var length = await _image.length();
      var multipartFile = http.MultipartFile('image', stream, length, filename: _image.path.split('/').last);

      request.files.add(multipartFile);
    }

    // for(int x = 0; x < multipleSelected1.length; x++) {
    //   if(x == 0) {

        // check1 =  multipleSelected1[index]["id"].toString();
    //   }else {
    //
    //     check1 = check1 + ","+multipleSelected1[x]["id"].toString();
    //   }
    // }
    // for(int x = 0; x < multipleSelected2.length; x++) {
    //   if(x == 0) {

        // check2 =  multipleSelected2[index]["id"].toString();
    //   }else {
    //
    //     check2 = check2 + ","+multipleSelected2[x]["id"].toString();
    //   }
    // }
    //   print("check1 : "+check1);
    // print("check2 : "+check2);
    request.fields['id'] = jobdetailList[index]["checklist_data_Id"].toString();
    request.fields['checklist_data_Ph'] = data2;
    request.fields['checklist_data_Chlorine'] = data1;
    request.fields['checklist_data_Salt'] = data3;
    request.fields['checklist_data_Check1'] = select01.toString();
    request.fields['checklist_data_Check2'] = select02.toString();
    request.fields['checklist_data_Check3'] = select03.toString();
    request.fields['checklist_data_Check4'] = select04.toString();
    request.fields['checklist_data_Check5'] = select05.toString();
    request.fields['checklist_data_Des'] = datades;
    request.fields['checklist_data_Latlon'] = locationMessage.toString();


    var respond = await request.send();
    print(respond.statusCode);
    if(respond.statusCode==200){
      // senddata = "Image Uploaded";
      respond.stream.transform(utf8.decoder).listen((value) {
        var resBody = json.decode(value);
        senddata = resBody;
        print("responsecheck"+senddata);

        new Future.delayed(new Duration(seconds: 1), () async {
          Navigator.pop(this.context); //pop dialog



        Navigator.of(this.context).pushNamed( checkListResultScreen.routeName,arguments: checklistresultArguments(value:jobdetailList[index]["checklist_data_Id"].toString()));
        });
      });

    }else{
      senddata = "Upload Failed";
      print(senddata);

    }

  }

  final picker = ImagePicker();
  _imgFromCamera() async {
    File image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50
    );

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    File image = await  ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      _image = image;
    });
  }
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  // new ListTile(
                  //     leading: new Icon(Icons.photo_library),
                  //     title: new Text('Photo Library'),
                  //     onTap: () {
                  //       _imgFromGallery();
                  //       Navigator.of(context).pop();
                  //     }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),

                ],
              ),
            ),
          );
        }
    );
  }
   List<Widget> toogletab = <Widget>[
    Text('Before'),
    Text('After')
  ];

  final List<bool> _selectedtoogletab = <bool>[true, false];
  bool vertical = false;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    if(jobdetailList != null) {
      return Scaffold(
        // appBar: AppBar(),
        body: Container(
            width: double.infinity,
            child: new SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  //Your Widgets
                  // new Container(
                  //     padding: EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                  //     child: Scrollbar(
                  //         child: SingleChildScrollView(
                  //           child: DropdownButton(
                  //             hint: _dropDownValue == null
                  //                 ? Text('Select')
                  //                 : Text(
                  //               _dropDownValue,
                  //               style: TextStyle(color: Colors.blue),
                  //             ),
                  //             isExpanded: true,
                  //             iconSize: 30.0,
                  //             style: TextStyle(color: Colors.blue),
                  //             items: customerList.map(
                  //                   (customer) {
                  //                 return DropdownMenuItem(
                  //                   value: customer['Customer_Firstname']+" "+customer['Customer_Lastname'],
                  //                   child: Text(customer['Customer_Firstname']+" "+customer['Customer_Lastname']),
                  //                 );
                  //               },
                  //             ).toList(),
                  //             onChanged: (value) {
                  //               setState(
                  //                     () {
                  //                   _dropDownValue = value;
                  //                 },
                  //               );
                  //             },
                  //           ),
                  //         )
                  //     )
                  // ),
                  // ),
              Container(
              padding: EdgeInsets.symmetric(
                  vertical: getProportionateScreenWidth(15),
              horizontal: getProportionateScreenWidth(30),
            ),
            // height: 174,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, -15),
                  blurRadius: 20,
                  color: Color(0xFFDADADA).withOpacity(0.15),
                )
              ],
            ),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                      children: [
                        SizedBox(
                          width: 44,
                          child: SvgPicture.asset(
                            "assets/icons/iconaddressjob.svg",

                          ),
                        ),

                        SizedBox(width: 8),
                        Column(
                          children: [
                            SizedBox(
                              width: 250,
                              child:Text.rich(
                              TextSpan(
                                text: (jobdetailList?.length > 0 ? jobdetailList[index]["user_Address1"] : ''),
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, color: kTextColor,fontSize: 14.0),
                                // children: [
                                //   TextSpan(
                                //       text: " x${cart.numOfItem}",
                                //       style: Theme.of(context).textTheme.bodyText1),
                                // ],
                              ),

                            ),
                            ),

                          ],
                        ),
                      ],
                    ),

                  // Row(
                  //   children: [
                  //     Text.rich(
                  //
                  //       TextSpan(
                  //         text: "Customername : "+(jobdetailList?.length > 0 ? jobdetailList[index]["user_Firstname"] : '')+" "+(jobdetailList?.length > 0 ? jobdetailList[index]["user_Lastname"] : ''),
                  //         style: TextStyle(fontSize: 16, color: Colors.black),
                  //       ),
                  //
                  //     ),
                  //
                  //   ],
                  // ),
                  // Row(
                  //   children: [
                  //     Text.rich(
                  //
                  //       TextSpan(
                  //         text: "Tel. : "+(jobdetailList?.length > 0 ? jobdetailList[index]["user_Tel"] : ''),
                  //         style: TextStyle(fontSize: 16, color: Colors.black),
                  //       ),
                  //
                  //     ),
                  //
                  //   ],
                  // ),
                  // Row(
                  //   children: [
                  //     Text.rich(
                  //
                  //           TextSpan(
                  //             text: "Address : "+(jobdetailList?.length > 0 ? jobdetailList[index]["user_Address1"] : ''),
                  //             style: TextStyle(fontSize: 16, color: Colors.black),
                  //           ),
                  //
                  //     ),
                  //
                  //   ],
                  // ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      SizedBox(
                        width: getProportionateScreenWidth(310),
                        child: SizedBox(
                          width: double.infinity,
                          height: getProportionateScreenHeight(56),
                          child: FlatButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            color: colorback1,
                            onPressed: () {
                              if(jobdetailList[index]["checklist_data_Start"].toString() == "0000-00-00 00:00:00"){
                                CheckIn();
                              }else{

                              }


                            },

                            child: Text(
                              (jobdetailList.isNotEmpty ? (jobdetailList[index]["checklist_data_Start"].toString() != "0000-00-00 00:00:00" ? jobdetailList[index]["checklist_data_Start"] : "Check In") : "Check In"),
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(18),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
                  SizedBox(height: SizeConfig.screenHeight * 0.04),
                  ToggleButtons(
                    direction: vertical ? Axis.vertical : Axis.horizontal,
                    onPressed: (int index) {
                      setState(() {
                        // The button that is tapped is set to true, and the others to false.
                        for (int i = 0; i < _selectedtoogletab.length; i++) {
                          _selectedtoogletab[i] = i == index;
                        }
                        if (index == 0){
                          visibilityTag = true;
                          visibilityObs = false;
                        }
                        if (index == 1){
                          visibilityObs = true;
                          visibilityTag = false;
                        }
                      });
                    },

                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    selectedBorderColor: textsubhead,
                    selectedColor: Colors.white,
                    disabledColor: textsubhead,
                    disabledBorderColor: textsubhead,
                    fillColor: texthead,
                    color: textsubhead,
                    constraints: const BoxConstraints(
                      minHeight: 55.0,
                      minWidth: 166.0,
                    ),
                    isSelected: _selectedtoogletab,

                    children: toogletab,
                  ),

        Visibility(

          visible: visibilityTag,
          child:  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10.0),
                    // decoration: BoxDecoration(
                    //     border: Border.all(width: 1,
                    //         color: kPrimaryColor2,
                    //     )
                    // ),
                    // color: colorback1,
                    child: Column(

                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.only(left: 10.0),
                        //   child: Row(
                        //     children: [
                        //       Text.rich(
                        //
                        //         TextSpan(
                        //           text: "BEFORE",
                        //           style: TextStyle(fontSize: 16, color: Colors.black),
                        //         ),
                        //
                        //       ),
                        //
                        //     ],
                        //   ),
                        // ),
                        //
                        // // ToggleButtons with a single selection.
                        //
                        // const SizedBox(height: 5),

                        // Expanded(
                        // SizedBox(height: SizeConfig.screenHeight * 0.04),

                          Center(

                            child: GestureDetector(
                              onTap: () {
                                // _imgFromGallery();
                                _showPicker(context);
                              },
                              child: new Container(
                                child: SizedBox(
                                  height: 200,
                                  width: MediaQuery
                                      .of(context)
                                      .size
                                      .width,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,


                                    child: _image != null
                                        ? Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child:
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.file(
                                          _image,
                                          width: MediaQuery
                                              .of(context)
                                              .size
                                              .width,
                                          height: MediaQuery
                                              .of(context)
                                              .size
                                              .height,
                                          fit: BoxFit.fill,

                                        ),
                                      ),
                                    )
                                        : Container(

                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      width: MediaQuery
                                          .of(context)
                                          .size
                                          .width,
                                      height: MediaQuery
                                          .of(context)
                                          .size
                                          .height,
                                      child: SvgPicture.asset(
                                          "assets/icons/uploadbeforesvg.svg",
                                          width: 200,
                                          fit: BoxFit.fill
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                            ),

                          ),


                          // SizedBox(height: SizeConfig.screenHeight * 0.04),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10.0),
                            child: new Row(

                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 10.0,
                                            right: 10.0,
                                            bottom: 10.0),

                                        child: Text.rich(

                                          TextSpan(
                                            text: "Chlorine",
                                            style: TextStyle(fontSize: 16,
                                                color: kTextColor),
                                          ),

                                        ),

                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 1.0, right: 1.0),

                                        child: TextField(
                                          decoration: InputDecoration(
                                            prefixIconConstraints: BoxConstraints(minWidth: 40),
                                            prefixIcon: Align(
                                                widthFactor: 0.0,
                                                heightFactor: 1.0,
                                                child: Image.asset(
                                                  "assets/images/chlorinepng.png",
                                                  width: 20, height: 20,)
                                            ),

                                          ),
                                          controller: dataControl..text = arr1,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            //only numeric keyboard.
                                            LengthLimitingTextInputFormatter(5),
                                            //only 6 digit

                                          ],

                                          // initialValue: _result,

                                        ),

                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(left: 10.0,
                                            right: 10.0,
                                            bottom: 10.0),

                                        child: Text.rich(

                                          TextSpan(
                                            text: "pH",
                                            style: TextStyle(fontSize: 16,
                                                color: kTextColor),
                                          ),

                                        ),

                                      ),
                                      Container(
                                        padding: EdgeInsets.only(
                                            left: 1.0, right: 1.0),

                                        child: TextField(
                                          decoration: InputDecoration(
                                            prefixIconConstraints: BoxConstraints(minWidth: 40),
                                            prefixIcon: Align(
                                                widthFactor: 0.0,
                                                heightFactor: 1.0,
                                                child: Image.asset(
                                                  "assets/images/phpng.png",
                                                  width: 20, height: 20,)
                                            ),

                                          ),
                                          controller: dataControl1..text = arr2,
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            //only numeric keyboard.
                                            LengthLimitingTextInputFormatter(5),
                                            //only 6 digit

                                          ],

                                          // initialValue: _result,

                                        ),

                                      ),
                                    ],
                                  ),
                                ),

                                // Expanded(
                                //   child: Column(
                                //     children: [
                                //       Container(
                                //         padding: EdgeInsets.only(left: 10.0,right: 10.0,bottom: 10.0),
                                //
                                //         child: Text.rich(
                                //
                                //           TextSpan(
                                //             text: "salt",
                                //             style: TextStyle(fontSize: 16, color: Colors.black),
                                //           ),
                                //
                                //         ),
                                //
                                //       ),
                                //       Container(
                                //         padding: EdgeInsets.only(left: 10.0,right: 10.0),
                                //
                                //         child: TextField(
                                //           controller: dataControl2..text = arr3,
                                //           keyboardType: TextInputType.number,
                                //           inputFormatters:[                        //only numeric keyboard.
                                //             LengthLimitingTextInputFormatter(5),      //only 6 digit
                                //
                                //           ],
                                //
                                //           // initialValue: _result,
                                //
                                //         ),
                                //
                                //       ),
                                //     ],
                                //   ),
                                // ),

                              ],
                            ),
                          ),
                          // SizedBox(height: SizeConfig.screenHeight * 0.04),
                          // new Container(
                          //   padding: EdgeInsets.only(left: 20.0,right: 20.0),
                          //
                          //   child: TextField(
                          //
                          //     controller: dataControl..text = arr1,
                          //     keyboardType: TextInputType.number,
                          //     inputFormatters:[                        //only numeric keyboard.
                          //       LengthLimitingTextInputFormatter(5),      //only 6 digit
                          //
                          //     ],
                          //     decoration: const InputDecoration(
                          //
                          //       labelText: 'Chlorine',
                          //     ),
                          //     // initialValue: _result,
                          //
                          //   ),
                          //
                          // ),
                          // // ),
                          // // Expanded(
                          // SizedBox(height: SizeConfig.screenHeight * 0.04),
                          // new Container(
                          //   padding: EdgeInsets.only(left: 20.0,right: 20.0),
                          //
                          //   child: TextField(
                          //     controller: dataControl1..text = arr2,
                          //     keyboardType: TextInputType.number,
                          //     inputFormatters:[                        //only numeric keyboard.
                          //       LengthLimitingTextInputFormatter(5),      //only 6 digit
                          //
                          //     ],
                          //     decoration: const InputDecoration(
                          //       labelText: 'pH',
                          //     ),
                          //     // initialValue: _result,
                          //
                          //   ),
                          //
                          // ),
                          //
                          // SizedBox(height: SizeConfig.screenHeight * 0.04),
                          //
                          // new Container(
                          //   padding: EdgeInsets.only(left: 20.0,right: 20.0),
                          //
                          //   child: TextField(
                          //     controller: dataControl2..text = arr3,
                          //     keyboardType: TextInputType.number,
                          //     inputFormatters:[                        //only numeric keyboard.
                          //       LengthLimitingTextInputFormatter(5),      //only 6 digit
                          //
                          //     ],
                          //     decoration: const InputDecoration(
                          //       labelText: 'salt',
                          //     ),
                          //     // initialValue: _result,
                          //
                          //   ),
                          //
                          // ),

                          // SizedBox(height: SizeConfig.screenHeight * 0.04),

                          // Container(
                          //   padding: const EdgeInsets.only(left: 14.0, top: 14.0),
                          //   child: Text(
                          //     "Check list",
                          //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                          //   ),
                          // ),

                          // Column(
                          //   children: List.generate(
                          //     checkListItems1.length,
                          //         (index) => CheckboxListTile(
                          //       controlAffinity: ListTileControlAffinity.leading,
                          //       contentPadding: EdgeInsets.zero,
                          //       dense: true,
                          //       title: Text(
                          //         checkListItems1[index]["title"],
                          //         style: const TextStyle(
                          //           fontSize: 16.0,
                          //           color: Colors.black,
                          //         ),
                          //       ),
                          //       value: checkListItems1[index]["value"],
                          //       onChanged: (value) {
                          //         setState(() {
                          //           checkListItems1[index]["value"] = value;
                          //           if (multipleSelected1.contains(checkListItems1[index])) {
                          //             multipleSelected1.remove(checkListItems1[index]);
                          //           } else {
                          //             multipleSelected1.add(checkListItems1[index]);
                          //           }
                          //         });
                          //       },
                          //     ),
                          //   ),
                          // ),

                          // Container(
                          //   padding: const EdgeInsets.only(left: 14.0, top: 14.0),
                          //   child: Text(
                          //     "Check list",
                          //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                          //   ),
                          // ),
                          //
                          // Column(
                          //   children: List.generate(
                          //     checkListItems2.length,
                          //         (index) => CheckboxListTile(
                          //       controlAffinity: ListTileControlAffinity.leading,
                          //       contentPadding: EdgeInsets.zero,
                          //       dense: true,
                          //       title: Text(
                          //         checkListItems2[index]["title"],
                          //         style: const TextStyle(
                          //           fontSize: 16.0,
                          //           color: Colors.black,
                          //         ),
                          //       ),
                          //       value: checkListItems2[index]["value"],
                          //       onChanged: (value) {
                          //         setState(() {
                          //           checkListItems2[index]["value"] = value;
                          //           if (multipleSelected2.contains(checkListItems2[index])) {
                          //             multipleSelected2.remove(checkListItems2[index]);
                          //           } else {
                          //             multipleSelected2.add(checkListItems2[index]);
                          //           }
                          //         });
                          //       },
                          //     ),
                          //   ),
                          // ),
                          //BASIC RADIOBUTTONGROUP
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            // use whichever suits your need
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0,
                                    right: 10.0,
                                    top: 10.0,
                                    bottom: 10.0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 50.0),
                                      child: Text.rich(

                                        TextSpan(
                                          text: "คราบตะกอน",
                                          style: TextStyle(fontSize: 16,
                                              color: kTextColor),
                                        ),

                                      ),
                                    ),
                                    Spacer(),
                                    // FkToggle(
                                    //     width: 50,
                                    //     height: 30,
                                    //     labels: const ['1', '2', '3'],
                                    //     onSelected: select2),
                                    Ink(
                                      width: 150,
                                      height: 80,
                                      color: Colors.white,
                                      child: GridView.count(
                                        physics: NeverScrollableScrollPhysics(),
                                        primary: false,
                                        crossAxisCount: 3,
                                        //set the number of buttons in a row
                                        crossAxisSpacing: 8,
                                        //set the spacing between the buttons
                                        childAspectRatio: 1,
                                        //set the width-to-height ratio of the button,
                                        //>1 is a horizontal rectangle
                                        children: List.generate(
                                            isSelected1.length, (index) {
                                          //using Inkwell widget to create a button
                                          return InkWell(
                                              splashColor: Colors.yellow,
                                              //the default splashColor is grey
                                              onTap: () {
                                                //set the toggle logic
                                                setState(() {
                                                  for (int indexBtn = 0;
                                                  indexBtn < isSelected1.length;
                                                  indexBtn++) {
                                                    if (indexBtn == index) {
                                                      isSelected1[indexBtn] =
                                                      true;
                                                      select01 = indexBtn;
                                                      print(
                                                          "select01" + select01
                                                              .toString());
                                                    } else {
                                                      isSelected1[indexBtn] =
                                                      false;
                                                    }
                                                  }
                                                });
                                              },
                                              child: Ink(
                                                decoration: BoxDecoration(
                                                  //set the background color of the button when it is selected/ not selected
                                                  color: isSelected1[index]
                                                      ? Color(0xffD6EAF8)
                                                      : Colors.white,
                                                  // here is where we set the rounded corner
                                                  borderRadius: BorderRadius
                                                      .circular(8),
                                                  //don't forget to set the border,
                                                  //otherwise there will be no rounded corner
                                                  border: Border.all(
                                                      color: textsubhead),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: SvgPicture.asset(
                                                      strlist1[index],
                                                      //set the color of the icon when it is selected/ not selected
                                                      color: isSelected1[index]
                                                          ? Colors.blue
                                                          : Colors.grey),
                                                ),
                                              ));
                                        }),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0,
                                    right: 10.0,
                                    top: 10.0,
                                    bottom: 10.0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 50.0),
                                      child: Text.rich(

                                        TextSpan(
                                          text: "คราบผนัง",
                                          style: TextStyle(fontSize: 16,
                                              color: kTextColor),
                                        ),

                                      ),
                                    ),
                                    Spacer(),
                                    // FkToggle(
                                    //     width: 50,
                                    //     height: 30,
                                    //     labels: const ['1', '2', '3'],
                                    //     onSelected: select2),
                                    Ink(
                                      width: 150,
                                      height: 80,
                                      color: Colors.white,
                                      child: GridView.count(
                                        physics: NeverScrollableScrollPhysics(),
                                        primary: false,
                                        crossAxisCount: 3,
                                        //set the number of buttons in a row
                                        crossAxisSpacing: 8,
                                        //set the spacing between the buttons
                                        childAspectRatio: 1,
                                        //set the width-to-height ratio of the button,
                                        //>1 is a horizontal rectangle
                                        children: List.generate(
                                            isSelected2.length, (index) {
                                          //using Inkwell widget to create a button
                                          return InkWell(
                                              splashColor: Colors.yellow,
                                              //the default splashColor is grey
                                              onTap: () {
                                                //set the toggle logic
                                                setState(() {
                                                  for (int indexBtn = 0;
                                                  indexBtn < isSelected2.length;
                                                  indexBtn++) {
                                                    if (indexBtn == index) {
                                                      isSelected2[indexBtn] =
                                                      true;
                                                      select02 = indexBtn;
                                                      print(
                                                          "select02" + select02
                                                              .toString());
                                                    } else {
                                                      isSelected2[indexBtn] =
                                                      false;
                                                    }
                                                  }
                                                });
                                              },
                                              child: Ink(
                                                decoration: BoxDecoration(
                                                  //set the background color of the button when it is selected/ not selected
                                                  color: isSelected2[index]
                                                      ? Color(0xffD6EAF8)
                                                      : Colors.white,
                                                  // here is where we set the rounded corner
                                                  borderRadius: BorderRadius
                                                      .circular(8),
                                                  //don't forget to set the border,
                                                  //otherwise there will be no rounded corner
                                                  border: Border.all(
                                                      color: textsubhead),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: SvgPicture.asset(
                                                      strlist2[index],
                                                      //set the color of the icon when it is selected/ not selected
                                                      color: isSelected2[index]
                                                          ? Colors.blue
                                                          : Colors.grey),
                                                ),
                                              ));
                                        }),
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(left: 10.0,
                                    right: 10.0,
                                    top: 10.0,
                                    bottom: 10.0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 50.0),
                                      child: Text.rich(

                                        TextSpan(
                                          text: "ความใสของน้ำ",
                                          style: TextStyle(fontSize: 16,
                                              color: kTextColor),
                                        ),

                                      ),
                                    ),
                                    Spacer(),
                                    // FkToggle(
                                    //     width: 50,
                                    //     height: 30,
                                    //     labels: const ['1', '2', '3'],
                                    //     onSelected: select3),
                                    Ink(
                                      width: 150,
                                      height: 80,
                                      color: Colors.white,
                                      child: GridView.count(
                                        physics: NeverScrollableScrollPhysics(),
                                        primary: false,
                                        crossAxisCount: 3,
                                        //set the number of buttons in a row
                                        crossAxisSpacing: 8,
                                        //set the spacing between the buttons
                                        childAspectRatio: 1,
                                        //set the width-to-height ratio of the button,
                                        //>1 is a horizontal rectangle
                                        children: List.generate(
                                            isSelected3.length, (index) {
                                          //using Inkwell widget to create a button
                                          return InkWell(
                                              splashColor: Colors.yellow,
                                              //the default splashColor is grey
                                              onTap: () {
                                                //set the toggle logic
                                                setState(() {
                                                  for (int indexBtn = 0;
                                                  indexBtn < isSelected3.length;
                                                  indexBtn++) {
                                                    if (indexBtn == index) {
                                                      isSelected3[indexBtn] =
                                                      true;
                                                      select03 = indexBtn;
                                                      print(
                                                          "select03" + select03
                                                              .toString());
                                                    } else {
                                                      isSelected3[indexBtn] =
                                                      false;
                                                    }
                                                  }
                                                });
                                              },
                                              child: Ink(
                                                decoration: BoxDecoration(
                                                  //set the background color of the button when it is selected/ not selected
                                                  color: isSelected3[index]
                                                      ? Color(0xffD6EAF8)
                                                      : Colors.white,
                                                  // here is where we set the rounded corner
                                                  borderRadius: BorderRadius
                                                      .circular(8),
                                                  //don't forget to set the border,
                                                  //otherwise there will be no rounded corner
                                                  border: Border.all(
                                                      color: textsubhead),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  child: SvgPicture.asset(
                                                      strlist3[index],
                                                      //set the color of the icon when it is selected/ not selected
                                                      color: isSelected3[index]
                                                          ? Colors.blue
                                                          : Colors.grey),
                                                ),
                                              ));
                                        }),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: getProportionateScreenHeight(30)),

                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: getProportionateScreenWidth(20)),
                                child: DefaultButton(
                                  text: "Next >",
                                  press: () {

                                    setState(() {
                                      visibilityObs = true;
                                      visibilityTag = false;
                                      _selectedtoogletab[0] = false;
                                      _selectedtoogletab[1] = true;
                                    });


                                    // InsertMethod();
                                    // if all are valid then go to success screen
                                    // Navigator.pushNamed(context, QualityPageScreen.routeName);
                                    // Navigator.of(context).pushNamedAndRemoveUntil( QualityPageScreen.routeName, (Route<dynamic> route) => false,arguments: PoolDataDetailsArguments(value:senddata));


                                  },
                                ),
                              ),

                            ],
                          ),

                      ],
                    ),
                  ),
        ),

        Visibility(

          visible: visibilityObs ,
          child: Container(
                    padding: const EdgeInsets.all(10.0),

                    child: Column(
                      children: [

                        // Expanded(
                        SizedBox(height: SizeConfig.screenHeight * 0.04),


                        Padding(
                          padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0,bottom: 10.0),
                          child: Column(

                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Text.rich(

                                      TextSpan(
                                        text: "ตรวจสอบระบบ",
                                        style: TextStyle(fontSize: 16, color: kTextColor),
                                      ),

                                    ),
                                  ),
                                ],
                              ),
                              // FkToggle(
                              //     width: 60,
                              //     height: 50,
                              //     labels: const ['NO', 'YES'],
                              //     cornerRadius: 30,
                              //     onSelected: select4),
                              Ink(
                                width: 380,
                                height: 100,
                                color: Colors.white,
                                child: GridView.count(
                                  physics: NeverScrollableScrollPhysics(),
                                  primary: false,
                                  crossAxisCount: 2,
                                  //set the number of buttons in a row
                                  crossAxisSpacing: 8,
                                  //set the spacing between the buttons
                                  childAspectRatio: 3,
                                  //set the width-to-height ratio of the button,
                                  //>1 is a horizontal rectangle
                                  children: List.generate(
                                      isSelected4.length, (index) {
                                    //using Inkwell widget to create a button
                                    return InkWell(
                                        splashColor: Colors.yellow,
                                        //the default splashColor is grey
                                        onTap: () {
                                          //set the toggle logic
                                          setState(() {
                                            for (int indexBtn = 0;
                                            indexBtn < isSelected4.length;
                                            indexBtn++) {
                                              if (indexBtn == index) {
                                                isSelected4[indexBtn] =
                                                true;
                                                select04 = indexBtn;
                                                print(
                                                    "select04" + select04
                                                        .toString());
                                              } else {
                                                isSelected4[indexBtn] =
                                                false;
                                              }
                                            }
                                          });
                                        },
                                        child: Ink(
                                          decoration: BoxDecoration(
                                            //set the background color of the button when it is selected/ not selected
                                            color: isSelected4[index]
                                                ? Colors.white
                                                : Colors.white,
                                            // here is where we set the rounded corner
                                            borderRadius: BorderRadius
                                                .circular(8),
                                            //don't forget to set the border,
                                            //otherwise there will be no rounded corner
                                            border: Border.all(
                                                color: isSelected4[index]
                                                    ? Color(0xff4082cb)
                                                    : Color(0xff9f9f9f)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(
                                                1.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                if(isSelected4[index])
                                                Padding(
                                                  padding: const EdgeInsets.only(right: 5.0,top: 5.0),
                                                  child: SvgPicture.asset(
                                                      strlist4[index],
                                                      width: 18,
                                                      height: 18,
                                                      //set the color of the icon when it is selected/ not selected
                                                      color: isSelected4[index]
                                                          ? Color(0xff4082cb)
                                                          : Color(0xff9f9f9f)),
                                                ),
                                                Text.rich(

                                                  TextSpan(
                                                    text: strlist4s[index],
                                                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: isSelected4[index]
                                                        ? Color(0xff4082cb)
                                                        : Color(0xff9f9f9f)),
                                                  ),

                                                ),
                                              ],
                                            ),
                                          ),
                                        ));
                                  }),
                                ),
                              ),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10.0),
                                    child: Text.rich(

                                      TextSpan(
                                        text: "ทำความสะอาด",
                                        style: TextStyle(fontSize: 16, color: kTextColor),
                                      ),

                                    ),
                                  ),
                                ],
                              ),
                              // FkToggle(
                              //     width: 60,
                              //     height: 50,
                              //     labels: const ['NO', 'YES'],
                              //     cornerRadius: 30,
                              //     onSelected: select5),
                              Ink(
                                width: 380,
                                height: 100,
                                color: Colors.white,
                                child: GridView.count(
                                  physics: NeverScrollableScrollPhysics(),
                                  primary: false,
                                  crossAxisCount: 2,
                                  //set the number of buttons in a row
                                  crossAxisSpacing: 8,
                                  //set the spacing between the buttons
                                  childAspectRatio: 3,
                                  //set the width-to-height ratio of the button,
                                  //>1 is a horizontal rectangle
                                  children: List.generate(
                                      isSelected5.length, (index) {
                                    //using Inkwell widget to create a button
                                    return InkWell(
                                        splashColor: Colors.yellow,
                                        //the default splashColor is grey
                                        onTap: () {
                                          //set the toggle logic
                                          setState(() {
                                            for (int indexBtn = 0;
                                            indexBtn < isSelected5.length;
                                            indexBtn++) {
                                              if (indexBtn == index) {
                                                isSelected5[indexBtn] =
                                                true;
                                                select05 = indexBtn;
                                                print(
                                                    "select04" + select05
                                                        .toString());
                                              } else {
                                                isSelected5[indexBtn] =
                                                false;
                                              }
                                            }
                                          });
                                        },
                                        child: Ink(
                                          decoration: BoxDecoration(
                                            //set the background color of the button when it is selected/ not selected
                                            color: isSelected5[index]
                                                ? Colors.white
                                                : Colors.white,
                                            // here is where we set the rounded corner
                                            borderRadius: BorderRadius
                                                .circular(8),
                                            //don't forget to set the border,
                                            //otherwise there will be no rounded corner
                                            border: Border.all(
                                                color: isSelected5[index]
                                                    ? Color(0xff4082cb)
                                                    : Color(0xff9f9f9f)),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(
                                                1.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                if(isSelected5[index])
                                                  Padding(
                                                    padding: const EdgeInsets.only(right: 5.0,top: 5.0),
                                                    child: SvgPicture.asset(
                                                        strlist5[index],
                                                        width: 18,
                                                        height: 18,
                                                        //set the color of the icon when it is selected/ not selected
                                                        color: isSelected5[index]
                                                            ? Color(0xff4082cb)
                                                            : Color(0xff9f9f9f)),
                                                  ),
                                                Text.rich(

                                                  TextSpan(
                                                    text: strlist5s[index],
                                                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: isSelected5[index]
                                                        ? Color(0xff4082cb)
                                                        : Color(0xff9f9f9f)),
                                                  ),

                                                ),
                                              ],
                                            ),
                                          ),
                                        ));
                                  }),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Container(
                        //   padding: const EdgeInsets.only(left: 14.0, top: 14.0),
                        //   child: Text(
                        //     "ระบบ",
                        //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                        //   ),
                        // ),
                        //
                        // RadioButtonGroup(
                        //   labels: [
                        //     "ปกติ",
                        //     "ไม่ปกติ",
                        //   ],
                        //   // disabled: ["Option 1"],
                        //   onChange: (String label, int index) =>
                        //       print("label: $label index: $index"),
                        //   onSelected: (String index) =>
                        //   selectedcheck1 = index,
                        // ),
                        //
                        // Container(
                        //   padding: const EdgeInsets.only(left: 14.0, top: 14.0),
                        //   child: Text(
                        //     "ทำความสะอาด",
                        //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                        //   ),
                        // ),
                        //
                        // RadioButtonGroup(
                        //   labels: [
                        //     "ทำความสะอาด",
                        //     "ไม่ทำความสะอาด",
                        //   ],
                        //   // disabled: ["Option 1"],
                        //   onChange: (String label, int index) =>
                        //       print("label: $label index: $index"),
                        //   onSelected: (String index) =>
                        //   selectedcheck2 = index,
                        // ),
                        // Container(
                        //   padding: const EdgeInsets.only(left: 14.0, top: 14.0),
                        //   child: Text(
                        //     "น้ำ",
                        //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                        //   ),
                        // ),
                        //
                        // RadioButtonGroup(
                        //   labels: [
                        //     "ใส",
                        //     "ขุ่น",
                        //   ],
                        //   // disabled: ["Option 1"],
                        //   onChange: (String label, int index) =>
                        //       print("label: $label index: $index"),
                        //   onSelected: (String index) =>
                        //   selected1 = index,
                        // ),
                        // //BASIC RADIOBUTTONGROUP
                        // Container(
                        //   padding: const EdgeInsets.only(left: 14.0, top: 14.0),
                        //   child: Text(
                        //     "พื้น",
                        //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                        //   ),
                        // ),
                        //
                        // RadioButtonGroup(
                        //   labels: [
                        //     "มีคราบตะกอน",
                        //     "ไม่มีคราบตะกอน",
                        //   ],
                        //   // disabled: ["Option 1"],
                        //   onChange: (String label, int index) =>
                        //       print("label: $label index: $index"),
                        //   onSelected: (String index) =>
                        //   selected2 = index,
                        // ),
                        // //BASIC RADIOBUTTONGROUP
                        // Container(
                        //   padding: const EdgeInsets.only(left: 14.0, top: 14.0),
                        //   child: Text(
                        //     "ผนัง",
                        //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                        //   ),
                        // ),
                        //
                        // RadioButtonGroup(
                        //   labels: [
                        //     "ปกติ",
                        //     "ไม่ปกติ",
                        //   ],
                        //   // disabled: ["Option 1"],
                        //   onChange: (String label, int index) =>
                        //       print("label: $label index: $index"),
                        //   onSelected: (String index) =>
                        //   selected3 = index,
                        // ),

                        //BASIC RADIOBUTTONGROUP

            SizedBox(height: getProportionateScreenHeight(20)),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Row(
                            children: [
                              Text.rich(

                                TextSpan(
                                  text: "Note",
                                  style: TextStyle(fontSize: 16, color: Colors.black),
                                ),

                              ),

                            ],
                          ),
                        ),
                        SizedBox(height: getProportionateScreenHeight(20)),

                        new Container(
                          padding: EdgeInsets.only(left: 20.0,right: 20.0),

                          child: TextField(
                            controller: dataControldes..text = datades,
                            keyboardType: TextInputType.multiline,
                            minLines: 3,
                            maxLines: null,

                            decoration: const InputDecoration(
                              // labelText: 'Description',
                              // contentPadding: EdgeInsets.symmetric(vertical: 50.0),
                              // isDense: true,
                                contentPadding: EdgeInsets.all(20)
                            ),
                            // initialValue: _result,

                          ),

                        ),

                        SizedBox(height: getProportionateScreenHeight(30)),

                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: getProportionateScreenWidth(20)),
                          child: DefaultButton(
                            text: "Save & Submit",

                            press: () {
                              showLoaderDialog(this.context);
                                InsertMethod();

                              // InsertMethod();
                              // if all are valid then go to success screen
                              // Navigator.pushNamed(context, QualityPageScreen.routeName);
                              // Navigator.of(context).pushNamedAndRemoveUntil( QualityPageScreen.routeName, (Route<dynamic> route) => false,arguments: PoolDataDetailsArguments(value:senddata));


                            },
                          ),
                        ),

                        SizedBox(height: getProportionateScreenHeight(10)),
                      ],
                    ),
                  ),
        ),
                ],

              ),
            ),
          ),


        // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.historyScreen),
      );
    // }else{
    //   return Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Text("No Job")
    //       ],
    //     ),
    //   );
    }
  }
}
Future _getThingsOnStartup() async {
  await Future.delayed(Duration(seconds: 1));
}