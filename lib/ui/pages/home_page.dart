import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:notes_app/models/notes_provider.dart';
import 'package:notes_app/models/utils.dart';
import 'package:notes_app/ui/utils/themes_color.dart';
import 'package:notes_app/ui/widgets/widgets.dart';


class HomePage extends StatelessWidget {
   
  const HomePage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final bool darkmode =context.select<NotesProvider,bool>((value) => value.darkmode);
    Utils utils = Utils();
    return  Scaffold(
      backgroundColor: (darkmode)?ThemeGeneral.colorDark1:ThemeGeneral.colorprimary,
      endDrawer: const MyDrawer(),
      appBar: AppBar(
        backgroundColor: (darkmode)?ThemeGeneral.colorDark2:ThemeGeneral.colorSegundary,
        title: const Text('Note'),
        elevation: 0
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => utils.newEvent(context),
          backgroundColor: (darkmode)?ThemeGeneral.colorTerc:ThemeGeneral.colorNeu,
          child: const Icon(Icons.add, size: 35),
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
                    index: index, 
                    ),
      );
  }
}