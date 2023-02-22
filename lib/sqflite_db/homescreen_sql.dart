import 'package:crud_operations/sqflite_db/crud_onsqldb.dart';
import 'package:flutter/material.dart';

class HomePageSQL extends StatefulWidget {
  const HomePageSQL({Key? key}) : super(key: key);

  @override
  State<HomePageSQL> createState() => _HomePageSQLState();
}

class _HomePageSQLState extends State<HomePageSQL> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQL CRUD Operations'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  await DatabaseHelper.instance
                      .insertRecord({DatabaseHelper.colName: 'Rudra'});
                  await DatabaseHelper.instance
                      .insertRecord({DatabaseHelper.colName: 'Narayan'});
                  await DatabaseHelper.instance
                      .insertRecord({DatabaseHelper.colName: 'Panda'});
                },
                child: const Text('Create')),
            ElevatedButton(
                onPressed: () async {
                  var dbQuery = await DatabaseHelper.instance.queryDatabase();
                  print(dbQuery);
                },
                child: const Text('Read')),
            ElevatedButton(
                onPressed: () async {
                  await DatabaseHelper.instance.updateRecord({
                    DatabaseHelper.colId: 2,
                    DatabaseHelper.colName: 'Kishore'
                  });
                },
                child: const Text('Update')),
            ElevatedButton(onPressed: () async{
              await DatabaseHelper.instance.deleteRecord(3);
            }, child: const Text('Delete')),
          ],
        ),
      ),
    );
  }
}
