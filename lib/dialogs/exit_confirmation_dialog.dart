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
    height: 300,
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
        // Text('Do you want join?', style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
        // SizedBox(height: 8,),
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 16),
          child: Text('Please select new pic.', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
        ),
        SizedBox(height: 24,),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
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
          ],
        )
      ],
    ),
  );
}
