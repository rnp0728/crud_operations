import 'package:crud_operations/firebase_options.dart';
import 'package:crud_operations/sqflite_db/homescreen_sql.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import 'firebase_db/homepage.dart';
import 'hive_db/homescreen_hive.dart';

void main() async{
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  //initialization
  await Hive.initFlutter();

  //open the box
  var box = await Hive.openBox('mybox');

  runApp(const CRUDOperations());
}

class CRUDOperations extends StatelessWidget {
  const CRUDOperations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomePageSQL(),
    );
  }
}
