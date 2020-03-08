import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'dart:io';


class ChooseOrTakeForm extends StatefulWidget{
  @override
  _ChooseOrTakeState createState() => _ChooseOrTakeState();
}

class _ChooseOrTakeState extends State<ChooseOrTakeForm> {
  File image;

  void getImage() async {
    image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() { });
  }

  @override
  Widget build(BuildContext context){
    if(image == null){
      return Scaffold(
        appBar: AppBar(title: Text('Wastegram')),
        body: Center(
          child: RaisedButton(
            child: Text('Select a Photo'),
            onPressed: () {
              getImage();
            }
          )
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(title: Text('Wastegram'),),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(30),
                child: Image.file(image)
              ),
              Text('Number of items form'),
              Text('Upload button')
            ]
          )
        )
      );
    }
  }
}

class ChoosePhoto extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      child: Text('Choose Photo'),
      onTap: (){
        Navigator.of(context).pushNamed('photoScreen');
      },
    );
  }
}

class TakePhoto extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      child: Text('Take Photo'),
    );
  }
}