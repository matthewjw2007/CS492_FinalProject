import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'dart:io';


class ChooseOrTakeForm extends StatefulWidget{
  @override
  _ChooseOrTakeState createState() => _ChooseOrTakeState();
}

class _ChooseOrTakeState extends State<ChooseOrTakeForm> {
  final _formKey = GlobalKey<FormState>();
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
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: TextFormField(
                      decoration: InputDecoration(labelText: 'Total Items', border: OutlineInputBorder()),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[WhitelistingTextInputFormatter.digitsOnly],
                      )
                    ),
                    RaisedButton(
                      onPressed: (){
                        
                      })
                  ]
                ),
              ),
            ]
          )
        )
      );
    }
  }
}