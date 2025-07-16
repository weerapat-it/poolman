import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/components/custom_surfix_icon.dart';
import 'package:JDPoolsApplication/components/default_button.dart';
import 'package:JDPoolsApplication/components/form_error.dart';
import 'package:JDPoolsApplication/screens/otp/otp_screen.dart';
import '../../../screens/bloc/bloc.dart';
import '../../../screens/page/Gmap_page.dart';
import '../../../screens/page/main_gmap.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
<<<<<<< HEAD
import 'package:JDPoolsApplication/screens/edit_address/models/Cart.dart';
import 'package:JDPoolsApplication/screens/edit_address/models/Product.dart';
import 'package:JDPoolsApplication/screens/edit_address/components/edit_address_card.dart';
=======

>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
import 'package:flutter_session/flutter_session.dart';
import 'package:JDPoolsApplication/screens/sign_in/sign_in_screen.dart';
class EditForm extends StatefulWidget {
  static String routeName = "/edit_form";
  final String username;
  final String password;

  EditForm({Key key, @required this.username,@required this.password}) : super(key: key);
  @override
  _EditFormState createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
  final _formKey = GlobalKey<FormState>();
<<<<<<< HEAD
  var userId;
  List addressList = [];
=======
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
  final List<String> errors = [];
  String firstName;
  String lastName;
  String phoneNumber;
  String address;
  String address2;
<<<<<<< HEAD
  String tax = "";
  String data;
  TextEditingController myController,myController1,myController2,myController4;
  var txt = TextEditingController();
  var myController3 = TextEditingController();
  var Tax = TextEditingController() ;

=======
  String data;
  TextEditingController myController,myController1,myController2,myController3,myController4;
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc

  String get str_firstName => myController.text=  "${FlutterSession().get("userFirstname").toString()}";
  String get str_lastName => myController1.text=  "${FlutterSession().get("userLastname").toString()}";
  String get str_phoneNumber => myController2.text=  "${FlutterSession().get("userTel").toString()}";
<<<<<<< HEAD
  String get str_address => myController3.text.toString();
  String get str_Tax => Tax.text.toString();
  String get str_address2 => txt.text.toString();
  void initState() {
    // InsertMethod();
    getAddress();

    super.initState();

  }

