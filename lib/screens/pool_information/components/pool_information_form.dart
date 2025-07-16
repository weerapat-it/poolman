import 'dart:io';
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
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:JDPoolsApplication/screens/quality_page/quality_page_screen.dart';
import 'package:JDPoolsApplication/screens/pool_information/models/Product.dart';

import 'package:path/path.dart';
import 'package:flutter_session/flutter_session.dart';
class PoolInformationForm extends StatefulWidget {

  const PoolInformationForm({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  _PoolInformationFormState createState() => _PoolInformationFormState();

}

class _PoolInformationFormState extends State<PoolInformationForm> {
  var userId;
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
  InsertMethod()async{
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
    var url = Uri.https('jdpoolswebservice.com', '/spintest/check_update_pool.php', {'q': '{http}'});
    // String Url = "http://jdpoolswebservice.com/spintest/check_update_pool.php";
    var request = new http.MultipartRequest("POST", url);
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
    print(respond.statusCode);
    if(respond.statusCode==200){
      // senddata = "Image Uploaded";
      respond.stream.transform(utf8.decoder).listen((value) {
        var resBody = json.decode(value);
        senddata = resBody;
        print(senddata);
        Navigator.of(this.context).pushNamedAndRemoveUntil( QualityPageScreen.routeName, (Route<dynamic> route) => false,arguments: PoolDataDetailsArguments(value:senddata));
        // Navigator.of(this.context).pushNamed( QualityPageScreen.routeName,arguments: PoolDataDetailsArguments(value: senddata),);

      });

    }else{
      senddata = "Upload Failed";
      print(senddata);
      print(pool_id);

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
    // if(widget.product != null){
    //   myControllerId = TextEditingController()..text = widget.product.id.toString();
    //   myControllerName = TextEditingController()..text = widget.product.title.toString();
    //   myController = TextEditingController()..text = widget.product.width.toString();
    //   myController1 = TextEditingController()..text = widget.product.height.toString();
    //   myController2 = TextEditingController()..text = widget.product.depth.toString();
    //
    //   _dropDownValue = TextEditingController()..text = widget.product.type.toString();
    //   _dropDownValue2 = TextEditingController()..text = widget.product.chemical.toString();
    // }else{
    //    myControllerId = TextEditingController()..text = "0";
    //    myControllerName = TextEditingController()..text = "";
    //    myController = TextEditingController()..text = "";
    //    myController1 = TextEditingController()..text = "";
    //    myController2 = TextEditingController()..text = "";
    //
    //    _dropDownValue = TextEditingController()..text = "";
    //    _dropDownValue2 = TextEditingController()..text = "";
    // }
    if(myControllerId != null) {
      return Form(
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
                  horizontal: getProportionateScreenWidth(20)),
              child: Row(
                children: [
                  // buildEmailFormField(),
                  Text(
                      'Pool name', style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)

                  ),

                  SizedBox(width: getProportionateScreenWidth(10)),
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
                    'Width', style: TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold,),

                  ),
                  Text(
                      '*', style: TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold)

                  ),
                  SizedBox(width: getProportionateScreenWidth(20)),
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
                  SizedBox(width: getProportionateScreenWidth(20)),
                  Text(
                      'm.', style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)

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
                      'Length', style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)

                  ),
                  Text(
                      '*', style: TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold)

                  ),
                  SizedBox(width: getProportionateScreenWidth(20)),
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
                  SizedBox(width: getProportionateScreenWidth(20)),
                  Text(
                      'm.', style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)

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
                      'Depth', style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)

                  ),
                  Text(
                      '*', style: TextStyle(
                      color: Colors.red, fontWeight: FontWeight.bold)

                  ),
                  SizedBox(width: getProportionateScreenWidth(20)),
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
                  SizedBox(width: getProportionateScreenWidth(20)),
                  Text(
                      'm.', style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold)

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
                          hint: _dropDownValue.text == null || _dropDownValue.text == ""|| _dropDownValue.text == "Public Pool"
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


                  SizedBox(height: getProportionateScreenHeight(10)),
                ],

              ),
            ),
            SizedBox(height: getProportionateScreenHeight(20)),

            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(20)),
              child: DefaultButton(
                text: "Submit",
                press: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  KeyboardUtil.hideKeyboard(context);
                  InsertMethod();
                }
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
