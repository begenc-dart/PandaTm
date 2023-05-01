import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:serpay/HttpModel/BannerGet.dart';
import 'package:serpay/Language/Language.dart';

import 'package:serpay/Ui/MainPage/Aksiya/Aksiya.dart';
import 'package:serpay/Ui/MainPage/SkidkaProduct/RefrestMainPage.dart';
import 'package:serpay/Ui/MainPage/search/Search.dart';
import 'package:serpay/language.dart';
import '../../../Model/Colors.dart';
import '../../../darkMode/theme_services.dart';
import '../../ChangeNotifierProvider/ChangeNotifierProv.dart';
import '../../IpAdress.dart';
import '../../LogIn/LogIn/Model/token.dart';
import '../../MainPage/MainPagee/Banner/banner.dart';
import '../../MainPage/MainPagee/ProductMainPage/ProductMainPage.dart';
import '../../MainPage/MainPagee/Skidka/Skidka.dart';
import '../../MainPage/Model/RandomProduct.dart';
import 'SkidkaProduct/Discount/DiscountProduct.dart';
import 'SkidkaProduct/TopProduct/TopProduct.dart';
import 'package:http/http.dart' as http;

class MainPage extends StatefulWidget {
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPos = 0;
  Colrs select = Colrs();
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  @override
  void initState() {
    // TODO: implement initState
    checkLan();
    scrollController = ScrollController();
    // scrollController = ScrollController()..addListener(_scrollListener);
    languageModel=Language().fetchAlbum(context);
    super.initState();
  }

  late ScrollController scrollController;
  String url="";
checkLan()async{

  await LanguageFileRead().then((value) {
    url = value;
  });
}


  String? _token;
  String checkLike = "";
  late List<RandomProduct> random;
  List<RandomProduct> randomProduct = [];
  String ip = IpAddress().ipAddress;


late Future<LanguageModel> languageModel;
  Future<bool> bannerAlbum({bool isrefest = false}) async {
    await Token().tokenDosyaOku().then((value) {
      _token = value;
    });
    await checkSignUp.dosyaOku().then((value) {
      checkLike = value;
    });
    if (isrefest) {
      current_page = 0;
    }

    final response = await http.get(
      Uri.parse(checkLike.toString().length == 4
          ? "${ip}/users/products?offset=$current_page"
          : "${ip}/public/products?offset=$current_page"),
      headers: checkLike.toString().length.toInt() == 4
          ? <String, String>{
              "Content-Type": "application/json",
              'Authorization': 'Bearer ${_token}',
            }
          : {},
    );

    debugPrint(response.body);
    if (response.statusCode == 200) {
      random = randomProductFromJson(response.body);

      if (isrefest) {
        randomProduct = random;

      } else {
        randomProduct.addAll(random);
      }
      current_page = current_page + 20;
      return true;
    } else {
      throw false;
    }
  }


