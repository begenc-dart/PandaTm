import 'package:flutter/material.dart';

import '../../../darkMode/theme_services.dart';

class SnackBarMessage{
  void showToastEdit(BuildContext context,String info) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        backgroundColor: ThemeServices().theme ==
            ThemeMode.dark
            ? Colors.black87:Colors.white,
        margin: EdgeInsets.only(bottom: 50),
        duration: Duration(milliseconds: 1000),
        content: Container(
            width: MediaQuery.of(context).size.width,
            child: Text(info,style: TextStyle(color: ThemeServices().theme !=
                ThemeMode.dark
                ? Colors.black87:Colors.white,),)),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}