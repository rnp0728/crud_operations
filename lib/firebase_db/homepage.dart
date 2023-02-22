import 'package:crud_operations/firebase_db/databasefunctions.dart';
import 'package:crud_operations/firebase_db/retrievedatascreen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD Operations'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    create('pets', 'kitty', 'Jerry', 'Cat', 5);
                    create('pets', 'doggy', 'Tom', 'dog', 7);
                  },
                  child: Text('Create')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        ModalBottomSheetRoute(
                            builder: (ctx) => RetrieveDataScreen(),
                            isScrollControlled: true));
                  },
                  child: Text('Retrieve')),
              ElevatedButton(
                  onPressed: () {
                    update('pets', 'kitty', 'age', '6');
                  },
                  child: Text('Update')),
              ElevatedButton(
                  onPressed: () {
                    delete('pets', 'kitty');
                  },
                  child: Text('Delete')),
            ],
          ),
        ),
      ),
    );
  }
}
