import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RetrieveDataScreen extends StatefulWidget {
  const RetrieveDataScreen({Key? key}) : super(key: key);

  @override
  State<RetrieveDataScreen> createState() => _RetrieveDataScreenState();
}

class _RetrieveDataScreenState extends State<RetrieveDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Pets'),),
      body: Container(
        margin: EdgeInsets.all(10),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('pets').snapshots(),
          builder: (ctx, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: SpinKitFoldingCube(color: Colors.yellow),
              );
            }
            else{
              final petDocs = snapshot.data!.docs;
              return ListView.builder(
                  itemCount: petDocs.length,
                  itemBuilder: (ctx, index){
                return ListTile(
                  title: Text(petDocs[index]['name']),
                  subtitle: Text(petDocs[index]['animal']),
                  trailing: Text(petDocs[index]['age'].toString()),
                );
              });
            }
        },),
      ),
    );
  }
}
