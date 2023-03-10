import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/models/notes_provider.dart';
import 'package:notes_app/ui/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() async{
  
    await Hive.initFlutter();
   await Hive.openBox('Mybox');
  
   runApp(
  ChangeNotifierProvider(
    create: (context) => NotesProvider(),
    child: const MyApp()));}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = context.select<NotesProvider,ThemeData>((value)=>value.curretTheme);
    return  MaterialApp(
      theme: themeData,
      debugShowCheckedModeBanner: false,
      title: 'Notes App',
      home: const HomePage()
    );
  }
}