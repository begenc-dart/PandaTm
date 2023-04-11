import 'package:flutter/material.dart';
import 'package:serpay/darkMode/theme_services.dart';

class Help extends StatelessWidget {
  String appbartitle;
  String contexttitle;
  Help({required this.appbartitle,required this.contexttitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(39, 39, 39, 1):Color.fromRGBO(250, 250, 250, 1),

        title: Text(
          appbartitle,
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 20, color: ThemeServices().theme==ThemeMode.dark?Colors.white:Colors.black,),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15,top: 10),
            child: Text(
contexttitle,              style: TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(174, 174, 174, 1):Colors.black,),
            ),
          )
        ],
      ),
    );
  }
}
