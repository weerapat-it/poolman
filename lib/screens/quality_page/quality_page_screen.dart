import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/components/coustom_bottom_nav_bar.dart';
import 'package:JDPoolsApplication/enums.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:JDPoolsApplication/screens/cart/cart_screen.dart';
import 'package:JDPoolsApplication/screens/home/components/search_field.dart';
import 'package:JDPoolsApplication/screens/home/components/icon_btn_with_counter.dart';
import 'components/body.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../../constants.dart';
import 'package:JDPoolsApplication/bottom_navigation_view/bottom_bar_view.dart';
import 'package:JDPoolsApplication/models/Cart.dart';
import 'package:JDPoolsApplication/models/Product.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:JDPoolsApplication/screens/PdfPreviewScreen.dart';
class Values {
  final name;
  final  value;

  const Values({@required this.name, @required this.value});
}
class QualityPageScreen extends StatefulWidget {
  static String routeName = "/quality_page";
  _QualityPageScreenState createState() => _QualityPageScreenState();
}

class _QualityPageScreenState extends State<QualityPageScreen> {
  var userId;
  void initState() {
    // getListImage();
  }
  List data = [];

  getListImage() async {
    //
    // userId = await FlutterSession().get("userId");
    // String Url = "http://jdpoolswebservice.com/spintest/cal_spintest.php";
    // var res = await http.post(Uri.encodeFull(Url),headers:{"Accept" : "application/json"},
    //     body: {
    //       // "customer":_dropDownValue,
    //       "userid":userId,
    //       "data" : widget.value,
    //     }
    // );
    // var resBody = json.decode(res.body);
    // print(resBody);
    // setState(() {
    //   data = resBody;
    //
    // });
  }
  final pdf = pw.Document();
  writeOnPdf({String value}) async {
    final profileImage = pw.MemoryImage(
        (await rootBundle.load('assets/images/logo2.png')).buffer.asUint8List(),);
    userId = "${await FlutterSession().get("userId")}";
    var url = Uri.https('jdpoolswebservice.com', '/spintest/cal_spintestPDF.php', {'q': '{http}'});
    // String Url = "http://jdpoolswebservice.com/spintest/cal_spintestPDF.php";
    var res = await http.post(url,headers:{"Accept" : "application/json"},
        body: {
          // "customer":_dropDownValue,
          "userid":userId,
          "data" : value,
        }
    );
    var resBody = json.decode(res.body);
    print(resBody);
    setState(() {
      data = resBody;

    });
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd kk:mm').format(now);
    final headers = ['Test Name', 'Test Result'];

    final values = [
      Values(name: 'Free Chlorine', value: data[5]),
      Values(name: 'Total Chlorine', value: data[6]),
      Values(name: 'Combined Chlorine', value: data[7]),
      Values(name: 'pH', value: data[12]),
      Values(name: 'Hardness', value: data[8]),
      Values(name: 'Alkalinity', value: data[11]),
      Values(name: 'Cyanuric Acid', value: data[9]),
      Values(name: 'Copper', value: data[10]),
      Values(name: 'Iron', value: data[13]),
      Values(name: 'Salt', value: data[14]),
      Values(name: 'Phosphate', value: data[17]),
    ];
    final dataTable = values.map((values) => [values.name, values.value]).toList();

    pdf.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          margin: pw.EdgeInsets.all(30),

          build: (pw.Context context){
            return <pw.Widget>  [
              pw.Image(profileImage,width: 50,height: 50),
              pw.Paragraph(
                  text: formattedDate

              ),

              pw.Text(
                 "${data[4]} \n${data[15]} \n${data[16]} ",
              ),
              pw.SizedBox(height: 10),
              pw.Table.fromTextArray(
                headers: headers,
                data: dataTable,
              ),
              pw.Header(
                  level: 1,
                  child: pw.Text("Points")
              ),

              pw.Paragraph(
                  text: data[0].toString()
              ),

              // pw.Paragraph(
              //     text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada fames ac turpis egestas sed tempus urna. Quisque sagittis purus sit amet. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Viverra justo nec ultrices dui sapien eget mi proin sed."
              // ),

              // pw.Header(
              //     level: 1,
              //     child: pw.Text(" Heading")
              // ),
              //
              // pw.Paragraph(
              //     text: data[1].toString()
              // ),
              // pw.Header(
              //     level: 2,
              //     child: pw.Text("Heading")
              // ),
              //
              // pw.Paragraph(
              //     text: data[2].toString()
              // ),
              pw.Header(
                  level: 2,
                  child: pw.Text("Recommendation",style: pw.TextStyle(fontWeight: pw.FontWeight.bold))
              ),

              pw.Text(
                   data[3].toString()
              ),

              // pw.Paragraph(
              //     text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada fames ac turpis egestas sed tempus urna. Quisque sagittis purus sit amet. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Viverra justo nec ultrices dui sapien eget mi proin sed."
              // ),
              //
              // pw.Paragraph(
              //     text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Malesuada fames ac turpis egestas sed tempus urna. Quisque sagittis purus sit amet. A arcu cursus vitae congue mauris rhoncus aenean vel elit. Ipsum dolor sit amet consectetur adipiscing elit pellentesque. Viverra justo nec ultrices dui sapien eget mi proin sed."
              // ),
            ];
          },


        )
    );
  }

  Future savePdf() async{
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    String documentPath = documentDirectory.path;

    File file = File("$documentPath/report.pdf");

    file.writeAsBytesSync(await pdf.save());
  }
  @override
  Widget build(BuildContext context) {
    final PoolDataDetailsArguments agrs =
        ModalRoute.of(context).settings.arguments;
    // print("value"+agrs.value);
    return Scaffold(

      // appBar: AppBar(
      //   title: Text(agrs.value),
      // ),
      // body: Body(value:agrs.value),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(63.0), // here the desired height
        child: buildAppBar(context),

      ),
      backgroundColor: kwhite,
      body:  Stack(
        children: <Widget>[
          Body(value:agrs.value),

          bottomBar(),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 60.0),
        child: FloatingActionButton(

          onPressed: () async {
            await writeOnPdf(value:agrs.value);
            await savePdf();

            Directory documentDirectory = await getApplicationDocumentsDirectory();

            String documentPath = documentDirectory.path;

            String fullPath = "$documentPath/report.pdf";
            // Add your onPressed code here!
            //   Navigator.push(context, MaterialPageRoute(
            //       builder: (context) => PdfPreviewScreen(path: fullPath,)
            //   ));
            OpenFile.open(fullPath);
          },
          child: const Icon(Icons.picture_as_pdf),
          backgroundColor: Colors.red,
        ),
      ),
      // bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.favourite),
    );
  }
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor2,
      centerTitle: true,
      title:Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // SearchField(search :null),
            Text(
                "Water quality",style: TextStyle(color: kPrimaryColor)

            ),
            IconBtnWithCounter(
              svgSrc: "assets/icons/Cart Icon.svg",
              press: () =>
              // check().then((result) {
              //   print("result: "+result[0]+result[1]+result[2]);
              //   setState(() {
              //     status = result[2];
              //     if(status != 0 && status != null){
              //       // Navigator.of(context).pushNamedAndRemoveUntil( HomeScreen.routeName, (Route<dynamic> route) => false);
              //       // print(userId);
              //
              //       Navigator.pushNamed(context, CartScreen.routeName);
              //     }else{
              //       // guest();
              //       // Navigator.of(context).pushNamed( SignInScreen.routeName);
              Navigator.pushNamed(context, CartScreen.routeName),
              //     }
              //   });
              //
              // }),
              // Navigator.pushNamed(context, CartScreen.routeName),
            ),
            // Text(
            //   "${demoCarts.length} items",
            //   style: Theme.of(context).textTheme.caption,
            // ),
          ],
        ),
      ),

    );
  }
}
class PoolDataDetailsArguments {
  final String value;

  PoolDataDetailsArguments({@required this.value});

}
Widget bottomBar() {
  return Column(
    children: <Widget>[
      const Expanded(
        child: SizedBox(),
      ),
      BottomBarView(selectedMenu: null),
    ],
  );
}