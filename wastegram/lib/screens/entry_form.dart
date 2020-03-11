import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;
import 'package:location/location.dart';
import 'dart:io';

import 'package:wastegram/model/form_fields.dart';


class EntryForm extends StatefulWidget{
  @override
  _EntryFormState createState() => _EntryFormState();
}

class _EntryFormState extends State<EntryForm> {
  final _formKey = GlobalKey<FormState>();
  final formEntryFields = FormFields();
  File image;
  LocationData locationData;

  void getLocation() async {
    var locationService = Location();
    locationData = await locationService.getLocation();
    print('Latitude: ${locationData.latitude}');
    print('Longitude: ${locationData.longitude}');
  }

  void getImage() async {
    image = await ImagePicker.pickImage(source: ImageSource.gallery);
    StorageReference storageReference = FirebaseStorage.instance.ref().child(Path.basename(image.path));
    StorageUploadTask uploadTask = storageReference.putFile(image);
    await uploadTask.onComplete;
    final url = await storageReference.getDownloadURL();
    print('URL: $url');
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
                      validator: (value) {
                        if(value.isEmpty){
                          return 'Please enter a value';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        formEntryFields.total = int.parse(value);
                      },
                      )
                    ),
                    RaisedButton(
                      child: Text('Upload'),
                      onPressed: () async {
                        // Upload values to firestore DB
                        // Firestore.instance.collection('wastegram').add({
                        //   // Pass a map of key value pairs
                        //   // date, image_url, total_waste, longitude, latitude
                        // });
                        //print(formEntryFields.wasteTotal);
                        //getLocation();

                        // Go back to list screen and pop off entry form screen
                        Navigator.of(context).pop('pictures');
                        Navigator.of(context).pushNamed('entries');
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