  // void dispose() {
  //   scrollController.removeListener(_scrollListener);
  //   super.dispose();
  // }
  // void _scrollListener() async{
  //   print(scrollController.position.extentAfter);
  //   if (scrollController.position.extentAfter < scrollController.position.maxScrollExtent) {
  //
  //
  //   };
  //
  // }
RefreshController controller=RefreshController();
  Widget build(BuildContext context) {

    return Scaffold(
        floatingActionButton: FloatingActionButton.small(
          backgroundColor: Colors.white60,
          onPressed: () async {
            scrollController.animateTo(1,
                curve: Curves.linear, duration: Duration(milliseconds: 500));

            setState(() {});
          },
          child: Icon(Icons.keyboard_arrow_up_rounded),
        ),
        body: FutureBuilder(
            future: languageModel,
            builder:
                (BuildContext context, AsyncSnapshot<LanguageModel> snapshot) {
              // debugPrint(snapshot.data.profile.toString());
              if (snapshot.hasData) {
                return SmartRefresher(
                    controller: refreshController,

                    enablePullUp: true,
                    footer:
                        const ClassicFooter(loadStyle: LoadStyle.HideAlways),
                    onRefresh: () async {
                      final result = await bannerAlbum(isrefest: true);

                      if (result) {
                        refreshController.refreshCompleted();
                        setState(() {});
                      } else {
                        refreshController.refreshFailed();
                      }
                    },
                    onLoading: () async {
                      final result = await bannerAlbum();

                      setState(() {});
                      if (result) {
                        refreshController.loadComplete();
                      } else {
                        refreshController.loadFailed();
                      }
                    },
                    child: CustomScrollView(
                      controller: scrollController,
                      slivers: [
                        SliverAppBar(
                          backgroundColor: ThemeServices().theme == ThemeMode.light
                              ?select.mainColo:null,
floating: true,
                          title: Search(search: snapshot.data!.gzleg.toString(), data: snapshot.data!,),
                        ),
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              Container(
                                padding: EdgeInsets.only(
                                    bottom: 5,
                                    top: MediaQuery.of(context).size.height *
                                        0.01),
                                decoration: BoxDecoration(
                                    gradient:
                                        ThemeServices().theme == ThemeMode.light
                                            ? LinearGradient(
                                                colors: [
                                                    select.mainColo,
                                                    select.gradie
                                                  ],
                                                begin: Alignment.center,
                                                end: Alignment.bottomRight)
                                            : null,
                                    borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                        bottomLeft: Radius.circular(10))),
                                child: Stack(
                                  children: [
                                    ThemeServices().theme == ThemeMode.light
                                        ? Positioned(
                                            child: Image.asset(
                                                "asset/MainPagePhoto/gift-dynamic-gradient (1).png"),
                                            right: -70,
                                            top: 10,
                                          )
                                        : Container(),
                                    Column(
                                      children: [

                                        BannerMainPage(lan: snapshot.data!, url: '',),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Stack(
                                children: [
                                  // ThemeServices().theme == ThemeMode.light
                                  //     ? Positioned(
                                  //         left: -50,
                                  //         child: Image.asset(
                                  //             "asset/MainPagePhoto/bag-dynamic-color.png"))
                                  //     : Container(),
                                  Column(
                                    children: [
                                      Aksiya(
                                          img: "asset/bann/акция.jpg",
                                          namepro: snapshot.data!.asksiya),
                                      Stack(
                                        children: [
                                          // ThemeServices().theme ==
                                          //         ThemeMode.light
                                          //     ? Positioned(
                                          //         right: -50,
                                          //         child: Image.asset(
                                          //             "asset/MainPagePhoto/headphone-dynamic-color.png"))
                                          //     : Container(),
                                          Column(
                                            children: [
                                              NewProduct(
                                                img: "asset/bann/новые.jpg",
                                                namepro: snapshot.data!.tzeler,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                      child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 15,
                                                                  right: 8,
                                                                  top: 10),
                                                          child: InkWell(
                                                            onTap: () {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          ArzanladysProduct(
                                                                            sort:
                                                                                "0",
                                                                            page:
                                                                                0,
                                                                            checkpage:
                                                                                false,
                                                                            Ip: 'discount',
                                                                          )));
                                                            },
                                                            child: Skidka(
                                                              imgUrl:
                                                                  "asset/bann/скидка.jpg",
                                                              name: snapshot.data!.arzan,
                                                            ),
                                                          ))),
                                                  Expanded(
                                                      child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 15,
                                                            top: 10,
                                                            left: 8),
                                                    child: InkWell(
                                                      onTap: () {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        TopProduct(
                                                                          sort:
                                                                              "0",
                                                                          page:
                                                                              0,
                                                                          checkpage:
                                                                              false,
                                                                        )));
                                                      },
                                                      child: Skidka(
                                                        imgUrl:
                                                            "asset/Img/top.jpg",
                                                        name: snapshot.data!.top,
                                                      ),
                                                    ),
                                                  )),
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        ProductMainPage(
                          randomPro: randomProduct,
                        )
                      ],
                    ));
              }
              else{
                return CircularProgressIndicator();
              }
            })

        // refreshController.isTwoLevel || refreshController.isLoading
        //     ?
        // RefrestMainPage(
        //   nameTm: nameTm,
        //   priceOld: priceOld,
        //   images: images,
        //   bodyRu: bodyRu,
        //   discount: discount,
        //   Price: Price,
        //   nameRu: nameRu, bodyTm: bodyTm, caar: caar,
        // )
        //     :

        );
  }
}
