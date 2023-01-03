

import 'package:flutter/material.dart';
import 'package:notes_app/models/notes_provider.dart';
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



}