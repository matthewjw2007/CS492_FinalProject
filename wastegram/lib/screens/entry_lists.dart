import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EntryLists extends StatefulWidget{
  @override
  _EntryListsState createState() => _EntryListsState();
}

class _EntryListsState extends State<EntryLists> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Wastegram')),
      body: Center(
        child: Container(
          child: Text('Wastegram')
        )
      ),
      floatingActionButton: NewEntryButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class NewEntryButton extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: (){
        Navigator.of(context).pushNamed('enterWaste');
      }
      );
  }
}

// return Scaffold(
//       appBar: AppBar(title: Text('Wastegram')),
//       body: StreamBuilder(
//       stream: Firestore.instance.collection('test').snapshots(),
//       builder: (context, snapshot) {
//         if(snapshot.hasData){
//           return ListView.builder(
//             itemCount: snapshot.data.documents.length,
//             itemBuilder: (context, index) {
//               var post = snapshot.data.documents[index];
//               return ListTile(
//                 leading: Text(post['total'].toString()),
//                 title: Text(post['name']),
//               );
//             },
//           );
//         } else {
//           return Center(
//             child: CircularProgressIndicator()
//           );
//         }
//       }
//       )
//     );