  InsertMethod()async{
    // String Url = "http://jdpoolswebservice.com/spintest/getAddress.php";
    var url = Uri.https('jdpoolswebservice.com', '/spintest/getAddress.php', {'q': '{http}'});
    var res = await http.post(url,headers:{"Accept" : "application/json"},
        body: {
          "userid":"${await FlutterSession().get("userId")}",
          "address" : str_address,
          "address2" : str_address2,
          "taxid" : str_Tax,
        }
    );
    // var resBody = json.decode(res.body);
    // print(resBody);

=======
  String get str_address => myController3.text=  "${FlutterSession().get("userAddress").toString()}";
  var txt = TextEditingController();
  String get str_address2 => txt.text=  "${FlutterSession().get("userAddress2").toString()}";
  void initState() {
    // InsertMethod();
  }

  InsertMethod()async{
    String Url = "http://jdpoolswebservice.com/spintest/register.php";
    var res = await http.post(Uri.encodeFull(Url),headers:{"Accept" : "application/json"},
        body: {
          "id":"${await FlutterSession().get("userId")}",
          "username" : widget.username !=null?widget.username:"",
          "password" : widget.password !=null?widget.password:"",
          "firstName" : str_firstName,
          "lastName" : str_lastName,
          "phoneNumber" : str_phoneNumber,
          "address" : str_address,
          "address2" : str_address2,
        }
    );
    var resBody = json.decode(res.body);
    print(resBody);
    setState(() {
      // data = resBody;
    });
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
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
<<<<<<< HEAD
  getAddress() async {
    userId = "${await FlutterSession().get("userId")}";
    var url = Uri.https('jdpoolswebservice.com', '/spintest/getAddress.php', {'q': '{http}'});
    // String Url = "http://jdpoolswebservice.com/spintest/getAddress.php";
    var res = await http.post(
        url, headers: {"Accept": "application/json"},
        body: {
          "userid":userId,

        }
    );
    var resBody = json.decode(res.body);
    setState(() {
      addressList = resBody;
      if(addressList != null){
        myController3 = TextEditingController()..text = addressList[0]["user_Address1"] != null?addressList[0]["user_Address1"].toString():"";
        txt = TextEditingController()..text = addressList[0]["user_Address2"] != null?addressList[0]["user_Address2"].toString():"";
        Tax = TextEditingController()..text = addressList[0]["user_Tax"] != null?addressList[0]["user_Tax"].toString():"";

      }else{
        myController3 = TextEditingController()..text = "";
        txt = TextEditingController()..text = "";
        Tax = TextEditingController()..text = "";

      }
      // myController3 = TextEditingController()..text = addressList[0]["user_Address1"] != null?addressList[0]["user_Address1"].toString():"";
      // txt = TextEditingController()..text = addressList[0]["user_Address2"] != null?addressList[0]["user_Address2"].toString():"";

      // myController3..text = addressList[0]["user_address1"] != null?addressList[0]["user_address1"].toString():"";
      // txt..text = addressList[0]["user_address2"] != null?addressList[0]["user_address2"].toString():"";
    });
    print(addressList);
    if(addressList != null) {
      demoProductsAddress = <Product>[
        for(int x = 0; x < addressList.length; x++)


          Product(
            user_id: int.parse(addressList[x]["user_ID"].toString()),
            user_Firstname: addressList[x]["user_Firstname"].toString(),
             images: [
              "assets/icons/Location point.svg",
            ],
            user_Address1: addressList[x]["user_Address1"].toString(),
            user_Address2: addressList[x]["user_Address2"].toString(),
            user_Tax: addressList[x]["user_Tax"].toString(),
          ),

      ];
      demoCartsAddress = <Cart>[
        for(int y = 0; y < demoProductsAddress.length; y++)
          Cart(product: demoProductsAddress[y], numOfItem: 2),

      ];
    }
  }
=======

>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
<<<<<<< HEAD
          // buildFirstNameFormField(),
          // SizedBox(height: getProportionateScreenHeight(30)),
          // buildLastNameFormField(),
          // SizedBox(height: getProportionateScreenHeight(30)),
          // buildPhoneNumberFormField(),
          // SizedBox(height: getProportionateScreenHeight(30)),
          Container(
            height: 200,
            child: Padding(
              padding:
              EdgeInsets.all(1),
              child: ListView.builder(
                itemCount: demoCartsAddress.length,
                itemBuilder: (context, index) =>
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),

                      child: CartCard(cart: demoCartsAddress[index]),

                      // ),
                    ),

              ),

            ),
          ),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildTaxFormField(),
=======
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(30)),
          TextField(
            maxLines: 1,
            onTap: () async {
              final result2 = await  Navigator.pushNamed(context, MyAppGmap.routeName);
              txt.text = result2;
            },
            controller: txt,
            decoration: InputDecoration(
                prefixIcon:Icon(Icons.map),

                //hintText: 'CoNstr@seña',
                border:OutlineInputBorder(
                    borderSide: BorderSide(
                        color:Colors.white
                    ),
                    borderRadius: BorderRadius.circular(10)
                )
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "continue",
            press: () {
              if (_formKey.currentState.validate()) {
                InsertMethod();
<<<<<<< HEAD
                setState(() {
                  FlutterSession().set("userAddress","");
                  FlutterSession().set("userAddress2","");
                  FlutterSession().set("taxId","");
                  FlutterSession().set("userAddress",str_address.toString());
                  FlutterSession().set("userAddress2",str_address2.toString());
                  FlutterSession().set("taxId",str_Tax.toString());
                  // data = resBody;
                });
                // Navigator.pop(context);
                Navigator.pop(context, "1");
                // Navigator.pushNamed(context, SignInScreen.routeName);
=======

                Navigator.pushNamed(context, SignInScreen.routeName);
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
                // Navigator.pushNamed(context, OtpScreen.routeName,arguments: OtpScreenArguments(otp:phoneNumber));
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
<<<<<<< HEAD
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          address = value;
=======
      controller: myController3,
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          myController3.text = value;
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
          removeError(error: kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
<<<<<<< HEAD
      controller: myController3..text,

      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Enter your address",
=======
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Enter your phone address",
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
        CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }
<<<<<<< HEAD
  TextFormField buildTaxFormField() {
    return TextFormField(
      onSaved: (newValue) => tax = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          tax = value;
          removeError(error: kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      controller: Tax..text,

      decoration: InputDecoration(
        labelText: "Tax id",
        hintText: "Enter your Tax id",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,

      ),
    );
  }
=======

>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      controller: myController2,
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          myController2.text = value;
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      controller: myController1,
      onSaved: (newValue) => lastName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          myController1.text = value;

        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      controller: myController,
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          myController.text = value;
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
