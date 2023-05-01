import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:serpay/Model/TextColor.dart';
import 'package:serpay/Profile/GetMe/PostGetMe.dart';
import 'package:serpay/Servers/FreeProductPerson/FreeProductTop.dart';
import 'package:serpay/Servers/Model/OneFreeProduct.dart';
import 'package:serpay/Servers/ProductAppBar/ProductAppBar.dart';
import 'package:serpay/Servers/ProductDescpiton/ProductDes.dart';
import 'package:serpay/darkMode/theme_services.dart';
import 'package:share/share.dart';

import '../Language/Language.dart';
import '../Model/Colors.dart';
import 'AllFreeProduct/AllFreeProduct.dart';
import 'Server/AllFreeProduct.dart';
import 'Server/OneFreeProductServer.dart';


class FreeProductPerson extends StatefulWidget {
  String ipAddress;
  LanguageModel lan;
  String url;
  FreeProductPerson({required this.ipAddress,required this.url,required this.lan});

  @override
  _FreeProductPersonState createState() => _FreeProductPersonState();
}

class _FreeProductPersonState extends State<FreeProductPerson> {
  
  int currentPos = 0;
  Colrs select = Colrs();
String paylas="";
  final _formkey = GlobalKey<FormState>();
  @override

 
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: OneFreeProductServer().fetchAlbum(widget.ipAddress),
          builder: (BuildContext context,
              AsyncSnapshot<OneFreeProduct> snapshot) {
            debugPrint(snapshot.toString());
            if (snapshot.hasData) {return Scaffold(
        body:
                 CustomScrollView(
                  slivers: [
                    ProductAppBar(image: snapshot.data!.freeProduct.images,),
                    ProductDesc(freeProduct: snapshot.data!.freeProduct, url: widget.url,lan: widget.lan,),
                    FreeProductTop(top: snapshot.data!.top5,)
                  ],
                ) ,bottomNavigationBar: TimerChild(id: snapshot.data!.freeProduct.freeproductId,lan: widget.lan,),);


            } else {
            return Container();
            }
          }),
    );

  }

  
}
class TimerChild extends StatefulWidget {
  String id;
  LanguageModel lan;
  TimerChild({required this.id,required this.lan});

  @override
  State<TimerChild> createState() => _TimerChildState();
}

