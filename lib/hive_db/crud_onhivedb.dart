import 'package:hive/hive.dart';

class HiveDatabase{
  //reference to the box
  late var _myBox;
  HiveDatabase(){
    _myBox = Hive.box('mybox');
  }
//write data
  void writeData(){
    _myBox.put(1,'Rudra');
    _myBox.put(2,'Kishore');
    _myBox.put(3,'Narayan');
    _myBox.put(4,'Panda');
  }

//read data
  void readData(){
    print(_myBox.get(1));
    print(_myBox.get(2));
    print(_myBox.get(3));
    print(_myBox.get(4));
  }

// delete data
  void deleteData(){
    _myBox.delete(1);
    print(_myBox.get(1));
  }
}