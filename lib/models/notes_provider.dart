import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/data/database.dart';
import 'package:notes_app/models/utils.dart';

class NotesProvider extends ChangeNotifier {
  late String textfield;
  //relacion con la bd
  DataBaseNote db = DataBaseNote();
  final _mybox = Hive.box('Mybox');
  List get notedata => db.notedata;
  //iniciamos la base de datos
  NotesProvider() {
    if (_mybox.get('NOTEDATA') == null) {
      db.initialData();
    } else {
      db.loadData();
    }
  }

  bool _checkbox = false;
  bool get checkbox => _checkbox;
  late bool _vali = false;
  bool get vali => _vali;
  late bool _edit = false;
  bool get edit => _edit;

  set edit(bool i) {
    _edit = i;
    notifyListeners();
  }


//cargamos el dato seleccionado en el textfield
  void textfieldcharge(int index){
        textfield = notedata[index][0];
  }

//estado del checkbox
  set checkbox(bool i) {
    _checkbox = i;
    db.updateData();
    notifyListeners();
  }

//estado del checkbox
  void change(bool? value, int index) {
    checkbox = notedata[index][1] = value!;
    db.updateData();
    notifyListeners();
  }

//guardar notas
  void saveNewTask(BuildContext context) {
    if (_vali == true) {
      notedata.add([textfield, false]);
      Navigator.of(context).pop();
      textfield = '';
      _vali = false;
      db.updateData();
    }
    notifyListeners();
  }

//validacion del textield para que no este vacio
  void valitadion(value) {
    if (value.isEmpty) {
      _vali = false;
    } else {
      _vali = true;
      textfield = value;
    }
    notifyListeners();
  }

//elimina notas
  void deletetask(int index) {
    notedata.removeAt(index);
    db.updateData();
    notifyListeners();
  }

//editamos las notas
  void editTask(BuildContext context,int index) {
    if (notedata[index] == notedata[index]) {
      notedata[index][0] = textfield;
    }
    _vali = false;
    _edit = false;
    textfield = '';
    Navigator.of(context).pop();
    db.updateData();
    notifyListeners();
  }
//cierra el boton y reinicia la banderas
  void cancelar(BuildContext context) {
    _vali = false;
    _edit = false;
    textfield = '';
    Navigator.of(context).pop();
    notifyListeners();
  }

    bool _darkmode = false;
    get darkmode => _darkmode;
     ThemeData _curretTheme = ThemeData(primarySwatch: Colors.deepPurple);
    ThemeData get curretTheme => _curretTheme;

    void changeDarkmode(bool i ){
      _darkmode = i;
      _customMode = false;
      if(i){
        _curretTheme = ThemeData.dark();
      }else{
        _curretTheme = ThemeData(primarySwatch: Colors.deepPurple);
      }
      notifyListeners();
    }

    bool _customMode = false;
    get customMode => _customMode;



      Utils utils = Utils();
    void changeCustom(bool i , BuildContext context){
      if(i == true){
        utils.customColor(context);
      }
      _customMode = i;
      _darkmode = false;
      notifyListeners();
    }

  int _number = 0;
  int get number =>_number+1;
  void numberr(int i){
    _number = i;
    notifyListeners();
  }






}
