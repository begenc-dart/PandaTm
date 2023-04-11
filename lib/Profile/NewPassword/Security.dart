import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../Language/Language.dart';
import '../../darkMode/theme_services.dart';
import 'NewPassword.dart';

class Security extends StatefulWidget {
  ProfileDetails profi;
  String url;
  Security({required this.url,required this.profi});

  @override
  _SecurityState createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.profi.gorag),
      ),
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 10),
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: ThemeServices().theme == ThemeMode.dark
                    ? Color.fromRGBO(55, 55, 55, 1)
                    : Color.fromRGBO(246, 246, 246, 1),
              ),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>NewPassword(url: widget.url,)));
                },
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15, right: 10),
                      child: ThemeServices().theme == ThemeMode.dark
                          ? SvgPicture.asset("asset/productIcon/Group 195.svg")
                          : SvgPicture.asset(
                              "asset/productIcon/Group 195 (1).svg"),
                    ),
                    Text(
                      widget.profi.aar,
                      style: ThemeServices().theme == ThemeMode.dark
                          ? TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(174, 174, 174, 1))
                          : TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(41, 41, 41, 1)),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
