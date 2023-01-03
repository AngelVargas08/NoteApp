

import 'package:flutter/material.dart';
import 'package:notes_app/models/notes_provider.dart';
import 'package:notes_app/ui/utils/themes_color.dart';
import 'package:notes_app/ui/widgets/button.dart';
import 'package:provider/provider.dart';

class ShowDialog extends StatelessWidget {
  const ShowDialog({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    final note = context.watch<NotesProvider>();
    late bool? note2 = context.read<NotesProvider>().vali;
    return  AlertDialog(
      backgroundColor: ThemeGeneral.colorprimary,
      content:  SizedBox(
        width: 300,
        height: 160,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              TextFormField(
              initialValue: note.textfield2,
              onChanged: (value) => note.valitadion(value),
              decoration: InputDecoration(
                labelText: 'Ingrese la nueva Nota',
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
                  title: 'Guardar'
                  ,onPressed: (){
                  note.saveNewTask(context);
                  }
                  ),
                const SizedBox(width: 10,),
                ButtonGeneral(title: 'Cancelar',onPressed: () => 
                Navigator.of(context).pop(),), 
                
              ],
            )
          ],
        ),
      ),
    );
  }
}