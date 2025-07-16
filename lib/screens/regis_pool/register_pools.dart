import 'dart:io';

import 'package:JDPoolsApplication/screens/pool_list/models/Cart.dart';
import 'package:JDPoolsApplication/screens/pool_list/pool_list_screen.dart';
import 'package:JDPoolsApplication/screens/pool_list/components/body.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:JDPoolsApplication/constants.dart';
import 'package:JDPoolsApplication/size_config.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import "package:async/async.dart";

import 'package:JDPoolsApplication/components/default_button.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'dart:math';
import 'package:flutter_session/flutter_session.dart';
class registerPool extends StatefulWidget {
  const registerPool({
    Key key,
    @required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  _registerPool createState() => _registerPool();
}

class _registerPool extends State<registerPool> {
  var valuedata;
  var userId;
  TextEditingController _dropDownValue,_dropDownValue2;
  File _image;
  bool remember = false;
  String senddata;
  TextEditingController myController,myController1,myController2,myControllerName,myControllerId;

  String get pool_width => myController.text;
  String get pool_length => myController1.text;
  String get pool_depth => myController2.text;
  String get pool_name => myControllerName.text;
  String get pool_id => myControllerId.text;
  String get pool_type => _dropDownValue.text;
  String get pool_chemical => _dropDownValue2.text;
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
    if(widget.cart != null){
      print(widget.cart.product.images[0].toString());
      if(widget.cart.product.images[0].toString() == ""){
        _image = null;
      }else{
        urlToFile("http://jdpoolswebservice.com/spintest/"+widget.cart.product.images[0].toString());
      }

      myControllerId = TextEditingController()..text = widget.cart.product.id.toString();
      myControllerName = TextEditingController()..text = widget.cart.product.title.toString();
      myController = TextEditingController()..text = widget.cart.product.width.toString();
      myController1 = TextEditingController()..text = widget.cart.product.height.toString();
      myController2 = TextEditingController()..text = widget.cart.product.depth.toString();
      _dropDownValue = TextEditingController()..text = widget.cart.product.type.toString();
      _dropDownValue2 = TextEditingController()..text = widget.cart.product.chemical.toString();
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
  InsertMethod()async{
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
    String Url = "http://jdpoolswebservice.com/spintest/add_update_pool.php";
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
      senddata = "Image Uploaded";
      print(senddata);
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
  // void initState() {
  //   // _imgFromGallery();
  //
  // }

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
    if(myControllerId != null) {
      return Scaffold(
        appBar: AppBar(),
        body:
        SafeArea(
          child: SizedBox(
            width: double.infinity,

            child: SingleChildScrollView(

              child: Column(
                children: <Widget>[
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    color: kPrimaryColorGreen, //define the background color
                    child: Text("Pool Information", style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                  ),


                  Column(
                    children: [
                      SizedBox(height: SizeConfig.screenHeight * 0.02),
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
                      SizedBox(height: SizeConfig.screenHeight * 0.02),

                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(20)),
                        child: Row(
                          children: [
                            // buildEmailFormField(),
                            Text(
                                'Pool name', style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)

                            ),
                            Text(
                                '*', style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold)

                            ),
                            SizedBox(width: getProportionateScreenWidth(10)),
                            Container(
                              child: new Flexible(
                                child: TextField(
                                  controller: myControllerName,
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
                            SizedBox(width: getProportionateScreenWidth(10)),

                          ],
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(20)),
                        child: Row(

                          children: [
                            // buildEmailFormField(),
                            Text(
                              'Width', style: TextStyle(color: Colors.black,
                              fontWeight: FontWeight.bold,),

                            ),
                            Text(
                                '*', style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold)

                            ),
                            SizedBox(width: getProportionateScreenWidth(20)),
                            Container(
                              child: new Flexible(
                                child: TextField(
                                  controller: myController,
                                  keyboardType: TextInputType.number,
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
                            SizedBox(width: getProportionateScreenWidth(20)),
                            Text(
                                'm.', style: TextStyle(color: Colors.black,
                                fontWeight: FontWeight.bold)

                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      // buildPasswordFormField(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(15)),
                        child: Row(
                          children: [
                            // buildEmailFormField(),
                            Text(
                                'Length', style: TextStyle(color: Colors.black,
                                fontWeight: FontWeight.bold)

                            ),
                            Text(
                                '*', style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold)

                            ),
                            SizedBox(width: getProportionateScreenWidth(20)),
                            Container(
                              child: new Flexible(
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  controller: myController1,
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
                            SizedBox(width: getProportionateScreenWidth(20)),
                            Text(
                                'm.', style: TextStyle(color: Colors.black,
                                fontWeight: FontWeight.bold)

                            ),

                            SizedBox(width: getProportionateScreenWidth(5)),
                          ],
                        ),
                      ),
                      SizedBox(height: getProportionateScreenHeight(10)),
                      // buildConformPassFormField(),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: getProportionateScreenWidth(20)),
                        child: Row(
                          children: [
                            // buildEmailFormField(),
                            Text(
                                'Depth', style: TextStyle(color: Colors.black,
                                fontWeight: FontWeight.bold)

                            ),
                            Text(
                                '*', style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold)

                            ),
                            SizedBox(width: getProportionateScreenWidth(20)),
                            Container(
                              child: new Flexible(
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  controller: myController2,
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
                            SizedBox(width: getProportionateScreenWidth(20)),
                            Text(
                                'm.', style: TextStyle(color: Colors.black,
                                fontWeight: FontWeight.bold)

                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: getProportionateScreenHeight(10)),
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
                    ],

                  ),

                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    color: kPrimaryColorGreen, //define the background color
                    child: Text("Pool Type", style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20)),

                    child: new Container(
                        padding: EdgeInsets.only(
                            top: 20.0, left: 20.0, right: 20.0),
                        child: Scrollbar(
                            child: SingleChildScrollView(
                              child: DropdownButton(
                                hint: _dropDownValue.text == null ||_dropDownValue.text == "" ||_dropDownValue.text == "Public Pool"
                                    ? Text('Public Pool')
                                    : Text(
                                  _dropDownValue.text,
                                  style: TextStyle(color: Colors.blue),
                                ),
                                isExpanded: true,
                                iconSize: 30.0,
                                style: TextStyle(color: Colors.blue),
                                items: ['Public Pool', 'Domestic Pool'].map(
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

                  SizedBox(height: getProportionateScreenHeight(10)),
                  Container(
                    width: double.maxFinite,
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                    color: kPrimaryColorGreen, //define the background color
                    child: Text("Chemical", style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
                  ),

                  SizedBox(height: SizeConfig.screenHeight * 0.02),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20)),
                    child: Column(
                      children: [
                        new Container(
                            padding: EdgeInsets.only(
                                top: 20.0, left: 20.0, right: 20.0),
                            child: Scrollbar(
                                child: SingleChildScrollView(
                                  child: DropdownButton(
                                    hint: _dropDownValue2.text == null ||_dropDownValue2.text == "" ||_dropDownValue2.text == "Mannual - CL pool"
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


                        SizedBox(height: getProportionateScreenHeight(10)),
                      ],

                    ),
                  ),

                  new Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(20)),
                    child: DefaultButton(
                      text: "Submit",
                      press: () {
                        InsertMethod();
                        // if all are valid then go to success screen
                        // Navigator.pushNamed(context, QualityPageScreen.routeName);
                        // Navigator.of(context).pushNamedAndRemoveUntil( QualityPageScreen.routeName, (Route<dynamic> route) => false,arguments: PoolDataDetailsArguments(value:senddata));
                        // Navigator.of(context).pop();
                        // Navigator.pushNamed( context,PoolListScreen.routeName);
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => PoolListScreen()));
                        // Navigator.of(context).pushNamedAndRemoveUntil( PoolListScreen.routeName, (Route<dynamic> route) => false);

                      },
                    ),
                  ),

                  SizedBox(height: getProportionateScreenHeight(10)),
                ],

              ),
            ),
          ),

        ),
      );
    }else{
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
  }
}