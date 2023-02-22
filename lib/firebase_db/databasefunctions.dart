import 'package:cloud_firestore/cloud_firestore.dart';

void create(String colcName, String docName, String name, String animal,
    int age) async {
  await FirebaseFirestore.instance.collection(colcName).doc(docName).set(
    {'name': name, 'animal': animal, 'age': age},
  );
  print('Database Created');
}

void update(String colcName, String docName, String field, var newField) async {
  await FirebaseFirestore.instance
      .collection(colcName)
      .doc(docName)
      .update({field: newField});
  print('Database Updated Successfully');
}

void delete(String colcName, String docName) async {
  await FirebaseFirestore.instance.collection(colcName).doc(docName).delete();
  print('Document Deleted Successfully');
}
