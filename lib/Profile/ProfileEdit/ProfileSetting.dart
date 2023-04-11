import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:serpay/Language/Language.dart';
import 'package:serpay/Model/Colors.dart';
import 'package:serpay/Model/TextColor.dart';
import 'package:serpay/Profile/ProfileEdit/UpdateInfo.dart';
import 'package:serpay/darkMode/theme_services.dart';

import '../../IpAdress.dart';
import '../../LogIn/LogIn/Model/checkSignUp.dart';
import '../../language.dart';
import '../../main.dart';
import '../GetMe/ModelGetMe.dart';
import '../GetMe/PostGetMe.dart';

class ProfileSetting extends StatefulWidget {
  LanguageModel languageModel;
  String url;
  ProfileSetting({required this.languageModel,required this.url});

  @override
  _ProfileSettingState createState() => _ProfileSettingState();
}

class _ProfileSettingState extends State<ProfileSetting> {
  late String _name, _phone, _log;
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(39, 39, 39, 1)
            : Color.fromRGBO(250, 250, 250, 1),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back)),
            Text(
              widget.languageModel.profileDetails.profile,
              style: CustomTextStyle.profiledettails(context),
            ),
            GestureDetector(
                onTap: () {
                  quit();

                },
                child: SvgPicture.asset("asset/productIcon/log-out.svg"))
          ],
        ),
      ),
      body: FutureBuilder(
          future: PostGetMe().fetchAlbum(),
          builder: (BuildContext context, AsyncSnapshot<ModelGetMe> snapshot) {
            if (snapshot.hasData) {
              return ListView(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
              imageFileList.path.isNotEmpty? CircleAvatar(
                  radius: 70,
                  backgroundImage: FileImage(File(imageFileList.path))):
                      snapshot.data!.image!=null?CircleAvatar(
                        radius: 70,
                        backgroundColor: Color.fromRGBO(196, 196, 196, 1),

                        backgroundImage: NetworkImage(
                          "${IpAddress().ipAddress}/" +
                              snapshot.data!.image.toString(),
                        ),
                      ) : imageFileList.path.isEmpty&&snapshot.data!.image==null?CircleAvatar(
                        radius: 70,
                        backgroundColor: Color.fromRGBO(196, 196, 196, 1),
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 70,
                        ),

                      ):Container(),
                      InkWell(
                        onTap: () {
                          selectImages();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10,bottom: 10),
                          child: Text(
                            widget.url=="tm"?"Surady üýtgetmek":"Изменить изображение",
                            style: CustomTextStyle.changePhoto(context),
                          ),
                        ),
                      ),
                      Form(
                        key: _formkey,
                        autovalidateMode: AutovalidateMode.always,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 15),
                              child: Text(
                                widget.languageModel.profileDetails.ady,
                                style: CustomTextStyle.drowDown(context),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.top,
                                initialValue:
                                    snapshot.data!.username.toString(),

                                // cursorColor: Color.fromRGBO(104, 109, 118, 1),
                                style: TextStyle(
                                    fontSize: 18,
                                    color:
                                        ThemeServices().theme == ThemeMode.dark
                                            ? Colors.white
                                            : Color.fromRGBO(55, 55, 55, 1)),

                                decoration: InputDecoration(
                                  fillColor:
                                      ThemeServices().theme == ThemeMode.dark
                                          ? Color.fromRGBO(55, 55, 55, 1)
                                          : Colors.white,

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
                                onSaved: (deger) => _name = deger!,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 5),
                              child: Text(
                                widget.languageModel.profileDetails.login,
                                style: CustomTextStyle.drowDown(context),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: TextFormField(
                                textAlignVertical: TextAlignVertical.top,
                                initialValue:
                                    snapshot.data!.nickname.toString(),
                                // cursorColor: Color.fromRGBO(104, 109, 118, 1),
                                style: TextStyle(
                                    fontSize: 18,
                                    color:
                                        ThemeServices().theme == ThemeMode.dark
                                            ? Colors.white
                                            : Color.fromRGBO(55, 55, 55, 1)),

                                decoration: InputDecoration(
                                  fillColor:
                                      ThemeServices().theme == ThemeMode.dark
                                          ? Color.fromRGBO(55, 55, 55, 1)
                                          : Colors.white,

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
                                onSaved: (deger) => _log = deger!,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 5),
                              child: Text(
                                widget.languageModel.profileDetails.phone,
                                style: CustomTextStyle.drowDown(context),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 15, right: 15, top: 15),
                              child: TextFormField(
                                textAlign: TextAlign.left,
                                textAlignVertical: TextAlignVertical.center,
                                initialValue:
                                    snapshot.data!.userPhone.toString(),
                                readOnly: true,
                                // cursorColor: Color.fromRGBO(104, 109, 118, 1),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  fillColor:
                                      ThemeServices().theme == ThemeMode.dark
                                          ? Color.fromRGBO(55, 55, 55, 1)
                                          : Colors.white,

                                  // hintStyle: CustomTextStyle.fieldmax(context),
                                  errorStyle: CustomTextStyle.error(context),
                                  // hintText: "max",
                                ),
                                style: TextStyle(
                                    fontSize: 18,
                                    color:
                                        ThemeServices().theme == ThemeMode.dark
                                            ? Colors.white
                                            : Color.fromRGBO(55, 55, 55, 1)),
                                // validator: (jog) {
                                //   if (jog!.length == 0) {
                                //     return "full";
                                //   } else {
                                //     return null;
                                //   }
                                // },
                                onSaved: (deger) => _phone = deger!,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      logInOpen(context);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 15, right: 15, bottom: 5,top: 15),
                      decoration: BoxDecoration(
                          color: select.mainColo,
                          borderRadius: BorderRadius.circular(10)),
                      child: Text(
                        widget.languageModel.profileDetails.yatda,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: select.tmcolo),
                      ),
                    ),
                  ),
                ],
              );
            } else {
              return Container();
            }
          }),
    );
  }

  void logInOpen(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
      UpdateMe().createUser(_name, _log, imageFileList, context,widget.url);

      setState(() {});
    } else {
      setState(() {});
    }
  }

  final ImagePicker imagePicker = ImagePicker();

  late XFile imageFileList = XFile("");

  void selectImages() async {
    final XFile? selectedImages =
        await imagePicker.pickImage(source: ImageSource.gallery);
debugPrint(selectedImages!.path.toString());
    imageFileList = selectedImages;

    setState(() {});
  }

  quit() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: ThemeServices().theme == ThemeMode.dark
                ? Color.fromRGBO(39, 39, 39, 1)
                : Colors.white,
            title: Center(
                child: Text(
              widget.url=="tm"?"Siz hakykatdanam çykmakçymy?":"Вы действительно выходишь?",
              style: CustomTextStyle.quit(context),
            )),
            actions: [
              ButtonBar(
                alignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        widget.url=="tm"?"Ýok":"Нет",
                        style: CustomTextStyle.yok(context),
                      )),
                  InkWell(
                    onTap: ()async {
                      await CheckSignUp().dosyaYaz("false");
                      LanguageFileWrite('tm');
                      // setState(() {});
// logInOpen(context, snapshot.data!.productId!, snapshot.data!.subcategory!.subcategoryId!, snapshot.data!.category!.categoryCategoryId!);
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => MaterialPageMain()),
                            (Route<dynamic> route) => false,
                      );
                    },
                    child: Container(

                      child: Text(widget.url=="tm"?"Hawa":"Да",style: TextStyle(color: Colors.red),),
                    ),
                  )
                ],
              )
            ],
          );
        });
  }
}
