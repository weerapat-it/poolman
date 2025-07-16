import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:JDPoolsApplication/helper/dialog_helper.dart';
import '../constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../size_config.dart';
import 'dart:io';
import 'package:JDPoolsApplication/screens/pool_information/components/pool_design_card.dart';
import 'package:JDPoolsApplication/screens/pool_information/models/Product.dart';

import '../../../size_config.dart';
import 'package:JDPoolsApplication/screens/pool_information/components/section_title.dart';

import 'package:flutter_session/flutter_session.dart';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/components/custom_surfix_icon.dart';
import 'package:JDPoolsApplication/components/default_button.dart';
import 'package:JDPoolsApplication/components/form_error.dart';
import 'package:JDPoolsApplication/screens/complete_profile/complete_profile_screen.dart';
import 'package:path_provider/path_provider.dart';
import '../../../screens/bloc/bloc.dart';
import '../../../screens/page/Gmap_page.dart';
import '../../../screens/page/main_gmap.dart';
import 'package:JDPoolsApplication/helper/keyboard.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

import "package:async/async.dart";
import 'package:image_picker/image_picker.dart';
import 'package:JDPoolsApplication/screens/quality_page/quality_page_screen.dart';
import 'package:JDPoolsApplication/screens/pool_information/models/Product.dart';

import 'package:path/path.dart';
import 'package:flutter_session/flutter_session.dart';

class StepperDemo extends StatefulWidget {
  static String routeName = "/step";
  final Product product;

  const StepperDemo({Key key, @required this.product}) : super(key: key);

  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.vertical;
  var userId;
  var arr,arr1,arr2,arr3,arr4,arr5,arr6,arr7,arr8,arr9,arr10,arr11  = "";

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
  List poolList = [];

