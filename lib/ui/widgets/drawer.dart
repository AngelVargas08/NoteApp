

import 'package:flutter/material.dart';
import 'package:notes_app/models/notes_provider.dart';
import 'package:notes_app/ui/utils/themes_color.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
     final bool darkmode =context.select<NotesProvider,bool>((value) => value.darkmode);
    return Drawer(
      backgroundColor: (darkmode)?ThemeGeneral.colorDark2:ThemeGeneral.colorprimary,
      child: SafeArea(
        child: Column(
          children:  [
            CircleAvatar(
              backgroundColor: ThemeGeneral.colorTerc,
              radius: 100,
              child:  Text('Hello Angel', style: ThemeGeneral.fontStyle,),  
            ),
             ListTile(
              leading:  Icon(Icons.lightbulb_outline, color: ThemeGeneral.colorSegundary),
              title: const Center(child: Text('Modo Oscuro')),
              
              trailing: Selector<NotesProvider,bool>(
                selector: (p0, p1) => p1.darkmode,
                builder: (context, value, child) => Switch.adaptive(
                activeColor: ThemeGeneral.colorSegundary,
                value: value, 
                onChanged: (value) => context.read<NotesProvider>().changeDarkmode(value),
                ),)
            ),
              ListTile(
              leading: Icon(Icons.add_to_home_screen,color: ThemeGeneral.colorSegundary),
              title: const Center(child: Text('Tema Personalizado')),
              trailing: Selector<NotesProvider,bool>(
                selector: (p0, p1) => p1.customMode,
                builder: (context, value, child) => Switch.adaptive(
                activeColor: ThemeGeneral.colorSegundary,
                value: value,
                 onChanged: (value) => context.read<NotesProvider>().changeCustom(value, context),),
                 
                 ),
            ),
          ],
        ),
      ),
    );
  }
}