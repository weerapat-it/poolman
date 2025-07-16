import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'display_picture_screen.dart';
class cameraPicker extends StatefulWidget {
  @override
  _cameraPicker createState() => _cameraPicker();
}

class _cameraPicker extends State<cameraPicker> {
  File _image;
  final picker = cameraPicker();
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
  void initState() {
    _imgFromCamera();

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
    return Scaffold(
      appBar: AppBar(),
      body: Column(

        children: <Widget>[
          SizedBox(
            height: 80,
            width: 100,
          ),
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
                backgroundColor:  Colors.grey[800],


                child: _image != null
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.file(
                    _image,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.fitHeight,

                  ),
                )
                    : Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(100)),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
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
          new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, top: 60.0),

                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => DisplayPictureScreen(

                          file: _image,
                        ),
                      ));
                    },
                    child: new Container(
                        alignment: Alignment.center,
                        height: 60.0,
                        decoration: new BoxDecoration(
                            color: Color(0xFFf17b26),
                            borderRadius: new BorderRadius.circular(9.0)),
                        child: new Text("Generate",
                            style: new TextStyle(
                                fontSize: 20.0, color: Colors.white))),
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
    );

  }
}