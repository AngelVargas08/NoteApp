
import 'package:flutter/material.dart';
import 'package:notes_app/models/notes_provider.dart';
import 'package:notes_app/models/utils.dart';
import 'package:notes_app/ui/utils/themes_color.dart';
import 'package:notes_app/ui/widgets/container_note.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
   
  const HomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    Utils utils = Utils();
    return  Scaffold(
      backgroundColor: ThemeGeneral.colorprimary,
      endDrawer: const Drawer(),
      appBar: AppBar(
        title: const Text('Note'),
        elevation: 0
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => utils.newEvent(context),
          child: const Icon(Icons.add, size: 35,),
          ),
        body: _Listview()
          

          
          
        
    );
  }
}

class _Listview extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final note = context.watch<NotesProvider>();
    return ListView.builder(
      itemCount: note.notedata.length,
      itemBuilder: (context, index) => 
      ContainerData(title: note.notedata[index][0],
                    value: note.notedata[index][1],
                    check: (value) => note.change(value, index),
                    onPressed: (p0) => note.deletetask(index),
                    
                    ),
      );
  }
}