import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  File _image;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Camera App',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Camera App'),
        ),
        body: Center(
          child: _image == null ? Text('No image found') : Image.file(_image) 
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _openDialogBox,
          child: Icon(Icons.camera),         
      ),
      //  floatingActionButton: FloatingActionButton(
         
      //   onPressed: clickImage,
      //   child: Icon(Icons.camera),         
      // ),
    ));
  }

  Future clickImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image; 
    });
  }
  Future galleryImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image; 
    });
  }

  Future<void> _openDialogBox() async {
    return showDialog<void>(
      context: context,
      // barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Choose image source'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                      onTap: clickImage,
                      child: Text('Camera')
                    ),
                    Padding(padding: EdgeInsets.all(5),),
                    GestureDetector(
                      onTap: galleryImage,
                      child: Text('Gallery')
                    ),
                  ],
                )
                // GestureDetector(
                //   onTap: clickImage,
                //   child: Text('Camera')
                // ),
                // Padding(padding: EdgeInsets.all(5),),
                // GestureDetector(
                //   onTap: galleryImage,
                //   child: Text('Gallery')
                // ),
              ],
            ),
          ),
          // actions: <Widget>[
          //   FlatButton(
          //     child: Text('Regret'),
          //     onPressed: () {
          //       Navigator.of(context).pop();
          //     },
          //   ),
          // ],
        );
      },
    );
  }
}