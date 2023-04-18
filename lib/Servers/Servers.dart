import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serpay/Model/TextColor.dart';


import '../Language/Language.dart';
import '../Model/Colors.dart';
import '../language.dart';
import 'AllFreeProduct/AllFreeProduct.dart';
import 'FreeProduct.dart';

class Servers extends StatefulWidget {
  const Servers({Key? key}) : super(key: key);

  @override
  _ServersState createState() => _ServersState();
}

class _ServersState extends State<Servers> {
  Colrs select = Colrs();
  late Future<LanguageModel> languageModel;
  String url="";
  language() async {
    await LanguageFileRead().then((value) {
      url = value;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    language();
    languageModel = Language().fetchAlbum(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: FutureBuilder(
        future: languageModel,
        builder: (BuildContext context, AsyncSnapshot<LanguageModel> snapshot) {
      // debugPrint(snapshot.data.profile.toString());
      if (snapshot.hasData) {
        return  ListView(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: SvgPicture.asset("asset/icon/FreeProd.svg"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15,bottom: 15,left: 5),
                  child: Text(
                   snapshot.data!.hyzmat,
                    style: CustomTextStyle.server(context),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => AllFreeProd(lan: snapshot.data!,url: url,)));
              },
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.all(15),
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: select.serverShadowColor,
                            offset: const Offset(
                              0,
                              50.0,
                            ),
                            blurRadius: 30.0,
                            spreadRadius: -20.0,
                          ),
                          
                        ],
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage(
                              "asset/ProfileIcon/boldy indi.png",
                            ),
                            fit: BoxFit.fill)),
                  ),

                ],
              ),
            )
          ],
        );}
        else{
        return CircularProgressIndicator();}
        })





      ),
    );
  }
}
