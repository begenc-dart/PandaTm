

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:serpay/IpAdress.dart';
import 'package:serpay/Database/token.dart';
import 'package:serpay/Model/TextColor.dart';
import 'package:serpay/Model/AddressGet.dart';
import 'package:serpay/Services/AddressGetHttp.dart';
import 'package:serpay/Profile/MyAddress/MyAddres.dart';

import '../../Model/Language.dart';
import '../../darkMode/theme_services.dart';
import 'setAdres.dart';
import 'package:http/http.dart'as http;

class MyAdressClass extends StatefulWidget {
  ProfileDetails profi;
  String url;
  MyAdressClass({required this.url,required this.profi});
  @override
  State<MyAdressClass> createState() => _MyAdressClassState();
}

class _MyAdressClassState extends State<MyAdressClass> {


  Future<AddressGet>? getAd;

@override
  void initState() {
    // TODO: implement initState
  getAd=AddressGetHttp().addresGet();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(39, 39, 39, 1)
            : Color.fromRGBO(250, 250, 250, 1),
        automaticallyImplyLeading: true,
        elevation: 0,
        title: Text(
          widget.profi.salgy,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: ThemeServices().theme == ThemeMode.dark
                ? Colors.white
                : Colors.black,
          ),
        ),
      ),
      body:FutureBuilder(future: getAd,builder: (context, AsyncSnapshot<AddressGet> snapshot) {
        if(snapshot.hasData){
          return snapshot.data!.address!.length==0?  Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 4,
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.fromLTRB(15, 10, 15, 0),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(
                        color: const Color.fromRGBO(174, 174, 174, 1), width: 1)

                  //color: Color.fromRGBO(174, 174, 174, 1)
                ),
                child:  Center(
                  child: Text(
                    widget.profi.salg,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(174, 174, 174, 1)),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
                decoration: BoxDecoration(
                  color: select.mainColo,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: select.mainColo),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => AddAdress(url: widget.url, profi: widget.profi,)));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Icon(Icons.add),
                        SizedBox(width: 10),
                        Text(
                          widget.profi.addressAdd,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ):MyAddress(addres: snapshot.data!.address!,url: widget.url, profi: widget.profi,);
        }
        else{
          debugPrint(snapshot.toString());
          return Center(child: CircularProgressIndicator());
        }
      })
    );
  }
}
