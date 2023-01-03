

import 'package:flutter/material.dart';
import 'package:notes_app/ui/utils/themes_color.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ThemeGeneral.colorprimary,
      child: SafeArea(
        child: Column(
          children:  [
            CircleAvatar(
              backgroundColor: ThemeGeneral.colorTerc,
              radius: 100,
              child: const Text('Hello Angel'),  
            ),
             ListTile(
              leading:  Icon(Icons.lightbulb_outline, color: ThemeGeneral.colorSegundary),
              title: const Center(child: Text('Modo Oscuro')),
              trailing: Switch.adaptive(
                activeColor: ThemeGeneral.colorSegundary,
                value: true, 
                onChanged: (value) {}),
            ),
              ListTile(
              leading: Icon(Icons.add_to_home_screen,color: ThemeGeneral.colorSegundary),
              title: const Center(child: Text('Tema Personalizado')),
              trailing: Switch.adaptive(
                activeColor: ThemeGeneral.colorSegundary,
                value: false,
                 onChanged: (v) {}),
            ),
          ],
        ),
      ),
    );
  }
}