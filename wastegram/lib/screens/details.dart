import 'package:flutter/material.dart';

class WasteDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    final Map posts = ModalRoute.of(context).settings.arguments;
    print('${posts['date']}');
  }
}