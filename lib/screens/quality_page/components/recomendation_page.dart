import 'dart:io';

import 'package:flutter/material.dart';
import 'package:JDPoolsApplication/components/custom_surfix_icon.dart';
import 'package:JDPoolsApplication/components/default_button.dart';
import 'package:JDPoolsApplication/components/form_error.dart';
import 'package:JDPoolsApplication/screens/complete_profile/complete_profile_screen.dart';
import 'package:JDPoolsApplication/screens/home/components/popular_product.dart';
import 'package:flutter/services.dart';
import '../../../screens/bloc/bloc.dart';
import '../../../screens/page/Gmap_page.dart';
import '../../../screens/page/main_gmap.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:JDPoolsApplication/components/product_card.dart';
import 'package:JDPoolsApplication/models/Product.dart';

import 'package:flutter_session/flutter_session.dart';
import '../../../size_config.dart';
import 'package:JDPoolsApplication/screens/home/components/section_title.dart';
class Values {
  final name;
  final  value2;

  const Values({@required this.name, @required this.value2});
}
class RecomendationPage extends StatefulWidget {
  final String value;

  RecomendationPage({Key key, @required this.value}) : super(key: key);

  @override
  _RecomendationPageState createState() => _RecomendationPageState();
}

class _RecomendationPageState extends State<RecomendationPage> {
  List data = [];
  List data2 = [];
  var userId;
  void initState() {

    data.clear();
    InsertMethod();
  }
    InsertMethod()async{

      userId = "${await FlutterSession().get("userId")}";
      var url = Uri.https('jdpoolswebservice.com', '/spintest/cal_spintest.php', {'q': '{http}'});
      // String Url = "http://jdpoolswebservice.com/spintest/cal_spintest.php";
      var res = await http.post(url,headers:{"Accept" : "application/json"},
          body: {
            // "customer":_dropDownValue,
            "userid":userId,
            "data" : widget.value,
            "history" : "1",
          }
      );
      var resBody = json.decode(res.body);

      setState(() {
        data = resBody;
      });
    }
  final pdf = pw.Document();
  writeOnPdf({String value}) async {
    final profileImage = pw.MemoryImage(
      (await rootBundle.load('assets/images/logo2.png')).buffer.asUint8List(),);
    userId = "${await FlutterSession().get("userId")}";
    var url = Uri.https('jdpoolswebservice.com', '/spintest/cal_spintestPDF.php', {'q': '{http}'});
    // String Url = "http://jdpoolswebservice.com/spintest/cal_spintestPDF.php";
    var res2 = await http.post(url,headers:{"Accept" : "application/json"},
        body: {
          // "customer":_dropDownValue,
          "userid":userId,
          "data" : value,
        }
    );
    var resBody2 = json.decode(res2.body);
    print(resBody2);
    setState(() {
      data2 = resBody2;

    });
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd kk:mm').format(now);
    final headers = ['Test Name', 'Test Result'];

    final values = [
      Values(name: 'Free Chlorine', value2: data2[5]),
      Values(name: 'Total Chlorine', value2: data2[6]),
      Values(name: 'Combined Chlorine', value2: data2[7]),
      Values(name: 'pH', value2: data2[12]),
      Values(name: 'Hardness', value2: data2[8]),
      Values(name: 'Alkalinity', value2: data2[11]),
      Values(name: 'Cyanuric Acid', value2: data2[9]),
      Values(name: 'Copper', value2: data2[10]),
      Values(name: 'Iron', value2: data2[13]),
      Values(name: 'Salt', value2: data2[14]),
      Values(name: 'Phosphate', value2: data2[17]),
    ];
    final dataTable = values.map((values) => [values.name, values.value2]).toList();

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
                "${data2[4]} \n${data2[15]} \n${data2[16]} ",
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
                  text: data2[0].toString()
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
                  data2[3].toString()
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
    return Column(
      children: [

        Container(
          width: SizeConfig.screenWidth*0.9,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          color: bgColor,

          child: Column(
            children: [
              Text( (data?.length > 0 ? data[3].substring(1) : ''),style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)

              ),
              SizedBox(width: getProportionateScreenWidth(20)),
              GestureDetector(
                onTap: () async {
                  await writeOnPdf(value:widget.value);
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
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "See More Detail",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: kPrimaryColor2),
                    ),
                    SizedBox(width: 5),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: kPrimaryColor2,
                    ),
                  ],
                ),
              ),
            ],
          ),

        )
      ],
    );
  }


}