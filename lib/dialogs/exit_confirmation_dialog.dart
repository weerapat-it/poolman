import 'package:flutter/material.dart';

class ExitConfirmationDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16)
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: _buildChild(context),
    );
  }

  _buildChild(BuildContext context) => Container(
<<<<<<< HEAD
    height: 300,
=======
    height: 350,
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
    decoration: BoxDecoration(
      color: Colors.redAccent,
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.all(Radius.circular(12))
    ),
    child: Column(
      children: <Widget>[
        Container(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset('assets/images/sad.png', height: 120, width: 120,),
          ),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12))
          ),
        ),
        SizedBox(height: 24,),
<<<<<<< HEAD
        // Text('Do you want join?', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
        // SizedBox(height: 8,),
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Text('Please select new pic.', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
=======
        Text('Do you want to exit?', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
        SizedBox(height: 8,),
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Text('If back button is pressed by mistake then click on no to continue.', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
        ),
        SizedBox(height: 24,),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
<<<<<<< HEAD
            // FlatButton(onPressed: (){
            //   Navigator.of(context).pop();
            // }, child: Text('No'),textColor: Colors.white,),
            RaisedButton(onPressed: (){
              Navigator.of(context).pop();
              return Navigator.of(context).pop();
            }, child: Text('Close'), color: Colors.white, textColor: Colors.redAccent,),
            // SizedBox(width: 8,),
            // RaisedButton(onPressed: (){
            //   return Navigator.of(context).pop(true);
            // }, child: Text('Yes'), color: Colors.white, textColor: Colors.redAccent,)
=======
            FlatButton(onPressed: (){
              Navigator.of(context).pop();
            }, child: Text('No'),textColor: Colors.white,),
            SizedBox(width: 8,),
            RaisedButton(onPressed: (){
              return Navigator.of(context).pop(true);
            }, child: Text('Yes'), color: Colors.white, textColor: Colors.redAccent,)
>>>>>>> e067d62dbefff1c1948f027873a98a82c90e12bc
          ],
        )
      ],
    ),
  );
}
