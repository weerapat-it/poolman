import 'package:flutter/material.dart';
import '../../screens/bloc/bloc.dart';
import '../../screens/page/Gmap_page.dart';
import 'package:provider/provider.dart';

void main_gmap() => runApp(MyAppGmap());

class MyAppGmap extends StatelessWidget {
  static String routeName = "/page";
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>ProviderMaps()..getUserLocation())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              buttonTheme:ButtonThemeData(
                buttonColor: Colors.blueAccent,
                height:50,
                textTheme: ButtonTextTheme.primary,
                minWidth: 80,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)
                ),

              )
          ),
          home: Gmap()
      ),
    );
  }
}