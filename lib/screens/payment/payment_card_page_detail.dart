import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:JDPoolsApplication/logic/bloc/credit_card_bloc.dart';
import 'package:JDPoolsApplication/widgets/profile_tile.dart';
import 'package:JDPoolsApplication/utils/uidata.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:JDPoolsApplication/screens/payment/payment_success_page.dart';

import 'package:JDPoolsApplication/screens/edit_address/edit_address_screen.dart';
import 'package:JDPoolsApplication/screens/history_payment/history_payment_screen.dart';
import 'package:intl/intl.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:JDPoolsApplication/models/Cart.dart';

import 'package:JDPoolsApplication/models/Product.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../size_config.dart';
import 'package:JDPoolsApplication/screens/payment/components/cart_card.dart';

import 'package:JDPoolsApplication/screens/cart/cart_screen.dart';
import 'package:flutter_session/flutter_session.dart';
import 'dart:math' as math;
class paymentDetailPage extends StatefulWidget {
  static String routeName = "/payment_detail";
  final String voucher;
  final String payment;
  final String status;

  const paymentDetailPage({Key key, @required this.voucher, @required this.payment, @required this.status}) : super(key: key);
  @override
  _paymentDetailPageState createState() => _paymentDetailPageState();
}

class _paymentDetailPageState extends State<paymentDetailPage> {
  bool isDataAvailable = true;
  bool _checkbox = false;
  var userId,address,address2,userPic,userTax="";
  String result;
  void initState() {
    if(demoProducts != null) {
      demoProducts.clear();
    }
    if(demoCarts != null) {
      demoCarts.clear();
    }
    // getListImage();
    _getThingsOnStartup().then((value){
      getListImage();
    });
    super.initState();
  }
  List productList = [];

  List productListId = [];

  List productListQty = [];
  int total = 0;
  getListImage() async {
    userId = "${await FlutterSession().get("userId")}";
    address = "${await FlutterSession().get("userAddress")}";
    address2 = "${await FlutterSession().get("userAddress2")}";
    userPic = "${await FlutterSession().get("userPic")}";
    userTax = "${await FlutterSession().get("taxId")}";
    var url = Uri.https('jdpoolswebservice.com', '/spintest/cartHistory.php', {'q': '{http}'});
    // String Url = "http://jdpoolswebservice.com/spintest/cartHistory.php";
    var res = await http.post(
        url, headers: {"Accept": "application/json"},
        body: {
          "id":userId,
          "payment_Id":widget.payment != null && widget.payment != "null" ? widget.payment.toString():"0",
        }
    );
    var resBody = json.decode(res.body);

    setState(() {


      // if(productList != null) {
      //   productList.clear();
      // }
      productList = resBody;
    if(productList[0]["payment_receipt"] == "1"){
      _checkbox = true;
    }else{
      _checkbox = false;
    }
    });

    print(productList);
    if(productList != null) {
      for (int a = 0; a < productList.length; a++) {
        total = total + (int.parse(productList[a]["product_Price"]) * int.parse(productList[a]["qty"]) );
        productListId.add(productList[a]["product_ID"].toString());
        productListQty.add(productList[a]["qty"].toString());
      }
      demoProducts = <Product>[
        for(int x = 0; x < productList.length; x++)


          Product(
            id: int.parse(productList[x]["product_ID"]),
            product_id: int.parse('0'),
            images: [
              productList[x]["product_Pic1"],
              productList[x]["product_Pic2"],
              productList[x]["product_Pic3"],
              productList[x]["product_Pic4"],
            ],

            title: productList[x]["product_Name"],
            price: int.parse(productList[x]["product_Price"]),
            description: productList[x]["product_Detail"],

          ),

      ];
      demoCarts = <Cart>[
        for(int y = 0; y < demoProducts.length; y++)
          Cart(product: demoProducts[y],
              numOfItem: int.parse(productList[y]["qty"])),

      ];
    }
  }
  postToHistoryPayment() async {
    var url = Uri.https('jdpoolswebservice.com', '/spintest/addPayment.php', {'q': '{http}'});
    // String Url = "http://jdpoolswebservice.com/spintest/addPayment.php";
    var res = await http.post(
        url, headers: {"Accept": "application/json"},
        body: {
          "userid": userId,
          "price": total.toString(),
          "voucher_Id": widget.voucher != null && widget.voucher != "null" ? widget.voucher.toString():"0",
          "payment_Id": widget.payment != null && widget.payment != "null" ? widget.payment.toString():"0",
          "productList" : productListId.toString(),
          "productListQty" : productListQty.toString(),
          "receipt" : _checkbox.toString(),
        }
    );
    var resBody = json.decode(res.body);
    print(resBody);
  }
  BuildContext _context;
  CreditCardBloc cardBloc;

