import 'package:flutter/material.dart';
import 'package:notes_app/models/notes_provider.dart';
import 'package:notes_app/ui/widgets/showcustomcolor.dart';
import 'package:notes_app/ui/widgets/showdialog.dart';
import 'package:provider/provider.dart';

class Utils{

void newEvent(BuildContext context){
  showDialog(
    context: context,
     builder: (context) =>const ShowDialog(0),    
     );
}

void editEvent(BuildContext context, int index){
 context.read<NotesProvider>().edit = true;
 context.read<NotesProvider>().textfieldcharge(index);
  showDialog(
    context: context,
     builder: (context) => ShowDialog(index),    
     );
}

void customColor(BuildContext context){
  showDialog(context: context, 
  builder:(context) => const ShowCustomColor (),
  );
}


void closewindow(BuildContext context){
    context.read<NotesProvider>().changeCustom(false, context);
     Navigator.of(context).pop();
}

void snackbarshow(BuildContext context,int index, String title){
  context.read<NotesProvider>().deletetask(index);
  const text = 'Se elimino la nota';
  final snackBar = SnackBar(
    content: Text("$text $title"),
    action: SnackBarAction(
      label: 'Aceptar', 
      onPressed: () {
        
      },),
    
    );
  ScaffoldMessenger.of(context)
  ..removeCurrentSnackBar()
  ..showSnackBar(snackBar);

}

}