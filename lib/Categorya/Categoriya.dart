import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import 'package:serpay/IpAdress.dart';
import 'package:serpay/Model/CategpriyaModel.dart';
import 'package:serpay/Model/Colors.dart';
import 'package:serpay/Model/TextColor.dart';
import 'package:serpay/darkMode/theme_services.dart';

import '../Model/Language.dart';
import '../MainPage/PhotoIndex.dart';
import '../Providers.dart';
import '../Search/Search/Search.dart';
import '../Servers/OneProduct.dart';
import '../Ui/BarCode.dart';
import '../language.dart';
import 'Dukanlar/Dukanlar.dart';
import 'SubCategor/SubCategoriya.dart';
import 'package:http/http.dart' as http;

class Categoriya extends ConsumerStatefulWidget {
  const Categoriya({Key? key}) : super(key: key);

  @override
  ConsumerState<Categoriya> createState() {
    return _CategoriyaState();
  }
}

class _CategoriyaState extends ConsumerState<Categoriya>
    with SingleTickerProviderStateMixin {
  Colrs select = Colrs();
  Future<List<CategoriyaModel>>? categoriya;
  int a = 0;

  late TabController tabController;
  String url="";
  language()async{

    await LanguageFileRead().then((value) {
      url=value.toString();
    });

  }
  @override
  void initState() {
    // TODO: implement initState
    // categoriya = caregoriyaAlbum();
    ref.read(CategoriyaPro.catPor.notifier).add();
    language();
    languageModel=Language().fetchAlbum(context);
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }
  String data="";
  int san = 1;
  late Future<LanguageModel> languageModel;
  _scan()async{
    await FlutterBarcodeScanner.scanBarcode("#000000", "Yzy çyk", true, ScanMode.DEFAULT).then((value) => setState((){data=value;}));
    debugPrint(data);
    await fetchAlbum(data)!.then((value) {

      data!="-1"?
      {debugPrint(value.toString()),
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
          :"";
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = ref.read(CategoriyaPro.catPor.notifier);
    return FutureBuilder(
        future: languageModel,
        builder:
        (BuildContext context, AsyncSnapshot<LanguageModel> snapshot) {
      // debugPrint(snapshot.data.profile.toString());
      if (snapshot.hasData) {
        return Scaffold(
              appBar: AppBar(
                title: InkWell(
                  onTap: () {
                    showSearch(
                        context: context,
                        // delegate to customize the search bar
                        delegate: CustomSearchDelegate(checkBarcode: false, text: ' ', contexpro: context, data: snapshot.data!));
                  },
                  child: Container(

                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    height: 40,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(236, 236, 236, 1),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          snapshot.data!.gzleg,
                          style: TextStyle(
                              color: Color.fromRGBO(132, 132, 132, 0.48),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        InkWell(child: SvgPicture.asset("asset/icon/qr.svg"),onTap: ()async{
                          await _scan();
                        },)
                      ],
                    ),
                  ),
                ),
                // toolbarHeight: ,
                bottom: TabBar(
                  labelColor: Color.fromRGBO(255, 0, 0, 1),
                  controller: tabController,
                  unselectedLabelColor: Color.fromRGBO(104, 109, 118, 1),
                  indicatorColor: Colors.transparent,
                  // indicatorColor: Color.fromRGBO(255, 0, 0, 1),
                  onTap: (a) {
                    san = a;
                    setState(() {});
                  },
                  tabs: <Tab>[
                    Tab(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          san == 1
                              ? SvgPicture.asset(
                              "asset/bottom_nav_icon/categor_off.svg")
                              : SvgPicture.asset(
                              "asset/bottom_nav_icon/categor_on.svg"),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(snapshot.data!.kategoriya),
                          ),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.shopping_cart),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(snapshot.data!.dkan),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              body: TabBarView(controller: tabController, children: [
                Row(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height *0.77,
                      width: MediaQuery.of(context).size.width*0.25,
                      color: ThemeServices().theme == ThemeMode.dark
                          ? Color.fromRGBO(55, 55, 55, 1)
                          : select.searh,
                      child: ListView.builder(
                          itemCount: themeProvider.state.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                                onTap: () {
                                  setState(() {
                                    a = index;
                                  });
                                },
                                child: index == a
                                    ? Container(
                                    height: MediaQuery.of(context).size.height *0.06,
                                    color: ThemeServices().theme ==
                                        ThemeMode.dark
                                        ? Color.fromRGBO(97, 97, 97, 1)
                                        : select.scaf,
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              right: 15),
                                          width: 5,
                                          height: 40,
                                          color: select.mainColo,
                                        ),
                                        Expanded(
                                          child: Align(
                                            alignment:
                                            Alignment.centerLeft,
                                            child: Text(
                                              url=="ru"? themeProvider
                                                  .state[index]
                                                  .nameRu: themeProvider
                                                    .state[index]
                                                    .nameTm,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                style: CustomTextStyle
                                                    .cateStyle(
                                                    context)),
                                          ),
                                        ),
                                      ],
                                    ))
                                    : Container(
                                    margin: EdgeInsets.only(
                                        left: 10, right: 5),
                                    height: MediaQuery.of(context).size.height *0.06,
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                      url=="ru"? themeProvider
                                          .state[index].nameRu: themeProvider
                                            .state[index].nameTm,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style:
                                        CustomTextStyle.cateStyle(
                                            context),
                                      ),
                                    )));
                          }),
                    ),
                    themeProvider.state.length != 0
                        ? Subcategoriya(
                      subCate: themeProvider.state[a].subcategories!,
                      cate: themeProvider.state[a], url: url,lan: snapshot.data!,
                    )
                        : Container()
                  ],
                ),
                Dukanlar(lan: snapshot.data!,url: url,)
              ]));
      }
        else{
          return Scaffold(body: Center(child: CircularProgressIndicator(color: Colors.red,)));
      }
        });


  }
}