  getListImage() async {

    userId = "${await FlutterSession().get("userId")}";
    var url = Uri.https('jdpoolswebservice.com', '/spintest/poolList.php', {'q': '{http}'});
    // String Url = "http://jdpoolswebservice.com/spintest/poolList.php";
    var res = await http.post(
        url, headers: {"Accept": "application/json"},
        body: {
          // "customer":_dropDownValue,
          "userid":userId,
        }
    );
    var resBody = json.decode(res.body);
    setState(() {
      poolList = resBody;

    });
    print(poolList);
    if(poolList != null) {
      demoProducts = <Product>[
        for(int x = 0; x < poolList.length; x++)


          Product(
            id: int.parse(poolList[x]["pool_Data_Id"]),
            images: [
              poolList[x]["pool_Data_Pic"],
            ],

            title: poolList[x]["pool_Data_Name"],
            width: double.parse(poolList[x]["pool_Data_Width"]),
            height: double.parse(poolList[x]["pool_Data_Height"]),
            depth: double.parse(poolList[x]["pool_Data_Depth"]),
            type: poolList[x]["pool_Data_Type"],
            chemical: poolList[x]["pool_Data_Chemical"],

          ),

      ];
    }
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

  final _formKey = GlobalKey<FormState>();
  String width,Depth,length;
  String password;
  String conform_password;
  TextEditingController _dropDownValue,_dropDownValue2;
  bool remember = false;
  BuildContext _context;
  String senddata;
  TextEditingController myController,myController1,myController2,myControllerName,myControllerId;
  File _image;
  String get pool_width => myController.text.toString();
  String get pool_length => myController1.text.toString();
  String get pool_depth => myController2.text.toString();
  String get pool_name => myControllerName.text.toString();
  String get pool_id => myControllerId.text.toString();
  String get pool_type => _dropDownValue.text.toString();
  String get pool_chemical => _dropDownValue2.text.toString();
  String spcace = "";
  final List<String> errors = [];
  urlToFile(String imageUrl) async {
// generate random number.
    var rng = new Random();
// get temporary directory of device.
    Directory tempDir = await getTemporaryDirectory();
// get temporary path from temporary directory.
    String tempPath = tempDir.path;
// create a new file in temporary path with random file name.
    _image = new File('$tempPath'+ (rng.nextInt(100)).toString() +'.png');
// call http.get method and pass imageUrl into it to get response.
    http.Response response = await http.get(Uri.parse(imageUrl));
// write bodyBytes received in response to file.
    await _image.writeAsBytes(response.bodyBytes);
// now return the file which is created with random name in
// temporary directory and image bytes from response is written to // that file.
//     return _image;
    setState(() {
      _image = _image;
    });
  }
  void initState() {
    getListImage();
    if(widget.product != null){
      print(widget.product.images[0].toString());
      if(widget.product.images[0].toString() == ""){
        _image = null;
      }else{
        urlToFile("http://jdpoolswebservice.com/spintest/"+widget.product.images[0].toString());
      }
      myControllerId = TextEditingController()..text = widget.product.id.toString();
      myControllerName = TextEditingController()..text = widget.product.title.toString();
      myController = TextEditingController()..text = widget.product.width.toString();
      myController1 = TextEditingController()..text = widget.product.height.toString();
      myController2 = TextEditingController()..text = widget.product.depth.toString();

      _dropDownValue = TextEditingController()..text = widget.product.type.toString();
      _dropDownValue2 = TextEditingController()..text = widget.product.chemical.toString();
    }else{
      myControllerId = TextEditingController()..text = "0";
      myControllerName = TextEditingController()..text = "";
      myController = TextEditingController()..text = "";
      myController1 = TextEditingController()..text = "";
      myController2 = TextEditingController()..text = "";

      _dropDownValue = TextEditingController()..text = "Public Pool";
      _dropDownValue2 = TextEditingController()..text = "Mannual - CL pool";
      _image = null;
    }
    super.initState();

  }
  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }
  InsertMethodPool()async{
    userId = "${await FlutterSession().get("userId")}";
    if(_dropDownValue == null){
      _dropDownValue.text = spcace;
    }else{
      _dropDownValue = _dropDownValue;
    }
    if(_dropDownValue2 == null){
      _dropDownValue2.text = spcace;
    }else{
      _dropDownValue2 = _dropDownValue2;
    }
    userId = "${await FlutterSession().get("userId")}";

    // List<int> imageBytes = _image.readAsBytesSync();
    String Url = "http://jdpoolswebservice.com/spintest/check_update_pool.php";
    var request = new http.MultipartRequest("POST", Uri.parse(Url));
    if(_image == null){
      // request.files.add(" ");
    }else {
      var stream = new http.ByteStream(
          DelegatingStream.typed(_image.openRead()));
      var length = await _image.length();
      var multipartFile = new http.MultipartFile(
          "image", stream, length, filename: basename(_image.path));

      request.files.add(multipartFile);
    }
    request.fields['userid'] = userId;
    request.fields['pool_id'] = pool_id;
    request.fields['pool_name'] = pool_name;
    request.fields['pool_width'] = pool_width;
    request.fields['pool_length'] = pool_length;
    request.fields['pool_depth'] = pool_depth;
    request.fields['pool_type'] = pool_type;
    request.fields['pool_chemical'] = pool_chemical;
    // var res = await http.post(Uri.encodeFull(Url),headers:{"Accept" : "application/json"},
    //     body: {
    //       // "customer":_dropDownValue,
    //       "userid":userId,
    //       "pool_id" : pool_id,
    //       "pool_name" : pool_name,
    //       "pool_width" : pool_width,
    //       "pool_length" : pool_length,
    //       "pool_depth" : pool_depth,
    //       "pool_type" : pool_type,
    //       "pool_chemical" : pool_chemical,
    //       "pool_img" : _image != null ? base64Encode(imageBytes) : '',
    //     }
    // );
    // var resBody = json.decode(res.body);
    // senddata = resBody;
    // print(senddata);
    var respond = await request.send();
    if(respond.statusCode==200){
      // senddata = "Image Uploaded";
      respond.stream.transform(utf8.decoder).listen((value) {
        var resBody = json.decode(value);
        senddata = resBody;
        print(senddata);
        // Navigator.of(this.context).pushNamedAndRemoveUntil( QualityPageScreen.routeName, (Route<dynamic> route) => false,arguments: PoolDataDetailsArguments(value:senddata));

      });

    }else{
      senddata = "Upload Failed";
      print(senddata);
    }
    // String Url = "http://jdpoolswebservice.com/spintest/check_update_pool.php";
    // var res = await http.post(Uri.encodeFull(Url),headers:{"Accept" : "application/json"},
    //     body: {
    //       // "customer":_dropDownValue,
    //       "userid":userId,
    //       "pool_id" : pool_id,
    //       "pool_name" : pool_name,
    //       "pool_width" : pool_width,
    //       "pool_length" : pool_length,
    //       "pool_depth" : pool_depth,
    //       "pool_type" : pool_type,
    //       "pool_chemical" : pool_chemical,
    //
    //     }
    // );
    // var resBody = json.decode(res.body);
    // senddata = resBody;
    // print(senddata);
    // Navigator.of(context).pushNamedAndRemoveUntil( QualityPageScreen.routeName, (Route<dynamic> route) => false,arguments: PoolDataDetailsArguments(value:senddata));

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
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
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

  @override
  Widget build(BuildContext context) {
    return  Container(
        color: kwhite,
        child: Scaffold(
        appBar: buildAppBar(context),
    backgroundColor: kwhite,
      body:  Container(
        child: Column(
          children: [
            Expanded(
              child: Stepper(
                type: StepperType.horizontal,
                physics: ScrollPhysics(),
                currentStep: _currentStep,
                onStepTapped: (step) => tapped(step),
                onStepContinue:  continued,
                onStepCancel: cancel,
                controlsBuilder: (BuildContext context,ControlsDetails controls){
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0,right: 20.0,top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                      if(_currentStep >= 1)
                        SizedBox(height: 50.0,

                          child:FlatButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                            color: kPrimaryColor2,
                            child: Text("Back",style: TextStyle(color: Colors.white),),
                            onPressed: controls.onStepCancel,
                          ),
                      ),
                          if(_currentStep == 0)
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: SizedBox(height: 50.0,

                                child: FlatButton(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  color: kPrimaryColor2,
                                  child: Text("Next",style: TextStyle(color: Colors.white),),
                                  onPressed: () async {
                                    // getCurrentLocation();
                                    InsertMethod().catchError(
                                            (error) =>
                                        {print(error),
                                          // showAlertDialog(context)
                                          DialogHelper.exit(context),
                                          // Navigator.of(context).pop(),
                                        }
                                    );
                                    controls.onStepContinue();
                                  }
                                ),
                              ),
                            ),
                          if(_currentStep == 1)
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: SizedBox(height: 50.0,

                              child: FlatButton(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                color: kPrimaryColor2,
                                child: Text("Next",style: TextStyle(color: Colors.white),),
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    _formKey.currentState.save();
                                    KeyboardUtil.hideKeyboard(context);
                                    InsertMethodPool();
                                    controls.onStepContinue();
                                  }

                                },
                              ),
                            ),
                          ),
                          if(_currentStep == 2)
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: SizedBox(height: 50.0,

                                child: FlatButton(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                  color: kPrimaryColor2,
                                  child: Text("Submit",style: TextStyle(color: Colors.white),),
                                  onPressed:  () {
                                    if (_formKey.currentState.validate()) {
                                      _formKey.currentState.save();
                                      KeyboardUtil.hideKeyboard(context);
                                      InsertMethodPool();
                                    }

                                  },
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                },
                steps: <Step>[
                  Step(
                    title: new Text('Data'),
                    content:
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0,right: 20.0),
                      child: Container(
                        width: double.infinity,
                        child: new SingleChildScrollView(
                          child:Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(

                                controller: dataControl..text = arr1,
                                keyboardType: TextInputType.number,
                                inputFormatters:[                        //only numeric keyboard.
                                  LengthLimitingTextInputFormatter(5),      //only 6 digit

                                ],
                                decoration: const InputDecoration(

                                  labelText: 'FCL',
                                ),
                                // initialValue: _result,

                              ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                                controller: dataControl1..text = arr2,
                                keyboardType: TextInputType.number,
                                inputFormatters:[                        //only numeric keyboard.
                                  LengthLimitingTextInputFormatter(5),      //only 6 digit

                                ],
                                decoration: const InputDecoration(
                                  labelText: 'TCL',
                                ),
                                // initialValue: _result,

                              ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                                controller: dataControl2..text = arr3,
                                keyboardType: TextInputType.number,
                                inputFormatters:[                        //only numeric keyboard.
                                  LengthLimitingTextInputFormatter(5),      //only 6 digit

                                ],
                                decoration: const InputDecoration(
                                  labelText: 'CCL',
                                ),
                                // initialValue: _result,

                              ),
                          ),

                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: TextField(
                                controller: dataControl3..text = arr4,
                                keyboardType: TextInputType.number,
                                inputFormatters:[                        //only numeric keyboard.
                                  LengthLimitingTextInputFormatter(5),      //only 6 digit

                                ],
                                decoration: const InputDecoration(
                                  labelText: 'HARD',
                                ),
                                // initialValue: _result,
                              ),
                         ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                                controller: dataControl4..text = arr5,
                                keyboardType: TextInputType.number,
                                inputFormatters:[                        //only numeric keyboard.
                                  LengthLimitingTextInputFormatter(5),      //only 6 digit

                                ],
                                decoration: const InputDecoration(
                                  labelText: 'CYA',
                                ),
                                // initialValue: _result,

                              ),
                          ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
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

                         Padding(
                           padding: const EdgeInsets.all(8.0),
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

                        Padding(
                          padding: const EdgeInsets.all(8.0),
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

                         Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: TextField(
                                controller: dataControl8..text = arr9,
                                keyboardType: TextInputType.number,
                                inputFormatters:[                        //only numeric keyboard.
                                  LengthLimitingTextInputFormatter(5),      //only 6 digit

                                ],
                                decoration: const InputDecoration(
                                  labelText: 'ALK',
                                ),
                                // initialValue: _result,

                              ),
                         ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
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

                         Padding(
                           padding: const EdgeInsets.all(8.0),
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
                    title: new Text('Pool'),
                    content:  Container(
                      width: double.infinity,
                      child: new SingleChildScrollView(
                        child:Column(
                          children: <Widget>[
                            // PoolData(),

                                  if(poolList != null)
                                    Column(
                                        children: [
                                    Padding(
                                    padding:
                                    EdgeInsets.symmetric(horizontal: 20),

                            child:Text(
                              "My pools",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                    ),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        ...List.generate(
                                          demoProducts.length,
                                              (index) {
                                            if (demoProducts[index] != null)
                                              return Padding(
                                                padding: const EdgeInsets.only(left: 10.0,bottom: 10.0,top: 10.0),
                                                // child: PoolDesignCard(product: demoProducts[index]),
                                              );

                                            return SizedBox
                                                .shrink(); // here by default width and height is 0
                                          },
                                        ),

                                      ],
                                    ),
                                  ),
                                ]




                            ),


                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("No Pool")
                                ],
                              ),
                            ),

                            Container(
                              width: double.maxFinite,
                              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                              color: kPrimaryColorGreen, //define the background color
                              child: Text("Pool Information",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                            ),

                            if(myControllerId != null)
                              Form(
                                key: _formKey,

                                child: Column(
                                  children: [
                                    Center(

                                      child: GestureDetector(
                                        onTap: () {
                                          // _imgFromGallery();
                                          _showPicker(context);
                                        },
                                        child: new Container(
                                          child: SizedBox(
                                            height: 200,
                                            width: 200,
                                            child: CircleAvatar(
                                              backgroundColor: Colors.grey[800],


                                              child: _image != null
                                                  ? ClipRRect(
                                                borderRadius: BorderRadius.circular(100),
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
                                                  fit: BoxFit.fitHeight,

                                                ),
                                              )
                                                  : Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius: BorderRadius.circular(100)),
                                                width: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .width,
                                                height: MediaQuery
                                                    .of(context)
                                                    .size
                                                    .height,
                                                child: Icon(
                                                  Icons.camera_alt,
                                                  color: Colors.grey[800],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),

                                      ),

                                    ),
                                    SizedBox(
                                      height: 20,
                                      width: 100,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        children: [
                                          // buildEmailFormField(),
                                          Text(
                                              'Pool name', style: TextStyle(
                                              color: Colors.black, fontWeight: FontWeight.bold)

                                          ),

                                          SizedBox(width: 10),
                                          Container(
                                            child: new Flexible(
                                              child: TextField(
                                                controller: myControllerName..text,
                                                decoration: InputDecoration(
                                                  hintText: "Pool name",
                                                  // If  you are using latest version of flutter then lable text and hint text shown like this
                                                  // if you r using flutter less then 1.20.* then maybe this is not working properly
                                                  // floatingLabelBehavior: FloatingLabelBehavior.always,
                                                  // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
                                                ),
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(

                                        children: [
                                          // buildEmailFormField(),
                                          Text(
                                            'Width', style: TextStyle(
                                            color: Colors.black, fontWeight: FontWeight.bold,),

                                          ),
                                          Text(
                                              '*', style: TextStyle(
                                              color: Colors.red, fontWeight: FontWeight.bold)

                                          ),
                                          Container(
                                            child: new Flexible(
                                              child: TextFormField(
                                                // onSaved: (newValue) => width = newValue,
                                                onChanged: (value) {
                                                  if (value.isNotEmpty) {
                                                    removeError(error: "Input Width");
                                                    width = value;
                                                  }
                                                  return null;
                                                },
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    addError(error: "Input Width");
                                                    return "";
                                                  }
                                                  return null;
                                                },
                                                keyboardType: TextInputType.number,
                                                controller: myController..text,

                                                decoration: InputDecoration(
                                                  hintText: "width",
                                                  // If  you are using latest version of flutter then lable text and hint text shown like this
                                                  // if you r using flutter less then 1.20.* then maybe this is not working properly
                                                  // floatingLabelBehavior: FloatingLabelBehavior.always,
                                                  // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                              'm.', style: TextStyle(
                                              color: Colors.black, fontWeight: FontWeight.bold)

                                          ),
                                        ],
                                      ),
                                    ),
                                     // buildPasswordFormField(),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Row(
                                        children: [
                                          // buildEmailFormField(),
                                          Text(
                                              'Length', style: TextStyle(
                                              color: Colors.black, fontWeight: FontWeight.bold)

                                          ),
                                          Text(
                                              '*', style: TextStyle(
                                              color: Colors.red, fontWeight: FontWeight.bold)

                                          ),
                                          Container(
                                            child: new Flexible(
                                              child: TextFormField(
                                                onChanged: (value) {
                                                  if (value.isNotEmpty) {
                                                    removeError(error: "Input length");
                                                    length = value;
                                                  }
                                                  return null;
                                                },
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    addError(error: "Input length");
                                                    return "";
                                                  }
                                                  return null;
                                                },
                                                keyboardType: TextInputType.number,
                                                controller: myController1..text,
                                                decoration: InputDecoration(
                                                  hintText: "Length",
                                                  // If  you are using latest version of flutter then lable text and hint text shown like this
                                                  // if you r using flutter less then 1.20.* then maybe this is not working properly
                                                  // floatingLabelBehavior: FloatingLabelBehavior.always,
                                                  // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Text(
                                              'm.', style: TextStyle(
                                              color: Colors.black, fontWeight: FontWeight.bold)

                                          ),

                                       ],
                                      ),
                                    ),
                                    // buildConformPassFormField(),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Row(
                                        children: [
                                          // buildEmailFormField(),
                                          Text(
                                              'Depth', style: TextStyle(
                                              color: Colors.black, fontWeight: FontWeight.bold)

                                          ),
                                          Text(
                                              '*', style: TextStyle(
                                              color: Colors.red, fontWeight: FontWeight.bold)

                                          ),
                                          Container(
                                            child: new Flexible(
                                              child: TextFormField(
                                                onChanged: (value) {
                                                  if (value.isNotEmpty) {
                                                    removeError(error: "Input Depth");
                                                    Depth = value;
                                                  }
                                                  return null;
                                                },
                                                validator: (value) {
                                                  if (value.isEmpty) {
                                                    addError(error: "Input Depth");
                                                    return "";
                                                  }
                                                  return null;
                                                },
                                                keyboardType: TextInputType.number,
                                                controller: myController2..text,
                                                decoration: InputDecoration(
                                                  hintText: "Depth",
                                                  // If  you are using latest version of flutter then lable text and hint text shown like this
                                                  // if you r using flutter less then 1.20.* then maybe this is not working properly
                                                  // floatingLabelBehavior: FloatingLabelBehavior.always,
                                                  // suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
                                                ),
                                              ),
                                            ),
                                          ),
                                           Text(
                                              'm.', style: TextStyle(
                                              color: Colors.black, fontWeight: FontWeight.bold)

                                          ),
                                        ],
                                      ),
                                    ),

                                    // TextField(
                                    //   maxLines: 1,
                                    //   onTap: () {
                                    //     Navigator.pushNamed(context, MyAppGmap.routeName);
                                    //
                                    //   },
                                    //    decoration: InputDecoration(
                                    //       prefixIcon:Icon(Icons.map),
                                    //
                                    //       //hintText: 'CoNstr@seña',
                                    //       border:OutlineInputBorder(
                                    //           borderSide: BorderSide(
                                    //               color:Colors.white
                                    //           ),
                                    //           borderRadius: BorderRadius.circular(10)
                                    //       )
                                    //   ),
                                    // ),
                                    Container(
                                      width: double.maxFinite,
                                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                                      color: kPrimaryColorGreen, //define the background color
                                      child: Text("Pool Type", style: TextStyle(
                                          color: Colors.black, fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20),

                                      child: new Container(
                                          padding: EdgeInsets.only(
                                              top: 20.0, left: 20.0, right: 20.0),
                                          child: Scrollbar(
                                              child: SingleChildScrollView(
                                                child: DropdownButton(
                                                  hint: _dropDownValue.text == null || _dropDownValue.text == ""|| _dropDownValue.text == "Public Pool"
                                                      ? Text('Public Pool')
                                                      : Text(
                                                    _dropDownValue.text,
                                                    style: TextStyle(color: Colors.blue),
                                                  ),
                                                  isExpanded: true,
                                                  iconSize: 30.0,
                                                  style: TextStyle(color: Colors.blue),
                                                  items: ['Public Pool', 'Domistic Pool'].map(
                                                        (val) {
                                                      return DropdownMenuItem<String>(
                                                        value: val,
                                                        child: Text(val),
                                                      );
                                                    },
                                                  ).toList(),
                                                  onChanged: (val) {
                                                    setState(
                                                          () {
                                                        _dropDownValue.text = val;
                                                      },
                                                    );
                                                  },
                                                ),

                                              )
                                          )

                                      ),

                                    ),

                                    Container(
                                      width: double.maxFinite,
                                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                                      color: kPrimaryColorGreen, //define the background color
                                      child: Text("Chemical", style: TextStyle(
                                          color: Colors.black, fontWeight: FontWeight.bold)),
                                    ),

                                   Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Column(
                                        children: [
                                          new Container(
                                              padding: EdgeInsets.only(
                                                  top: 20.0, left: 20.0, right: 20.0),
                                              child: Scrollbar(
                                                  child: SingleChildScrollView(
                                                    child: DropdownButton(
                                                      hint: _dropDownValue2.text == null ||
                                                          _dropDownValue2.text == "" ||
                                                          _dropDownValue2.text == "Mannual - CL pool"
                                                          ? Text('Mannual - CL pool')
                                                          : Text(
                                                        _dropDownValue2.text,
                                                        style: TextStyle(color: Colors.blue),
                                                      ),
                                                      isExpanded: true,
                                                      iconSize: 30.0,
                                                      style: TextStyle(color: Colors.blue),
                                                      items: ['Mannual - CL pool','Electrolize + Ozone','Ironizer', 'Salt'].map(
                                                            (val) {
                                                          return DropdownMenuItem<String>(
                                                            value: val,
                                                            child: Text(val),
                                                          );
                                                        },
                                                      ).toList(),
                                                      onChanged: (val) {
                                                        setState(
                                                              () {
                                                            _dropDownValue2.text = val;
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  )
                                              )
                                          ),


                                        ],

                                      ),
                                    ),



                                 ],

                                ),

                              ),

                            // PoolInformationForm(product: product),
                      ],
                    ),
                      ),
                    ),
                    isActive: _currentStep >= 0,
                    state: _currentStep >= 1 ?
                    StepState.complete : StepState.disabled,
                  ),
                  Step(
                    title: new Text('Result'),
                    content: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Mobile Number'),
                        ),
                      ],
                    ),
                    isActive:_currentStep >= 0,
                    state: _currentStep >= 2 ?
                    StepState.complete : StepState.disabled,
                  ),
                ],
              ),
            ),
          ],
        ),
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
              "Testing water",style: TextStyle(color: kPrimaryColor)

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