import 'package:crud_operations/hive_db/crud_onhivedb.dart';
import 'package:flutter/material.dart';

class HomePageHive extends StatefulWidget {
  const HomePageHive({Key? key}) : super(key: key);

  @override
  State<HomePageHive> createState() => _HomePageHiveState();
}

class _HomePageHiveState extends State<HomePageHive> {
  late HiveDatabase hdb;
  @override
  void initState() {
    super.initState();
    hdb = HiveDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hive CRUD Operations'),),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(onPressed: (){
              hdb.writeData();
            }, child: const Text('Write')),
            ElevatedButton(onPressed: (){
              hdb.readData();
            }, child: const Text('Read')),
            ElevatedButton(onPressed: (){
              hdb.deleteData();
            }, child: const Text('Delete')),
          ],
        ),
      ),
    );
  }
}
