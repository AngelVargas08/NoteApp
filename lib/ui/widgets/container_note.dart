import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:notes_app/models/utils.dart';

import 'package:notes_app/ui/utils/themes_color.dart';

class ContainerData extends StatelessWidget {
  final String title;
  final int index;
  final bool value;
  final Function(bool?)? check;
  final Function(BuildContext) onPressed;
  const ContainerData(
      {super.key,
      required this.title,
      required this.check,
      required this.value, 
      required this.onPressed, 
      required this.index, 
      });

  @override
  Widget build(BuildContext context) {
      Utils utils = Utils();
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(), 
          children: [
          SlidableAction(
            onPressed: (context) => utils.editEvent(context, index),
            icon: Icons.edit,
            backgroundColor: Colors.green,
            borderRadius: BorderRadius.circular(15),
          ),
          SlidableAction(
            onPressed: onPressed,
            icon: Icons.delete,
            backgroundColor: Colors.redAccent,
            borderRadius: BorderRadius.circular(15),
          )
        ]),
        child: Container(
          padding: const EdgeInsets.all(25),
          width: 500,
          height: 100,
          decoration: BoxDecoration(
              color: ThemeGeneral.colorTerc,
              borderRadius: BorderRadius.circular(15)),
          child: _ContentContainer(
            title: title,
            value: value,
            check: check,
          ),
        ),
      ),
    );
  }
}

class _ContentContainer extends StatelessWidget {
  final String title;
  final bool value;
  final Function(bool?)? check;
  const _ContentContainer({
    Key? key,
    required this.title,
    required this.check,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: value, onChanged: check),
        Text(
          title,
          style:  TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold,
            decoration: (value)? TextDecoration.lineThrough:TextDecoration.none 
          ),
        )
      ],
    );
  }
}
