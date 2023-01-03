

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/data/database.dart';

class NotesProvider extends ChangeNotifier{


  late String textfield;
  late String textfield2='nombe';

  DataBaseNote db = DataBaseNote();
   final _mybox = Hive.box('Mybox');
    List get notedata =>db.notedata;
    
    NotesProvider(){
        if(_mybox.get('NOTEDATA')==null){
            db.initialData();
        }else{
          db.loadData();
        }
    }

bool _checkbox = false;
bool get checkbox => _checkbox;
 late bool _vali = false;
bool get vali => _vali;


set checkbox(bool i){
  _checkbox = i;
  db.updateData();
  notifyListeners();
}

void change(bool? value, int index){
    checkbox = notedata[index][1] = value!; 
    db.updateData();
    notifyListeners();
}


void saveNewTask(BuildContext context){

    if(_vali == true){
      notedata.add([textfield,false]);
      Navigator.of(context).pop();
      textfield = '';
      _vali = false;
      db.updateData();
    }

    notifyListeners();
}

void valitadion(value){
 if(value.isEmpty){
     _vali = false; 
    }
    else{
      _vali = true; 
        textfield = value;
      }
      notifyListeners();
}

void deletetask(int index){
  notedata.removeAt(index);
  db.updateData();
  notifyListeners();
}

  read(int index){
    if(notedata[index] == notedata[index] ){
    notedata[index][0] = textfield2;
  }
    notifyListeners();
    return textfield2;
  }

 void editTask(int index, String title){
  if(notedata[index] == notedata[index] ){
    notedata[index][0] = title;
  }
  db.updateData();
    notifyListeners();
}



}