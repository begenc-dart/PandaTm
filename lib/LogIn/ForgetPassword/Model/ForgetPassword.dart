import 'package:flutter/material.dart';
import 'package:serpay/LogIn/ForgetPassword/Model/ChangePassword.dart';
import 'package:serpay/LogIn/ForgetPassword/Model/Model/PatchModel.dart';
import 'package:serpay/Model/TextColor.dart';

import '../../../darkMode/theme_services.dart';
import 'Model/patchForget.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController login = TextEditingController();
  TextEditingController logInpassword = TextEditingController();
  late String _login, _logInpassword;
  final _formkey = GlobalKey<FormState>();
  late ForgetPasswordModel forgetPasswordModel;
  bool otomatikKontrol = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Açar sözüni unutdym",
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
                        padding: const EdgeInsets.only(left: 15, top: 5),
                        child: Text(
                          "Telefon belgiňiz:",
                          style: CustomTextStyle.drowDown(context),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.top,
                          controller: logInpassword,
                          style: TextStyle(color:ThemeServices().theme == ThemeMode.dark
                              ? Colors.white:Colors.black,),
                          // cursorColor: Color.fromRGBO(104, 109, 118, 1),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            // hintStyle:CustomTextStyle.fieldmax(context),

                            errorStyle: CustomTextStyle.error(context),
                            prefixText: "+993",
                          ),
                          validator: (jog) {
                            if (jog!.length < 8) {
                              return "Doly belgiňizi giriziň ";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (deger) => _logInpassword = deger!,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
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
                      "Açar sözüni unutdym",
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

      final ForgetPasswordModel signUp = await PacthForgetPassword()
          .createUser("+993$_logInpassword", context);
      setState(() {
        forgetPasswordModel = signUp;
      });
    } else {
      setState(() {
        otomatikKontrol = true;
      });
    }
  }
}
