import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:serpay/darkMode/theme_provider.dart';
import 'package:serpay/darkMode/theme_services.dart';

import '../../../HttpModel/BannerGet.dart';
import '../../../Language/Language.dart';
import '../../../LogIn/LogIn/LogIn.dart';
import '../../../Model/TextColor.dart';
import '../../../Profile/GetMe/PostGetMe.dart';
import '../../../Profile/Profile/MessageCenter.dart';
import '../../../Search/Search/Search.dart';
import '../../../Servers/OneProduct.dart';
import '../../../language.dart';
import '../../../main.dart';
import '../../BarCode.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class Search extends StatefulWidget {
  String search;
  LanguageModel data;

  Search({required this.search, required this.data});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  //const Search({Key? key}) : super(key: key);
  ThemeProvider? themeProvider = ThemeProvider();
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // Barcode? result;

  String url = "";

  language() async {
    await LanguageFileRead().then((value) {
      url = value;
    });
  }

  _scan() async {
    await FlutterBarcodeScanner.scanBarcode(
            "#000000", "Yzy çyk", true, ScanMode.DEFAULT)
        .then((value) => setState(() {
              data = value;
            }));
    debugPrint(data);
    await fetchAlbum(data).then((value) {
      data != "-1"
          ? {
              debugPrint(value.toString()),
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BarCodeProduct(
                            checkpage: false,
                            sort: 0,
                            page: 0,
                            productId: value == null
                                ? "^"
                                : value.product.oneProduct.nameTm,
                          )))
            }
          : "";
    });
  }

  String data = "";

  @override
  void initState() {
    // TODO: implement initState
    language();
    // FlutterMobileVision.start().then((x) => setState(() {
    //       _isInitialized = true;
    //     }));
    method();

    super.initState();
  }

  method() async {
    await checkSignUp.dosyaOku().then((value) {
      checkLike = value;
    });
  }

  @override
  void dispose() {
    // controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
            onTap: () {
              ThemeServices().switchTheme();
              setState(() {});
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MaterialPageMain()),
                  (Route<dynamic> route) => false);
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: ThemeServices().theme == ThemeMode.light
                  ? SvgPicture.asset("asset/icon/Subtract (2).svg")
                  : SvgPicture.asset("asset/Setting/light.svg"),
            )),

        Expanded(
          child: InkWell(
            onTap: () {
              showSearch(
                  context: context,
                  // delegate to customize the search bar
                  delegate: CustomSearchDelegate(
                      checkBarcode: false,
                      text: ' ',
                      contexpro: context,
                      data: widget.data));
            },
            child: Container(
              // margin: const EdgeInsets.only(left: 20, right: 20),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(left: 15, right: 15),
              height: 40,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: select.searh,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.search,
                    style: CustomTextStyle.searchStyle(context),
                  ),
                  InkWell(
                      child: SvgPicture.asset("asset/icon/qr.svg"),
                      onTap: () async {
                        await _scan();
                        debugPrint(data.toString());
                      })
                ],
              ),
            ),
          ),
        ),
        InkWell(
            onTap: () async {
              debugPrint(checkLike.toString());
              if (checkLike.toString().length == 4) {
                await PostGetMe().fetchAlbum().then((value) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MessagesNot(
                            userid: value.userId!,
                            nickname: value.nickname!,
                            languageModel: widget.data,
                            url: url,
                          )));
                });
              } else {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LogIn()));
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: SvgPicture.asset(
                "asset/icon/Group 59 (1).svg",
              ),
            ))
        //color: ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(174, 174, 174, 1):Colors.white,)
      ],
    );
  }

  fun() {
    setState(() {});
  }
}
