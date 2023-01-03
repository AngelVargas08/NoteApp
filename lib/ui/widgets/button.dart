
import 'package:flutter/material.dart';
import 'package:notes_app/ui/utils/themes_color.dart';

// ignore: must_be_immutable
class ButtonGeneral extends StatelessWidget {
  final String title;
   VoidCallback onPressed;
   ButtonGeneral({super.key, required this.title,  required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: ThemeGeneral.colorSegundary,
      onPressed: onPressed,
      child: Text(title, style: ThemeGeneral.fontStyle,));
  }
}