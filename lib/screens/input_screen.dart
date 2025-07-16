import 'dart:io';

import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/components/default_button.dart';
import 'package:JDPoolsApplication/enums.dart';
import 'package:JDPoolsApplication/components/coustom_bottom_nav_bar.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../size_config.dart';

import 'package:flutter_session/flutter_session.dart';
import 'package:JDPoolsApplication/screens/pool_information/pool_information_screen.dart';
class inputScreen extends StatefulWidget {

  final File file;

  inputScreen({
    Key key,
    // String key,
    // this.imagePath,
    this.file
  }) : super(key: key);

  @override
  _inputScreen createState() => _inputScreen();
}

class _inputScreen extends State<inputScreen> {
  var userId;
  @override
  // ignore: must_call_super
  void initState() {
    // getListCustomer();

  }
  var arr,arr1,arr2,arr3,arr4,arr5,arr6,arr7,arr8,arr9,arr10,arr11  = "";

  String _dropDownValue;
  TextEditingController dataControl = TextEditingController();
  TextEditingController dataControl1 = TextEditingController();
  TextEditingController dataControl2 = TextEditingController();
  TextEditingController dataControl3 = TextEditingController();
  TextEditingController dataControl4 = TextEditingController();
  TextEditingController dataControl5 = TextEditingController();
  TextEditingController dataControl6 = TextEditingController();
  TextEditingController dataControl7 = TextEditingController();
  TextEditingController dataControl8 = TextEditingController();
  TextEditingController dataControl9 = TextEditingController();
  TextEditingController dataControl10 = TextEditingController();
  String get data1 => dataControl.text;
  String get data2 => dataControl1.text;
  String get data3 => dataControl2.text;
  String get data4 => dataControl3.text;
  String get data5 => dataControl4.text;
  String get data6 => dataControl5.text;
  String get data7 => dataControl6.text;
  String get data8 => dataControl7.text;
  String get data9 => dataControl8.text;
  String get data10 => dataControl9.text;
  String get data11 => dataControl10.text;
  var locationMessage = "";
  List customerList = List();
  getCurrentLocation() async {
    var position = await Geolocator.getCurrentPosition(desiredAccuracy:LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    print(lastPosition);
    setState(() {
      locationMessage = "{$position.latitude , $position.longitude}";
    });
  }
  InsertMethod()async{
    userId = "${await FlutterSession().get("userId")}";
    var url = Uri.https('jdpoolswebservice.com', '/spintest/addDataSpin.php', {'q': '{http}'});
    // String Url = "http://jdpoolswebservice.com/spintest/addDataSpin.php";
    var res = await http.post(url,headers:{"Accept" : "application/json"},
        body: {
          // "customer":_dropDownValue,
          "userid":userId,
          "data1" : data1,
          "data2" : data2,
          "data3" : data3,
          "data4" : data4,
          "data5" : data5,
          "data6" : data6,
          "data7" : data7,
          "data8" : data8,
          "data9" : data9,
          "data10" : data10,
          "data11" : data11,

        }
    );
    var resBody = json.decode(res.body);
    print(resBody);
  }


  getListCustomer()async{
    var url = Uri.https('jdpoolswebservice.com', '/spintest/customerList.php', {'q': '{http}'});
    // String Url = "http://jdpoolswebservice.com/spintest/customerList.php";
    var res = await http.get(url,headers:{"Accept" : "application/json"},
      // body: {
      //   "serial":serial_code,
      //   "item" : _dropDownValue,
      // }
    );
    var resBody = json.decode(res.body);
    setState(() {
      customerList = resBody;
    });
    print(customerList);
  }
  final pdf = pw.Document();

  writeOnPdf(){
    pdf.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a5,
          margin: pw.EdgeInsets.all(32),

          build: (pw.Context context){
            return <pw.Widget>  [
              pw.Header(
                  level: 0,
                  child: pw.Text("Easy Approach Document")
              ),

              pw.Paragraph(
                  text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada fames ac turpis egestas sed tempus urna. Quisque sagittis purus sit amet. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Viverra justo nec ultrices dui sapien eget mi proin sed."
              ),

              pw.Paragraph(
                  text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada fames ac turpis egestas sed tempus urna. Quisque sagittis purus sit amet. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Viverra justo nec ultrices dui sapien eget mi proin sed."
              ),

              pw.Header(
                  level: 1,
                  child: pw.Text("Second Heading")
              ),

              pw.Paragraph(
                  text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada fames ac turpis egestas sed tempus urna. Quisque sagittis purus sit amet. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Viverra justo nec ultrices dui sapien eget mi proin sed."
              ),

              pw.Paragraph(
                  text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada fames ac turpis egestas sed tempus urna. Quisque sagittis purus sit amet. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Viverra justo nec ultrices dui sapien eget mi proin sed."
              ),

              pw.Paragraph(
                  text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada fames ac turpis egestas sed tempus urna. Quisque sagittis purus sit amet. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Viverra justo nec ultrices dui sapien eget mi proin sed."
              ),
            ];
          },


        )
    );
  }

  Future savePdf() async{
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String documentPath = documentDirectory.path;

    File file = File("$documentPath/example.pdf");

    // file.writeAsBytesSync(pdf.save());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
              // Expanded(
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              new Container(
                padding: EdgeInsets.only(left: 20.0,right: 20.0),

                child: TextField(

                  controller: dataControl..text = arr1,
                  keyboardType: TextInputType.number,
                  inputFormatters:[                        //only numeric keyboard.
                    LengthLimitingTextInputFormatter(5),      //only 6 digit

                  ],
                  decoration: const InputDecoration(

                    labelText: 'FCL - Free Chlorine',
                  ),
                  // initialValue: _result,

                ),

              ),
              // ),
              // Expanded(
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              new Container(
                padding: EdgeInsets.only(left: 20.0,right: 20.0),

                child: TextField(
                  controller: dataControl1..text = arr2,
                  keyboardType: TextInputType.number,
                  inputFormatters:[                        //only numeric keyboard.
                    LengthLimitingTextInputFormatter(5),      //only 6 digit

                  ],
                  decoration: const InputDecoration(
                    labelText: 'TCL - Total Chlorine',
                  ),
                  // initialValue: _result,

                ),

              ),
              // ),
              // Expanded(
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              new Container(
                padding: EdgeInsets.only(left: 20.0,right: 20.0),

                child: TextField(
                  controller: dataControl2..text = arr3,
                  keyboardType: TextInputType.number,
                  inputFormatters:[                        //only numeric keyboard.
                    LengthLimitingTextInputFormatter(5),      //only 6 digit

                  ],
                  decoration: const InputDecoration(
                    labelText: 'CCL - Combined Chlorine',
                  ),
                  // initialValue: _result,

                ),

              ),
              // ),
              // Expanded(
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              new Container(
                padding: EdgeInsets.only(left: 20.0,right: 20.0),

                child: TextField(
                  controller: dataControl3..text = arr4,
                  keyboardType: TextInputType.number,
                  inputFormatters:[                        //only numeric keyboard.
                    LengthLimitingTextInputFormatter(5),      //only 6 digit

                  ],
                  decoration: const InputDecoration(
                    labelText: 'Hardness',
                  ),
                  // initialValue: _result,
                ),

              ),
              // ),
              // Expanded(
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              new Container(
                padding: EdgeInsets.only(left: 20.0,right: 20.0),

                child: TextField(
                  controller: dataControl4..text = arr5,
                  keyboardType: TextInputType.number,
                  inputFormatters:[                        //only numeric keyboard.
                    LengthLimitingTextInputFormatter(5),      //only 6 digit

                  ],
                  decoration: const InputDecoration(
                    labelText: 'CYA - Cyanuric Acid',
                  ),
                  // initialValue: _result,

                ),

              ),
              // ),
              // Expanded(
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              new Container(
                padding: EdgeInsets.only(left: 20.0,right: 20.0),

                child: TextField(
                  controller: dataControl5..text = arr6,
                  keyboardType: TextInputType.number,
                  inputFormatters:[                        //only numeric keyboard.
                    LengthLimitingTextInputFormatter(5),      //only 6 digit

                  ],
                  decoration: const InputDecoration(
                    labelText: 'COPPER',
                  ),
                  // initialValue: _result,

                ),

              ),
              // ),
              // Expanded(
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              new Container(
                padding: EdgeInsets.only(left: 20.0,right: 20.0),

                child: TextField(
                  controller: dataControl6..text = arr7,
                  keyboardType: TextInputType.number,
                  inputFormatters:[                        //only numeric keyboard.
                    LengthLimitingTextInputFormatter(5),      //only 6 digit

                  ],
                  decoration: const InputDecoration(
                    labelText: 'IRON',
                  ),
                  // initialValue: _result,

                ),

              ),
              // ),
              // Expanded(
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              new Container(
                padding: EdgeInsets.only(left: 20.0,right: 20.0),

                child: TextField(
                  controller: dataControl7..text = arr8,
                  keyboardType: TextInputType.number,
                  inputFormatters:[                        //only numeric keyboard.
                    LengthLimitingTextInputFormatter(5),      //only 6 digit

                  ],
                  decoration: const InputDecoration(
                    labelText: 'pH',
                  ),
                  // initialValue: _result,

                ),

              ),
              // ),
              // Expanded(
              SizedBox(height: SizeConfig.screenHeight * 0.04),
              new Container(
                padding: EdgeInsets.only(left: 20.0,right: 20.0),

                child: TextField(
                  controller: dataControl8..text = arr9,
                  keyboardType: TextInputType.number,
                  inputFormatters:[                        //only numeric keyboard.
                    LengthLimitingTextInputFormatter(5),      //only 6 digit

                  ],
                  decoration: const InputDecoration(
                    labelText: 'ALK - Alkaline',
                  ),
                  // initialValue: _result,

                ),

              ),
              SizedBox(height: SizeConfig.screenHeight * 0.04),

              new Container(
                padding: EdgeInsets.only(left: 20.0,right: 20.0),

                child: TextField(
                  controller: dataControl9..text = arr10,
                  keyboardType: TextInputType.number,
                  inputFormatters:[                        //only numeric keyboard.
                    LengthLimitingTextInputFormatter(6),      //only 6 digit

                  ],
                  decoration: const InputDecoration(
                    labelText: 'SALT',
                  ),
                  // initialValue: _result,

                ),

              ),
              SizedBox(height: SizeConfig.screenHeight * 0.04),

              new Container(
                padding: EdgeInsets.only(left: 20.0,right: 20.0),

                child: TextField(
                  controller: dataControl10..text = arr11,
                  keyboardType: TextInputType.number,
                  inputFormatters:[                        //only numeric keyboard.
                    LengthLimitingTextInputFormatter(5),      //only 6 digit

                  ],
                  decoration: const InputDecoration(
                    labelText: 'PHOSPHATE',
                  ),
                  // initialValue: _result,

                ),

              ),
              // ),
              // Expanded(
              SizedBox(height: SizeConfig.screenHeight * 0.04),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                child: DefaultButton(
                  text: "Submit",
                  press: () async{
                    // getCurrentLocation();
                    InsertMethod();
                    // await writeOnPdf();
                    // await savePdf();

                    Directory documentDirectory = await getApplicationDocumentsDirectory();

                    String documentPath = documentDirectory.path;

                    String fullPath = "$documentPath/example.pdf";
                    // if all are valid then go to success screen
                    // Navigator.pushNamed(context, QualityPageScreen.routeName);
                    Navigator.of(context).pushNamed( PoolInformationScreen.routeName,arguments: PoolInformationDetailsArguments(product: null));


                  },
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.04),
            ],

          ),
        ),
      ),

        // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.historyScreen),
    );

  }
}