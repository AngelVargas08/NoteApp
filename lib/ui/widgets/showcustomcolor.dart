

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:notes_app/models/notes_provider.dart';
import 'package:provider/provider.dart';

import '../utils/themes_color.dart';

class ShowCustomColor extends StatelessWidget {
   
  const ShowCustomColor({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final bool darkmode =context.select<NotesProvider,bool>((value) => value.darkmode);
    final nume = context.watch<NotesProvider>();
    return   AlertDialog(
      backgroundColor:(darkmode)?ThemeGeneral.colorDark2:ThemeGeneral.colorprimary,
      contentPadding: EdgeInsets.zero,
        content:  SizedBox(
            height: MediaQuery.of(context).size.width/1.5,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children:  [
                const SizedBox(height: 10,),
                   Text('Selecciona Colores ${nume.number}/3', style: ThemeGeneral.fontStyleBlack,),
                   Expanded(
                    child: PageView(
                      onPageChanged: (value) {
                        nume.numberr(value);
                      },
                        children: const [
                          _GridViewColors(),
                          _GridViewColors(),
                          _GridViewColors(),
                        ],
                    )),
              ],
            ),
        ),
        
    );
  }
}

class _GridViewColors extends StatelessWidget {
  const _GridViewColors({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool bandera =true;
    late Color selectColor;
    return Center(
      child: GridView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4), 
        itemCount: Colors.primaries.length,
        itemBuilder: (context, index) {
          final color = Colors.primaries[index];
          List colors = [Colors.primaries];

        return  Padding(
          padding: const EdgeInsets.all(1),
          child: InkWell(
            onTap: () {
              selectColor = color;
              log(color.toString());
             // print(colors[index]);
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              child: CircleAvatar(
              backgroundColor: color,
              child:Icon((bandera)?null:
                
                Icons.check, size: 35,color: Colors.black),
              ),
            ),
          ),
        );
        },
        ),
    );
  }
}