class _TimerChildState extends State<TimerChild> {
  String paylas="";
  final _formkey = GlobalKey<FormState>();
  DateTime timeNow=DateTime.now();
  int hour=0;
  int minutes=0;
  int second=0;
  int convertDateTimeDisplay(String date) {

    final String day = DateFormat('dd').format(DateFormat('yyyy-MM-dd HH:mm:ss.SSS').parse(date));
    final String hours = DateFormat('HH').format(DateFormat('yyyy-MM-dd HH:mm:ss.SSS').parse(date));
    final String minuts = DateFormat('mm').format(DateFormat('yyyy-MM-dd HH:mm:ss.SSS').parse(date));
    final String seconds = DateFormat('ss').format(DateFormat('yyyy-MM-dd HH:mm:ss.SSS').parse(date));
    final int dayes=int.parse(day)-timeNow.day;
    final int hourcheck=int.parse(hours)-timeNow.hour;
    final int minutess=int.parse(minuts)-timeNow.minute;
    final int sec=int.parse(seconds)-timeNow.second;
    final int minut=60-timeNow.minute+int.parse(minuts);
    final int secondes=60-timeNow.second+int.parse(seconds);
    hour=minutess<0?dayes*24+hourcheck-1:dayes*24+hourcheck;
    debugPrint(timeNow.minute.toString());
    debugPrint(hourcheck.toString());
    minutes=sec<0?minut-1:minut;
    second=secondes;
    return dayes;
  }
  @override var times = Timeer(hours: 0, minutes: 0, seconds: 0);
  getTime()async{
    await AllFreeProductServer().fetchAlbum().then((value) {
      value.expireTime==null?"":   convertDateTimeDisplay(value.expireTime!).toString();
      times = Timeer(hours: minutes<0?hour-1:hour, minutes: minutes<0?minutes.abs():minutes, seconds: second);});
  }
  void initState() {
    getTime();
    // TODO: implement initState
    // startTime();

    Timer.periodic(const Duration(seconds: 1), (timer) { // use timer when you are offline and cancel it when you are back online
      times.hours>0?setState(() {
        if (times.seconds > 0) {
          times.seconds--;
        } else {
          if (times.minutes > 0) {
            times.minutes--;
          } else {
            times.minutes = 59;
            times.hours--;
          }
          times.seconds = 59;
        }
      }):times.hours;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 2,
          height: 50,
          decoration: BoxDecoration(
              color: ThemeServices().theme == ThemeMode.dark
                  ? Color.fromRGBO(39, 39, 39, 1)
                  : select.scaf,
              boxShadow: [
                BoxShadow(
                    color: select.shadowCol,
                    blurRadius: 20,
                    spreadRadius: -5,
                    offset: Offset.fromDirection(0, -4))
              ]),
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // SvgPicture.asset(
                //   "asset/icon/Group 42.svg",
                //   color: ThemeServices().theme == ThemeMode.dark
                //       ? Color.fromRGBO(250, 250, 250, 1)
                //       : Color.fromRGBO(39, 39, 39, 1),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Text(
                    "${times.hours}:${times.minutes}:${times.seconds}",
                    style: CustomTextStyle.freeProdcuttime(
                        context),
                  ),
                )
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            times.hours>0?FreeProductOwn().fetchAlbum(widget.id,context):"";
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 2,
            height: 50,
            decoration: BoxDecoration(
                color: times.hours>0?select.mainColo:Colors.black45,
                boxShadow: [
                  BoxShadow(
                      color: select.shadowCol, blurRadius: 6)
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                    "asset/MainPagePhoto/Share.svg"),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    widget.lan.gosmaca.paylas,
                    style: CustomTextStyle.productfotterPrice(
                        context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
  quit(String free) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: ThemeServices().theme == ThemeMode.dark
                ? Color.fromRGBO(55, 55, 55, 1)
                : Color.fromRGBO(250, 250, 250, 1),
            title: Center(
                child: Text(
                  "Paýlaşmagyň görnüşini saýlaň",
                  style: CustomTextStyle.quit(context),
                )),
            actions: [
              ButtonBar(
                buttonHeight: 40,
                buttonMinWidth: 115,
                alignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    // color: select.mainColo,
                    onPressed: () {
                      FreeProductOwn().fetchAlbum(free,context);
                    },
                    child: Text("Ozüm üçin",style: TextStyle(color: Colors.red),),
                  ),
                  TextButton(
                    // color: select.mainColo,
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                                builder: (BuildContext context, StateSetter setState) {
                                  return AlertDialog(
                                      backgroundColor: Colors.white,
                                      // contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      title: Column(
                                        children: [
                                          Text(
                                            "Dostun un gatnaşsan özüň üçin gatnaşyp bileňizok",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,),
                                            textAlign: TextAlign.center,),
                                          Text(
                                            "Dostun ucin paylasjak bolsan dostun nomerini girinin",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,),
                                            textAlign: TextAlign.center,),
                                          Form(
                                            key: _formkey,
                                            child: TextFormField(
                                              textAlignVertical:
                                              TextAlignVertical.top,

                                              // cursorColor: Color.fromRGBO(104, 109, 118, 1),
                                              keyboardType: TextInputType.number,

                                              decoration: InputDecoration(
                                                // hintStyle:CustomTextStyle.fieldmax(context),
                                                  errorStyle:
                                                  CustomTextStyle.error(context),
                                                  prefixText: "+993"
                                                // hintText: "min",
                                              ),
                                              validator: (jog) {
                                                if (jog!.length < 8) {
                                                  return "Doly nomerinizi girizin";
                                                } else {
                                                  return null;
                                                }
                                              },
                                              onSaved: (deger) => paylas = deger!,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: (){
                                                  Navigator.pop(context);
                                                },
                                                child: Container(
                                                  width: 100,
                                                  margin: EdgeInsets.only(top: 10),
                                                  height: 50,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.red,width: 1)),
                                                  child: Text("Cancel",style: TextStyle(color: Colors.red),textAlign: TextAlign.center,),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: (){
                                                  girisBilgi(context, free);
                                                },
                                                child: Container(
                                                  width: 100,
                                                  margin: EdgeInsets.only(top: 10,left: 10),
                                                  height: 50,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.red),
                                                  child: Text("Share",style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                  );
                                });});

                    },
                    child: Text("Dostym bilen",style: TextStyle(color: Colors.red),),
                  )
                ],
              )
            ],
          );
        });
  }
  void girisBilgi(BuildContext context,String free) async {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();

      FreeProductPost().fetchAlbum(free,"+993"+paylas,context);
    } else {
      setState(() {

      });
    }
  }
}
