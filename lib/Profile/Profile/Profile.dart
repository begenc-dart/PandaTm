import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serpay/Profile/ContactUs/Contact.dart';

import 'package:serpay/Profile/GetMe/ModelGetMe.dart';
import 'package:serpay/Profile/GetMe/PostGetMe.dart';

import 'package:serpay/Profile/Profile/Like.dart';
import 'package:serpay/Profile/Profile/MessageCenter.dart';
import 'package:serpay/Profile/History/MyHistory.dart';

import 'package:serpay/Profile/ProfileEdit/ProfileSetting.dart';
import 'package:serpay/Profile/Profile/RadioButton.dart';
import 'package:serpay/Profile/Profile/Setting.dart';
import 'package:serpay/darkMode/theme_services.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../../IpAdress.dart';

import '../../Language/Language.dart';
import '../../language.dart';
import '../MyAddress/address.dart';
import '../Order/OrderHistory.dart';

class Profile extends StatefulWidget {
  final WebSocketChannel channel;

  Profile(this.channel);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String radioItem = 'Item 1';
  late Future<LanguageModel> languageModel;
  String url = "";

  language() async {
    await LanguageFileRead().then((value) {
      url = value;
    });
  }

  @override
  void initState() {
    language();
    languageModel = Language().fetchAlbum(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: languageModel,
        builder: (BuildContext context, AsyncSnapshot<LanguageModel> lan) {
          // debugPrint(snapshot.data.profile.toString());
          if (lan.hasData) {
            return SafeArea(
              child: Scaffold(
                body: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: FutureBuilder(
                          future: PostGetMe().fetchAlbum(),
                          builder: (BuildContext context,
                              AsyncSnapshot<ModelGetMe> snapshot) {
                            if (snapshot.hasData) {
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      snapshot.data!.image != null
                                          ? CircleAvatar(
                                              backgroundColor: Color.fromRGBO(
                                                  196, 196, 196, 1),
                                              backgroundImage: NetworkImage(
                                                "${IpAddress().ipAddress}/" +
                                                    snapshot.data!.image
                                                        .toString(),
                                              ),
                                              radius: 30,
                                            )
                                          : CircleAvatar(
                                              backgroundColor: Color.fromRGBO(
                                                  196, 196, 196, 1),
                                              backgroundImage: AssetImage("asset/Setting/No_Image_Available.png"),),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data!.username
                                                  .toString(),
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: ThemeServices().theme ==
                                                        ThemeMode.dark
                                                    ? Colors.white
                                                    : Colors.black,
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 5),
                                              child: Text(
                                                snapshot.data!.userPhone
                                                    .toString(),
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w400,
                                                  color:
                                                      ThemeServices().theme ==
                                                              ThemeMode.dark
                                                          ? Colors.white
                                                          : Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProfileSetting(
                                                      languageModel: lan.data!,
                                                      url: url)));
                                    },
                                    child: Icon(
                                      Icons.edit,
                                      color: ThemeServices().theme ==
                                              ThemeMode.dark
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  )
                                ],
                              );
                            } else {
                              return Container();
                            }
                          },
                        ),
                      ),
                      Row(

                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Deliver(
                                          a: "1",
                                          languageModel:
                                              lan.data!.profileDetails.sargyt,
                                          url: url,
                                        )));
                              },
                              child: profile(
                                  lan.data!.profileDetails.sargyt ,
                                  "asset/profile/clipboard (1).png"),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Deliver(
                                          a: "Garashylyar",
                                          languageModel:
                                              lan.data!.profileDetails.garas,
                                          url: url,
                                        )));
                              },
                              child: profile(lan.data!.profileDetails.garas,
                                  "asset/profile/delivery-time.png"),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Deliver(
                                          a: "Yatyryldy",
                                          languageModel:
                                              lan.data!.profileDetails.yatyryl,
                                          url: url,
                                        )));
                              },
                              child: profile(lan.data!.profileDetails.yatyryl,
                                  "asset/profile/package (1).png"),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => History(
                                            languageModel: lan.data!,
                                            url: url,
                                          )));
                                },
                                child: profile(
                                    lan.data!.profileDetails.taryhym ,
                                    "asset/profile/footprints.png")),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => WishLike(
                                          languageModel: lan.data!,
                                          url: url,
                                        )));
                              },
                              child: profile(
                                  lan.data!.profileDetails.halanlarym ,
                                  "asset/profile/heart1.png"),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                              onTap: () async {
                                await PostGetMe().fetchAlbum().then((value) {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Contact(
                                            lan: lan.data!,
                                            url: url,
                                          )));
                                });
                              },
                              child: profile(url=="tm"?"Admin":"Админ ",
                                  "asset/profile/support.png"),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MyAdressClass(
                                        url: url,
                                        profi: lan.data!.profileDetails,
                                      )));
                            },
                            child: Container(
                              margin:
                                  EdgeInsets.only(left: 5, right: 5, top: 20),
                              width: 75,
                              height: 80,
                              decoration: BoxDecoration(
                                  color: ThemeServices().theme == ThemeMode.dark
                                      ? Color.fromRGBO(55, 55, 55, 1)
                                      : Color.fromRGBO(246, 246, 246, 1)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: SvgPicture.asset(
                                      "asset/Setting/Address.svg",
                                      width: 20,
                                      height: 20,color: ThemeServices().theme == ThemeMode.dark
                                        ? Colors.white:Colors.black,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      top: 7,
                                      bottom: 10,
                                    ),
                                    child: Text(
                                      lan.data!.profileDetails.salgy,
                                      style: TextStyle(
                                          color: ThemeServices().theme ==
                                                  ThemeMode.dark
                                              ? Color.fromRGBO(174, 174, 174, 1)
                                              : Color.fromRGBO(65, 65, 65, 1),
                                          fontSize: MediaQuery.of(context).size.width*0.035),
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => Setting(
                                            url: url,
                                            profi: lan.data!.profileDetails,
                                            gosmaca: lan.data!.gosmaca,
                                          )));
                                },
                                child: profile(
                                    lan.data!.profileDetails.setting ,
                                    "asset/profile/settings 1.png")),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Scaffold(
              body: CircularProgressIndicator(),
            );
          }
        });
  }

  profile(String typeProfile, String asset) {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5, top: 20),
      width: 75,
      height: 79,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
          color: ThemeServices().theme == ThemeMode.dark
              ? Color.fromRGBO(55, 55, 55, 1)
              : Color.fromRGBO(246, 246, 246, 1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              width: 20,
              height: 20,
              child: Image.asset(
                asset,
                width: 20,
                height: 20,
                fit: BoxFit.fill,
                color: ThemeServices().theme == ThemeMode.dark
                  ? Colors.white:Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 7,
              bottom: 10,
            ),
            child: Text(
              typeProfile,
              style: TextStyle(
                  color: ThemeServices().theme == ThemeMode.dark
                      ? Color.fromRGBO(174, 174, 174, 1)
                      : Color.fromRGBO(65, 65, 65, 1),
                  fontSize: MediaQuery.of(context).size.width*0.035),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
