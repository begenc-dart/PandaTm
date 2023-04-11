import 'package:flutter/material.dart';
import 'package:serpay/darkMode/theme_services.dart';

import '../../../Model/TextColor.dart';

class Skidka extends StatelessWidget {
  String imgUrl, name;

  Skidka({required this.name, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10,top: 5,bottom: 5),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          gradient: LinearGradient(colors:  [
            ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(55, 55, 55, 1):Color.fromRGBO(255, 212, 213, 1),
            ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(55, 55, 55, 1):Color.fromRGBO(255, 243, 221, 1)
          ], begin: Alignment.centerLeft, end: Alignment.bottomRight),
          border:
          ThemeServices().theme==ThemeMode.light?    Border.all(color: Color.fromRGBO(255, 20, 29, 1), width: 0.5):Border.all(color: select.scaf, width: 0.5)),
      child: Row(
        children: [
          ClipRRect(borderRadius: BorderRadius.circular(5),child: Image.asset(imgUrl)),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(name, style: CustomTextStyle.Skidka(context)),
          )
        ],
      ),
    );
    ;
  }
}
