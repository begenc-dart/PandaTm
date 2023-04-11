import 'package:flutter/material.dart';
import 'package:serpay/Language/Language.dart';
import 'package:serpay/Profile/ContactUs/ContactUsModel.dart';

import '../../Model/Colors.dart';
import '../../Model/TextColor.dart';
class Contact extends StatefulWidget {
  LanguageModel lan;
  String url;
  Contact({required this.url, required this.lan});

  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  Colrs colrs = Colrs();
  int grvalue = 1;

  late String
      _signUpname,
      _signUpLogin,
      _signUpnumber,
      _message;

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.url=="tm"?"Admin bilen habarlaşmak":"Связаться с адмимом"),
      ),
      body: ListView(
        children: [

          Form(
            key: _formkey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Padding(
                  padding:
                  const EdgeInsets.only(left: 15, top: 15),
                  child: Text(
                    widget.lan.profileDetails.ady,
                    style: CustomTextStyle.drowDown(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.top,

                    // cursorColor: Color.fromRGBO(104, 109, 118, 1),

                    decoration: InputDecoration(
                      // hintStyle:CustomTextStyle.fieldmax(context),
                      errorStyle:
                      CustomTextStyle.error(context),
                      // hintText: "min",
                    ),
                    validator: (jog) {
                      if (jog!.length == 0) {
                        return widget.url=="tm"?"Adyňyzy doly girizmegiňizi hayyş edýarin":"Пожалуйста, введите ваше полное имя";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (deger) => _signUpname = deger!,
                  ),
                ),

                Padding(
                  padding:
                  const EdgeInsets.only(left: 15, top: 15),
                  child: Text(
                    widget.lan.telef,
                    style: CustomTextStyle.drowDown(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.top,

                    // cursorColor: Color.fromRGBO(104, 109, 118, 1),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixText: "+993",
                      // hintStyle:CustomTextStyle.fieldmax(context),
                      errorStyle:
                      CustomTextStyle.error(context),
                      // hintText: "min",
                    ),
                    validator: (jog) {
                      if (jog!.length == 0) {
                        return widget.url=="tm"?"Telefon belgiňizi giriziň":"Введите свой номер телефона";
                      } else {
                        return null;
                      }
                    },
                    onSaved: (deger) => _signUpnumber = deger!,
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 15, top: 15),
                  child: Text(
                   widget.url=="tm"? "Email (hökmany däl)":"Электронная почта (необязательно)",
                    style: CustomTextStyle.drowDown(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.top,

                    // cursorColor: Color.fromRGBO(104, 109, 118, 1),

                    decoration: InputDecoration(
                      // hintStyle:CustomTextStyle.fieldmax(context),
                      errorStyle:
                      CustomTextStyle.error(context),
                      // hintText: "min",
                    ),
                    // validator: (jog) {
                    //   if (jog!.length == 0) {
                    //     return "full";
                    //   } else {
                    //     return null;
                    //   }
                    // },
                    onSaved: (deger) => _signUpLogin = deger!,
                  ),
                ),
                Padding(
                  padding:
                  const EdgeInsets.only(left: 15, top: 15),
                  child: Text(
                   widget.url=="tm"? "Hatyňyz":"Ваше письмо",
                    style: CustomTextStyle.drowDown(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    maxLines: 4,
                    textAlignVertical: TextAlignVertical.top,

                    // cursorColor: Color.fromRGBO(104, 109, 118, 1),

                    decoration: InputDecoration(
                      // hintStyle:CustomTextStyle.fieldmax(context),
                      errorStyle:
                      CustomTextStyle.error(context),
                      // hintText: "min",
                    ),


                    onSaved: (deger) => _message = deger!,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: (){
              method();
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                  left: 15, right: 15, bottom: 5, top: 20),
              decoration: BoxDecoration(
                  color: select.mainColo,
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                widget.lan.profileDetails.ugrat,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: select.tmcolo),
              ),
            ),
          ),
        ],
      ),
    );
  }
  method(){
    if(_formkey.currentState!.validate()){
      _formkey.currentState!.save();

      Contact_Us_Model().createUser(_signUpname, _signUpLogin, _signUpnumber,_message,context,widget.url);
    }
    else{
      setState(() {

      });
    }
  }
}
