import 'package:flutter/material.dart';
import 'package:serpay/Model/TextColor.dart';
import 'package:serpay/darkMode/theme_services.dart';

import '../Language/Language.dart';
import '../language.dart';

class Filter extends StatefulWidget {
  Filter({required this.maglumat});

  List maglumat = ["", "", "23", "Başlangyç ýagdaý"];

  @override
  _FilterState createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  final _formkey = GlobalKey<FormState>();
  late TextEditingController max =
      TextEditingController(text: widget.maglumat[0]);
  late String _max = widget.maglumat[0], _min = widget.maglumat[0];
  late TextEditingController min =
      TextEditingController(text: widget.maglumat[1]);
  String url="";
  language()async{
    await LanguageFileRead().then((value) {
      url = value;
    });
    setState(() {

    });
  }
  late String val = widget.maglumat[2];
  late String name ;
  late Future<LanguageModel> languageModel;
  @override
  void initState() {
    language();
    debugPrint(url.toString()+"fsdfsdf");
    // TODO: implement initState

languageModel=Language().fetchAlbum(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // debugPrint(widget.maglumat.toString() + "dsfsd");
    name= widget.maglumat[3]=="Defult"?url=="tm"?"Başlangyç ýagdaý":"по умолчанию":widget.maglumat[3];
    return FutureBuilder(

        future: languageModel,
        builder:
        (BuildContext context, AsyncSnapshot<LanguageModel> snapshot) {
      // debugPrint(snapshot.data.profile.toString());
      if (snapshot.hasData) {
        return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back)),
                  Text(
                   snapshot.data!.gosmaca.filer,
                    style: CustomTextStyle.filterTop(context),
                  ),
                  GestureDetector(
                    onTap: () {
                      max.clear();
                      min.clear();
                      val = "2";
                      name = snapshot.data!.onki;
                      setState(() {});
                    },
                    child: Text(
                      snapshot.data!.arassa,
                      style: CustomTextStyle.filterClear(context),
                    ),
                  ),
                ],
              ),
            ),
            body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20, horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              snapshot.data!.gosmaca.bahaArasy,
                              style: CustomTextStyle.priceRange(context),
                            ),
                            Form(
                              key: _formkey,
                              autovalidateMode: AutovalidateMode.always,
                              child: Row(
                                children: [
                                  Container(
                                    width: 80,
                                    height: 30,
                                    child: TextFormField(
                                      textAlign: TextAlign.left,
                                      textAlignVertical: TextAlignVertical.bottom,
                                      controller: min,
                                      // cursorColor: Color.fromRGBO(104, 109, 118, 1),
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        fillColor:
                                        ThemeServices().theme == ThemeMode.dark
                                            ? Color.fromRGBO(55, 55, 55, 1)
                                            : Colors.white,
                                        hintStyle:
                                        CustomTextStyle.fieldmax(context),
                                        errorStyle: CustomTextStyle.error(context),
                                        hintText: "min",
                                      ),
                                      // validator: (jog) {
                                      //   if (jog!.length == 0) {
                                      //     return "full";
                                      //   } else {
                                      //     return null;
                                      //   }
                                      // },
                                      onSaved: (deger) => _min = deger!,
                                    ),
                                  ),
                                  Container(
                                    width: 80,
                                    height: 30,
                                    margin: EdgeInsets.only(left: 10),
                                    child: TextFormField(
                                      textAlign: TextAlign.left,
                                      textAlignVertical: TextAlignVertical.bottom,

                                      controller: max,
                                      // cursorColor: Color.fromRGBO(104, 109, 118, 1),
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        fillColor:
                                        ThemeServices().theme == ThemeMode.dark
                                            ? Color.fromRGBO(55, 55, 55, 1)
                                            : Colors.white,
                                        hintStyle:
                                        CustomTextStyle.fieldmax(context),
                                        errorStyle: CustomTextStyle.error(context),
                                        hintText: "max",
                                      ),
                                      // validator: (jog) {
                                      //   if (jog!.length == 0) {
                                      //     return "full";
                                      //   } else {
                                      //     return null;
                                      //   }
                                      // },
                                      onSaved: (deger) => _max = deger!,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      ExpansionTile(
                        iconColor: ThemeServices().theme == ThemeMode.dark
                            ? Colors.white
                            : Color.fromRGBO(41, 41, 41, 1),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                             snapshot.data!.tertiplemek,
                              style: CustomTextStyle.priceRange(context),
                            ),
                            Text(
                              name,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: ThemeServices().theme == ThemeMode.dark
                                      ? Color.fromRGBO(250, 250, 250, 1)
                                      : select.recColor),
                            )
                          ],
                        ),
                        children: <Widget>[
                          RadioListTile(
                            activeColor: Colors.red,
                            controlAffinity: ListTileControlAffinity.trailing,
                            contentPadding: EdgeInsets.only(left: 30, right: 15),
                            value: "23",

                            groupValue: val,
                            onChanged: (deger) {
                              setState(() {
                                val = deger.toString();
                                name = snapshot.data!.onki;
                              });
                            },
                            title: Text(snapshot.data!.onki,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: ThemeServices().theme == ThemeMode.dark
                                        ? Color.fromRGBO(250, 250, 250, 1)
                                        : select.recColor)),
                          ),
                          RadioListTile(activeColor: Colors.red,
                            controlAffinity: ListTileControlAffinity.trailing,
                            contentPadding: EdgeInsets.only(left: 30, right: 15),
                            value: "0",
                            groupValue: val,
                            onChanged: (deger) {
                              setState(() {
                                val = deger.toString();
                                name = snapshot.data!.bahaArzan;
                              });
                            },
                            title: Text(snapshot.data!.bahaArzan,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: ThemeServices().theme == ThemeMode.dark
                                        ? Color.fromRGBO(250, 250, 250, 1)
                                        : select.recColor)),
                          ),
                          RadioListTile(activeColor: Colors.red,
                            controlAffinity: ListTileControlAffinity.trailing,
                            contentPadding: EdgeInsets.only(left: 30, right: 15),
                            value: "1",
                            groupValue: val,
                            onChanged: (deger) {
                              setState(() {
                                val = deger.toString();
                                name = snapshot.data!.bahaGymmat;
                              });
                            },
                            title: Text(snapshot.data!.bahaGymmat,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: ThemeServices().theme == ThemeMode.dark
                                        ? Color.fromRGBO(250, 250, 250, 1)
                                        : select.recColor)),
                          ), //Row
                          RadioListTile(activeColor: Colors.red,
                            controlAffinity: ListTileControlAffinity.trailing,
                            contentPadding: EdgeInsets.only(left: 30, right: 15),
                            value: "4",
                            groupValue: val,
                            onChanged: (deger) {
                              setState(() {
                                val = deger.toString();
                                name = snapshot.data!.tazeHaryt;
                              });
                            },
                            title: Text(snapshot.data!.tazeHaryt,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: ThemeServices().theme == ThemeMode.dark
                                        ? Color.fromRGBO(250, 250, 250, 1)
                                        : select.recColor)),
                          ),
                          RadioListTile(activeColor: Colors.red,
                            controlAffinity: ListTileControlAffinity.trailing,
                            contentPadding: EdgeInsets.only(left: 30, right: 15),
                            value: "3",
                            groupValue: val,
                            onChanged: (deger) {
                              setState(() {
                                val = deger.toString();
                                name = snapshot.data!.satylanlar;
                              });
                            },
                            title: Text(snapshot.data!.satylanlar,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: ThemeServices().theme == ThemeMode.dark
                                        ? Color.fromRGBO(250, 250, 250, 1)
                                        : select.recColor)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () =>
                        Navigator.of(context).pop([max.text, min.text, val, name]),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      margin: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: select.mainColo,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: select.shadowCol,
                              blurRadius: 6,
                              spreadRadius: 0,
                            )
                          ]),
                      alignment: Alignment.center,
                      child: Text(
                       snapshot.data!.gosmaca.result,
                        style: CustomTextStyle.showres(context),
                      ),
                    ),
                  )
                ]));
      }else{
      return CircularProgressIndicator();}
        });











  }
}