  MaskedTextController ccMask =
      MaskedTextController(mask: "0000 0000 0000 0000");
  MaskedTextController expMask = MaskedTextController(mask: "00/00");
  Widget bodyData() => SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(_context).size.width,
          height: MediaQuery.of(_context).size.height,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Text("Delivery address",style: TextStyle( color: Colors.black), maxLines: 3),
              ),
              creditCardWidget(),

               Container(
                  width: MediaQuery.of(_context).size.width,height: 5,

                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      // stops: [0.1, 0.5, 0.7, 0.9],
                      colors: [
                        Colors.cyan.shade600,
                        Colors.blue.shade900
                      ],

                  ),
                ),
              ),
          Padding(
            padding:
            EdgeInsets.only(left: getProportionateScreenWidth(20),right: getProportionateScreenWidth(20),bottom: getProportionateScreenHeight(20) ),
            child: SizedBox(
              width: SizeConfig.screenWidth,
              height: SizeConfig.screenHeight * 0.33,
              child:
                  product(),

            ),
          ),
              fillEntries()
            ],
          ),
        ),
      );
  Widget creditCardWidget() {
    var deviceSize = MediaQuery.of(_context).size;
    return Container(
      height: deviceSize.height * 0.1,

      decoration: BoxDecoration(
        color: Color(0xFFF6F6F6),

        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 50,
            color: Color(0xFFDADADA).withOpacity(0.5),
          )
        ],
      ),
      child: GestureDetector(
        onTap: () async {

          result = "${await Navigator.of(this.context).pushNamed( EditAddressScreen.routeName)}";
          print("callback"+ result );
          if(result.toString() == "1"){
            address = "${await FlutterSession().get("userAddress")}";
            address2 = "${await FlutterSession().get("userAddress2")}";
            userTax = "${await FlutterSession().get("taxId")}";
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => super.widget));
          }
          // Navigator.of(context).pushNamedAndRemoveUntil( historyPaymentScreen.routeName, (Route<dynamic> route) => false);

        },


        child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [


                   Padding(
                     padding: const EdgeInsets.all(5.0),
                     child: SvgPicture.asset("assets/icons/Location point.svg",color: kPrimaryColor2,width: 20,height: 20,),
                   ),

                    // Spacer(),

                      Container(
                        width: deviceSize.width*0.7,

                        child: Text("Tax id : ${userTax != "null" ?userTax:""}\n${address != null ?address:""}\n${address2 != null ? address2 : ""}",style: TextStyle( color: Colors.black), maxLines: 3),
                      ),
                      // Container(
                      //   width: deviceSize.width*0.7,
                      //
                      //     child: Text("${address != null ?address:""}\n${address2 != null ? address2 : ""}",style: TextStyle( color: Colors.black), maxLines: 3),
                      // ),
                    const SizedBox(width: 10),
                      // Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top:20.0),
                        child: Container(
                          padding: EdgeInsets.all(15),
                          height: getProportionateScreenWidth(40),
                          width: getProportionateScreenWidth(40),


                            child:  SvgPicture.asset("assets/icons/arrow_right.svg"),

                        ),
                      ),
                    ],
                  ),

                ],
              ),

      ],
    ),

      ),
    );
  }
  Widget product() =>
        ListView.builder(
          shrinkWrap: true,
          itemCount: demoCarts.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child:  CartCard(cart: demoCarts[index]),
          ),

  );


  Widget fillEntries() => Container(
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
    child: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          CheckboxListTile(
            controlAffinity: ListTileControlAffinity.leading,
            title: Text('Tax / Receipt is required'),
            value: _checkbox,
            onChanged: (value) {
              setState(() {
                _checkbox = !_checkbox;
              });
            },
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(

                TextSpan(
                  text: "Amount",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              Text.rich(
                    TextSpan(
                      text: NumberFormat.decimalPattern().format(total).toString()+" THB",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),

              ),
              // Spacer(),

            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(

                TextSpan(
                  text: "Discount",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              Text.rich(


                    TextSpan(
                      text: widget.voucher.toString()!= "null"?NumberFormat.decimalPattern().format((total*int.parse(widget.voucher)/100).round()).toString()+" THB":"0"+" THB",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),

              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(

                TextSpan(
                  text: "Delivery fee",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              Text.rich(


                    TextSpan(
                      text: (total!=0?(total >= 3000?"0"+" THB":"150"+" THB"):"0"+" THB"),
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),


              ),
              // Spacer(),

            ],
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          Container(
            color: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      text: "Total",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  Text.rich(


                        TextSpan(
                          text: widget.voucher.toString()!= "null"?NumberFormat.decimalPattern().format((total-(total*int.parse(widget.voucher)/100).round())+((total!=0?(total >= 3000?0:150):0))).toString()+" THB":NumberFormat.decimalPattern().format(total+((total!=0?(total >= 3000?0:150):0))).toString()+" THB",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),

                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
          if(widget.status.toString() == '1')
          Container(
            color: kPrimaryColorGreen,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Text.rich(

                    TextSpan(

                      children: [
                        TextSpan(
                          text: widget.status.toString() == '1'?"success":"waitting",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: getProportionateScreenHeight(20)),
        ],
      ),
    ),
  );

  Widget floatingBar() => isDataAvailable
  ? Ink(
    decoration: ShapeDecoration(
        shape: StadiumBorder(),
        gradient: LinearGradient(colors: UIData.kitGradients2)),
    child: FloatingActionButton.extended(
      onPressed: () {

        // Navigator.of(_context).pushNamed( PaymentSuccessPage.routeName);
        showSuccessDialog();
      },
      backgroundColor: Colors.transparent,
      icon: Icon(
        FontAwesomeIcons.receipt,
        color: Colors.white,
      ),
      label: Text(
        "Pay",
        style: TextStyle(color: Colors.white),
      ),
    ),
  )
      : CircularProgressIndicator();

  @override
  Widget build(BuildContext context) {
    _context = context;
    cardBloc = CreditCardBloc();
    return Scaffold(

      appBar: AppBar(
        backgroundColor: kPrimaryColor2,
        iconTheme: IconThemeData(
          color: kPrimaryColor, //change your color here
        ),
        centerTitle: true,
        title: Text("Payment"),
      ),
      body: bodyData(),

      floatingActionButton: widget.status.toString() == '1'?null:floatingBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void showSuccessDialog() {
    setState(() {
      isDataAvailable = false;
      Future.delayed(Duration(seconds: 3)).then((_) => goToDialog());
    });
  }

  goToDialog() {
    setState(() {
      isDataAvailable = true;
    });
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                successTicket(),
                SizedBox(
                  height: 10.0,
                ),
                FloatingActionButton(
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.clear,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    postToHistoryPayment();
                    Navigator.pop(context);
                    // Navigator.pop(context);
                    // Navigator.of(_context).pushNamed( historyPaymentScreen.routeName);
                    Navigator.of(context).pushNamedAndRemoveUntil( historyPaymentScreen.routeName, (Route<dynamic> route) => false);

                  },
                )
              ],
            ),
          ),
        ));
  }

  successTicket() => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16.0),
    child: Material(
      clipBehavior: Clip.antiAlias,
      elevation: 2.0,
      borderRadius: BorderRadius.circular(4.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ProfileTile(
              title: "Thank You!",
              textColor: Colors.purple,
              subtitle: "Your transaction is successful",
            ),
            ListTile(
              title: Text("Date"),
              subtitle: Text("26 Aug 2021"),
              trailing: Text("11:00 AM"),
            ),
            ListTile(
              title: Text("Username"),
              subtitle: Text("email@gmail.com"),
              trailing: CircleAvatar(
                radius: 20.0,
                backgroundImage: NetworkImage(
                    "${userPic.toString()}"),
              ),
            ),
            ListTile(
              title: Text("Amount"),
              subtitle: Text("${total.toString()}"),
              trailing: Text("Completed"),
            ),
            Card(
              clipBehavior: Clip.antiAlias,
              elevation: 0.0,
              color: Colors.grey.shade300,
              child: ListTile(
                leading: Icon(
                  FontAwesomeIcons.ccAmex,
                  color: Colors.blue,
                ),
                title: Text("pay"),
                subtitle: Text("************"),
              ),
            )
          ],
        ),
      ),
    ),
  );
}
Future _getThingsOnStartup() async {
  await Future.delayed(Duration(seconds: 0));
}

