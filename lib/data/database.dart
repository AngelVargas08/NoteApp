
import 'package:hive/hive.dart';

class DataBaseNote{

   List notedata = [];
  final _mybox = Hive.box('Mybox');

void initialData(){
  notedata = [
     ["Angel Vargas",true],
  ];
}

void loadData(){
  notedata = _mybox.get('NOTEDATA');
}

void updateData(){
  _mybox.put('NOTEDATA', notedata);
}

}