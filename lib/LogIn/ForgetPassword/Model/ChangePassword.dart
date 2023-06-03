import 'package:flutter/material.dart';
import 'package:serpay/Services/ChangePasswordModel.dart';
import 'package:serpay/Model/TextColor.dart';

import '../../../darkMode/theme_services.dart';
import '../../../Model/passwordModel.dart';

class ChangePassword extends StatefulWidget {

String phone;
ChangePassword({required this.phone});

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  bool _passwordVisible=false;
  bool _pasword=false;
  late String _loginpasswordAgain, _logInpassword;
  final _formkey = GlobalKey<FormState>();
late ChangePasModel changePasModel;
bool otomatik=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Açar sözini çalysmak",
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
                          "Täze açar sözi:",
                          style: CustomTextStyle.drowDown(context),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(style: TextStyle(color:ThemeServices().theme == ThemeMode.dark
                            ? Colors.white:Colors.black,),
                          textAlignVertical: TextAlignVertical.top,

                          // cursorColor: Color.fromRGBO(104, 109, 118, 1),
                          obscureText: !_pasword,
                          decoration: InputDecoration(

                            suffixIcon:
                            IconButton(
                              icon: Icon(
                                // Based on passwordVisible state choose the icon
                                _pasword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                // Update the state i.e. toogle the state of passwordVisible variable
                                setState(() {
                                  _pasword = !_pasword;
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
                          "Täze açar sözini tassyklan:",
                          style: CustomTextStyle.drowDown(context),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(style: TextStyle(color:ThemeServices().theme == ThemeMode.dark
                            ? Colors.white:Colors.black,),
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
                      "Save",
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

      final ChangePasModel signUp = await ChangePaswModel().createUser(widget.phone,_loginpasswordAgain,_logInpassword,context);
      setState(() {
        changePasModel = signUp;
      });
    } else {
      setState(() {
        otomatik = true;
      });
    }
  }
}
