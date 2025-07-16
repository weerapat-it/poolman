import 'dart:io';
import 'package:JDPoolsApplication/components/default_button.dart';
import 'package:firebase_ml_vision/firebase_ml_vision.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:JDPoolsApplication/helper/dialog_helper.dart';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../size_config.dart';
import 'PdfPreviewScreen.dart';
import 'package:JDPoolsApplication/screens/pool_information/pool_information_screen.dart';
import '../../constants.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:JDPoolsApplication/screens/pool_information/models/Product.dart';
// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatefulWidget {
  // final String imagePath;
  final File file;

  DisplayPictureScreen({
    Key key,
    // String key,
    // this.imagePath,
    this.file
  }) : super(key: key);

  @override
  _DisplayPictureScreen createState() => new _DisplayPictureScreen();
}

class _DisplayPictureScreen extends State<DisplayPictureScreen> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.horizontal;
  String _result;
  List arr = [];
  var arr1,arr2,arr3,arr4,arr5,arr6,arr7,arr8,arr9,arr10,arr11;
  var userId;
  var datatest = {};
  // Use the path to the temporary image and get results from Firebase
  Future<String> getFirebaseVisionText() async {
    final File imageFile = widget.file;
    final FirebaseVisionImage visionImage = FirebaseVisionImage.fromFile(imageFile);
    final TextRecognizer textRecognizer = FirebaseVision.instance.textRecognizer();
    VisionText visionText = await textRecognizer.processImage(visionImage);

    textRecognizer.close();

    return visionText.text;
  }

  @override
  // ignore: must_call_super
  void initState() {
    // getListCustomer();
    getFirebaseVisionText().then((result) {
      setState(() {
        _result = result;
        // _result.split(' ');
        String str = _result;
        print(str);
        //split string
         arr = str.split('\n');
        arr1 = arr[2].split(' ');
        arr2 = arr[3].split(' ');
        arr3 = arr[4].split(' ');
        arr4 = arr[5].split(' ');
        arr5 = arr[6].split(' ');
        arr6 = arr[7].split(' ');
        arr7 = arr[8].split(' ');
        arr8 = arr[9].split(' ');
        arr9 = arr[10].split(' ');
        // arr10 = arr[11].split(' ');
        if(arr.length>11) {
          arr10 = arr[11].split(' ');
          arr11 = ['PHOSPHATE',''];
        }else{
          arr10 = ['SALT',''];
          arr11 = ['PHOSPHATE',''];
        }
        print(arr);
        print(arr.length);
       datatest = {
         arr1[0] : arr1[1],
         arr2[0] : arr2[1],
         arr3[0] : arr3[1],
         arr4[0] : arr4[1],
         arr5[0] : arr5[1],
         arr6[0] : arr6[1],
         arr7[0] : arr7[1],
         arr8[0] : arr8[1],
         arr9[0] : arr9[1],
         arr10[0] : arr10[1],
         arr11[0] : arr11[1],
       };
        print(arr);
        print(arr1);
        print(arr2);
        print(arr3);
        print(arr4);
        print(arr5);
        print(arr6);
        print(arr7);
        print(arr8);
        print(arr9);
        print(arr10);
        print(arr11);
        print(datatest);
      });
    }).catchError(
        (error) => {print(error),
          // showAlertDialog(context)
        DialogHelper.exit(context),
        // Navigator.of(context).pop(),
        }
    );
  }
  showAlertDialog(BuildContext context) {

    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () {Navigator.of(context).pop();Navigator.of(context).pop(); },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Notice"),
      content: Text("Please select new picture."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
  String _dropDownValue;
  List customerList = List();
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

  getCurrentLocation() async {

    var position = await Geolocator.getCurrentPosition(desiredAccuracy:LocationAccuracy.high);
    var lastPosition = await Geolocator.getLastKnownPosition();
    print(lastPosition);
    setState(() {
      locationMessage = "{$position.latitude , $position.longitude}";
    });
  }
  // ignore: non_constant_identifier_names
  InsertMethod()async{

    userId = "${await FlutterSession().get("userId")}";
    print(userId);
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
    // String Url = "http://jdpoolswebservice.com/spintest/customerList.php";
    var url = Uri.https('jdpoolswebservice.com', '/spintest/customerList.php', {'q': '{http}'});
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

    file.writeAsBytesSync(await pdf.save());
  }



  @override
  Widget build(BuildContext context) {

    // No result yet, show loading screen
    if (_result == null || _result == "") {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator()
            ],
          ),
        ),
      );
    }
    // Results found, show results
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(
            color: kPrimaryColor, //change your color here
          ),
          backgroundColor: kPrimaryColor2,
          centerTitle: true,title: Text('Results',style: TextStyle(color: kPrimaryColor))),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Stepper(
                type: stepperType,
                physics: ScrollPhysics(),
                currentStep: _currentStep,

                steps: <Step>[
                  Step(
                    title: new Text('Spin data'),
                    content: Center(

                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),

                        child: new SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: <Widget>[


                              // Expanded(
                              //   child: Container(
                              //     new Container(
                              //       padding: EdgeInsets.only(top: 20.0,left: 20.0,right: 20.0),
                              //       child: Scrollbar(
                              //           child: SingleChildScrollView(
                              //               child: DropdownButton(
                              //                 hint: _dropDownValue == null
                              //                     ? Text('Select')
                              //                     : Text(
                              //                   _dropDownValue,
                              //                   style: TextStyle(color: Colors.blue),
                              //                 ),
                              //                 isExpanded: true,
                              //                 iconSize: 30.0,
                              //                 style: TextStyle(color: Colors.blue),
                              //                 items: customerList.map(
                              //                       (customer) {
                              //                     return DropdownMenuItem(
                              //                       value: customer['Customer_Firstname']+" "+customer['Customer_Lastname'],
                              //                       child: Text(customer['Customer_Firstname']+" "+customer['Customer_Lastname']),
                              //                     );
                              //                   },
                              //                 ).toList(),
                              //                 onChanged: (value) {
                              //                   setState(
                              //                         () {
                              //                       _dropDownValue = value;
                              //                     },
                              //                   );
                              //                 },
                              //               ),
                              //           )
                              //       )
                              //   ),
                              // ),
                              // Expanded(
                              SizedBox(height: SizeConfig.screenHeight * 0.04),
                              new Container(
                                padding: EdgeInsets.only(left: 20.0,right: 20.0),

                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  inputFormatters:[                        //only numeric keyboard.
                                    LengthLimitingTextInputFormatter(5),      //only 6 digit

                                  ],
                                  controller: dataControl..text = datatest['FCL'].toString().replaceAll('O','0'),

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
                                  keyboardType: TextInputType.number,
                                  inputFormatters:[                        //only numeric keyboard.
                                    LengthLimitingTextInputFormatter(5),      //only 6 digit

                                  ],
                                  controller: dataControl1..text = datatest['TCL'].toString().replaceAll('O','0'),
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
                                  keyboardType: TextInputType.number,
                                  inputFormatters:[                        //only numeric keyboard.
                                    LengthLimitingTextInputFormatter(5),      //only 6 digit

                                  ],
                                  controller: dataControl2..text = datatest['CCL'].toString().replaceAll('O','0'),
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
                                  keyboardType: TextInputType.number,
                                  inputFormatters:[                        //only numeric keyboard.
                                    LengthLimitingTextInputFormatter(5),      //only 6 digit

                                  ],
                                  controller: dataControl3..text = datatest['HARD'].toString().replaceAll('O','0'),
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
                                  keyboardType: TextInputType.number,
                                  inputFormatters:[                        //only numeric keyboard.
                                    LengthLimitingTextInputFormatter(5),      //only 6 digit

                                  ],
                                  controller: dataControl4..text = datatest['CYA'].toString().replaceAll('O','0'),
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
                                  keyboardType: TextInputType.number,
                                  inputFormatters:[                        //only numeric keyboard.
                                    LengthLimitingTextInputFormatter(5),      //only 6 digit

                                  ],
                                  controller: dataControl5..text = datatest['COPPER'].toString().replaceAll('O','0'),
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
                                  keyboardType: TextInputType.number,
                                  inputFormatters:[                        //only numeric keyboard.
                                    LengthLimitingTextInputFormatter(5),      //only 6 digit

                                  ],
                                  controller: dataControl6..text = datatest['IRON'].toString().replaceAll('O','0'),
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
                                  keyboardType: TextInputType.number,
                                  inputFormatters:[                        //only numeric keyboard.
                                    LengthLimitingTextInputFormatter(5),      //only 6 digit

                                  ],
                                  controller: dataControl7..text = datatest['pH'].toString().replaceAll('O','0'),
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
                                  keyboardType: TextInputType.number,
                                  inputFormatters:[                        //only numeric keyboard.
                                    LengthLimitingTextInputFormatter(5),      //only 6 digit

                                  ],
                                  controller: dataControl8..text = datatest['ALK'].toString().replaceAll('O','0'),
                                  decoration: const InputDecoration(
                                    labelText: 'ALK - Alkaline',
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
                                  keyboardType: TextInputType.number,
                                  inputFormatters:[                        //only numeric keyboard.
                                    LengthLimitingTextInputFormatter(6),      //only 6 digit

                                  ],
                                  controller: dataControl9..text = datatest['SALT'].toString().replaceAll('O','0'),
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
                                  keyboardType: TextInputType.number,
                                  inputFormatters:[                        //only numeric keyboard.
                                    LengthLimitingTextInputFormatter(5),      //only 6 digit

                                  ],
                                  controller: dataControl10..text = datatest['PHOSPHATE'].toString().replaceAll('O','0'),
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
                                    InsertMethod().catchError(
                                            (error) => {print(error),
                                          // showAlertDialog(context)
                                          DialogHelper.exit(context),
                                          // Navigator.of(context).pop(),
                                        }
                                    );
                                    // await writeOnPdf();
                                    // await savePdf();

                                    Directory documentDirectory = await getApplicationDocumentsDirectory();

                                    String documentPath = documentDirectory.path;

                                    String fullPath = "$documentPath/example.pdf";
                                    // if all are valid then go to success screen
                                    // Navigator.pushNamed(context, QualityPageScreen.routeName);
                                    // Navigator.of(context).pop();
                                    Navigator.of(context).pushNamed( PoolInformationScreen.routeName,arguments: PoolInformationDetailsArguments(product: null),);


                                  },
                                ),
                              ),
                              // ),
                              SizedBox(height: SizeConfig.screenHeight * 0.04),

                            ],
                          ),
                        ),
                      ),
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 0 ?
                    StepState.complete : StepState.disabled,
                  ),
                  Step(
                    title: new Text('Pool data'),
                    content: Column(
                      children: <Widget>[

                      ],
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 1 ?
                    StepState.complete : StepState.disabled,
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step){
    setState(() => _currentStep = step);
  }

  continued(){
    _currentStep < 2 ?
    setState(() => _currentStep += 1): null;
  }
  cancel(){
    _currentStep > 0 ?
    setState(() => _currentStep -= 1) : null;
  }
}
