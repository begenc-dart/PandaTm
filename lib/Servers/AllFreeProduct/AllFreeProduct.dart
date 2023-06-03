import 'dart:async';


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:serpay/IpAdress.dart';
import 'package:serpay/Model/Language.dart';

import 'package:serpay/Model/TextColor.dart';
import 'package:serpay/Servers/AllFreeProduct/FreeListProduct.dart';
import 'package:serpay/Servers/Model/AllFreeProduct.dart';
import 'package:serpay/darkMode/theme_services.dart';
import 'package:serpay/language.dart';

import '../Server/AllFreeProduct.dart';


class AllFreeProd extends StatefulWidget {
  LanguageModel lan;
  String url;
  AllFreeProd({required this.lan,required this.url});
  @override
  State<AllFreeProd> createState() => _AllFreeProdState();
}

class _AllFreeProdState extends State<AllFreeProd> {
  DateTime timers = DateTime.now();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(39, 39, 39, 1)
            : Color.fromRGBO(250, 250, 250, 1),
        title: Text(
          widget.lan.gosmaca.paylasMugt,
          style: CustomTextStyle.filterTop(context),
        ),
      ),
      body: FutureBuilder(
          future: AllFreeProductServer().fetchAlbum(),
          builder: (BuildContext context,
              AsyncSnapshot<AllFreeProduct> snapshot) {
            if (snapshot.hasData) {
              debugPrint(snapshot.toString());
              return CustomScrollView(slivers: [
               TimerClass( product: snapshot.data!, lan: widget.lan,url: widget.url,)
              ]);
            } else {
              debugPrint(snapshot.toString());
              return Center(child: CircularProgressIndicator(color: Colors.red,));
            }
          }),
    );
  }

}
class Timeer {
  int hours;
  int minutes;
  int seconds;
  Timeer({
    this.hours = 0,
    this.minutes = 0,
    this.seconds = 0,
  });
}
class TimerClass extends StatefulWidget {
AllFreeProduct product;
LanguageModel lan;
String url;

TimerClass({required this.product,required this.lan,required this.url});

  @override
  State<TimerClass> createState() => _TimerClassState();
}

class _TimerClassState extends State<TimerClass> {
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
    return SliverList(
      delegate: SliverChildBuilderDelegate(
            (context, index) => Column(
          children: [

            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [select.mainColo, select.freeProd],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Center(
                child: Container(
                    width: 250,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(255, 255, 255, 0.25),
                        borderRadius: BorderRadius.circular(10)),
                    child:timerow(times.hours,times.minutes,times.seconds)
                ),
              ),
            ),
            FreeListProduct(
              allFreeProduct: widget.product.data![index], time:times.hours, lan: widget.lan,url: widget.url,
            )
          ],
        ),
        childCount: widget.product.data!.length,
      ),
    );
  }

  timerow(int hour,int minut,int second){

    return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: SvgPicture.asset(
              "asset/MainPagePhoto/Group 42.svg"),
        ),
        time(
          hour.toString(),
        ),
        Text(
          ":",
          style: CustomTextStyle.DiscoutDot(context),
        ),
        time(
          minut.toString(),
        ),
        Text(
          ":",
          style: CustomTextStyle.DiscoutDot(context),
        ),
        time(
          second.toString(),
        ),
        SizedBox(
          width: 12,
        )
      ],
    );
  }
  time(String time) {


    return Container(
      width: 38,
      height: 36,
      decoration: BoxDecoration(
        color: select.tmcolo,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
          child: Text(
            time.toString(),
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 20,
                color: Color.fromRGBO(0, 0, 0, 1)),
          )),
    );
  }
}
