

import 'package:flutter/material.dart';
import 'package:notes_app/ui/widgets/showdialog.dart';

class Utils{

void newEvent(BuildContext context){
  showDialog(
    context: context,
     builder: (context) =>ShowDialog(),
        
     );
}


}