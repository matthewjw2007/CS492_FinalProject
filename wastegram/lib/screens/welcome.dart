import 'package:flutter/material.dart';

class Welcome extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome to Wastegram')
      ),
      body: Center(
        child: Text('Welcome to Wastegram')
      ),
    );
  }
}