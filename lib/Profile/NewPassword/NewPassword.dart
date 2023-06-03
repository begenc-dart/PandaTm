import 'package:flutter/material.dart';
import 'package:serpay/Services/ChangePasswordModel.dart';
import 'package:serpay/Model/TextColor.dart';
import 'package:serpay/Services/NewPasswordPath.dart';

import '../../Model/NewPasswordModel.dart';



class NewPassword extends StatefulWidget {

String url;
NewPassword({required this.url});
  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  bool _passwordVisible=false;
  bool _newpas=false;
  bool _newPascon=false;
  late String confirmPas,_loginpasswordAgain, _logInpassword;
  final _formkey = GlobalKey<FormState>();
 late NewPaswordModel _newPaswordModel;
  bool otomatik=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.url=="tm"?"Açar sözini çalyşmak":"Заменить ключевое слово",
          style: CustomTextStyle.profiledettails(context),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Form(
                  key: _formkey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 15),
                        child: Text(
                          widget.url=="tm"?"Häzirki açar söziňiz:":"Ваше текущее ключевое пароль:",
                          style: CustomTextStyle.drowDown(context),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.top,

                          // cursorColor: Color.fromRGBO(104, 109, 118, 1),
                          obscureText: !_passwordVisible,

                          decoration: InputDecoration(
                            suffixIcon:
                            IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                _passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });},),
                            // hintStyle:CustomTextStyle.fieldmax(context),
                            errorStyle: CustomTextStyle.error(context),
                            // hintText: "min",
                          ),
                          // validator: (jog) {
                          //   if (jog!.length == 0) {
                          //     return "full";
                          //   } else {
                          //     return null;
                          //   }
                          // },
                          onSaved: (deger) => confirmPas = deger!,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 15),
                        child: Text(
                          widget.url=="tm"?"Täze açar söziňiz:":"Ваше новое ключевое пароль:",
                          style: CustomTextStyle.drowDown(context),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.top,

                          // cursorColor: Color.fromRGBO(104, 109, 118, 1),
                          obscureText: !_newpas,
                          decoration: InputDecoration(
                            suffixIcon:
                            IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                _newpas
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  _newpas = !_newpas;
                                });},),
                            // hintStyle:CustomTextStyle.fieldmax(context),
                            errorStyle: CustomTextStyle.error(context),
                            // hintText: "min",
                          ),
                          // validator: (jog) {
                          //   if (jog!.length == 0) {
                          //     return "full";
                          //   } else {
                          //     return null;
                          //   }
                          // },
                          onSaved: (deger) => _loginpasswordAgain = deger!,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 5),
                        child: Text(
                          widget.url=="tm"?"Täze açar sözini tassyklan:":"Подтвержденный новый пароль:",
                          style: CustomTextStyle.drowDown(context),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.top,

                          // cursorColor: Color.fromRGBO(104, 109, 118, 1),

                          obscureText: !_newPascon,
                          decoration: InputDecoration(
                            suffixIcon:
                            IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                _newPascon
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  _newPascon = !_newPascon;
                                });},),
                            // hintStyle:CustomTextStyle.fieldmax(context),

                            errorStyle: CustomTextStyle.error(context),
                            // hintText: "min",
                          ),
                          // validator: (jog) {
                          //   if (jog!.length == 0) {
                          //     return "full";
                          //   } else {
                          //     return null;
                          //   }
                          // },
                          onSaved: (deger) => _logInpassword = deger!,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: (){
                    girisBilgi(context);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 15, right: 15, bottom: 5),
                    decoration: BoxDecoration(
                        color: select.mainColo,
                        borderRadius: BorderRadius.circular(10)),
                    child: Text(
                      widget.url=="tm"?"Ýatda sakla":"сохранять",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: select.tmcolo),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  void girisBilgi(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();

      final NewPaswordModel signUp = await NewPasswordPatch().createUser(confirmPas,_loginpasswordAgain,_logInpassword,context);
      setState(() {
        _newPaswordModel = signUp;
      });
    } else {
      setState(() {
        otomatik = true;
      });
    }
  }
}
