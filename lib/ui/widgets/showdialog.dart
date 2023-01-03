

import 'package:flutter/material.dart';
import 'package:notes_app/models/notes_provider.dart';
import 'package:notes_app/ui/utils/themes_color.dart';
import 'package:notes_app/ui/widgets/button.dart';
import 'package:provider/provider.dart';

class ShowDialog extends StatelessWidget {
  final int? index;
  const ShowDialog(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    final note = context.watch<NotesProvider>();
    late bool note2 = context.read<NotesProvider>().vali;
    final bool edit = context.read<NotesProvider>().edit;
    return  AlertDialog(
      backgroundColor: ThemeGeneral.colorprimary,
      content:  SizedBox(
        width: 300,
        height: 160,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              TextFormField(
              initialValue: (edit)?note.textfield:null,
              onChanged: (value) => note.valitadion(value),
              decoration: InputDecoration(
                labelText: (edit)?'Actualize la nota':'Ingrese la nueva nota',
                errorText: note2? null :'Ingrese una nueva nota',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                )),
            ),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ButtonGeneral(
                  title:'Guardar'
                  ,onPressed: (){
                     if(edit == false){
                      note.saveNewTask(context);
                     }else{
                      note.editTask(context,index!);
                     }
                  }
                 
                  
                  ),
                  
                 
                const SizedBox(width: 10,),
                ButtonGeneral(title: 'Cancelar',onPressed: () => 
                note.cancelar(context)), 
                
              ],
            )
          ],
        ),
      ),
    );
  }
}