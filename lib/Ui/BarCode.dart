import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:serpay/LogIn/LogIn/Model/checkSignUp.dart';
import 'package:serpay/LogIn/LogIn/Model/token.dart';
import 'package:serpay/MainPage/MainPagee/ProductMainPage/ProductMainPage.dart';

import 'package:serpay/MainPage/PhotoIndex.dart';
import 'package:serpay/Model/TextColor.dart';

import 'package:http/http.dart' as http;

import '../../../../IpAdress.dart';
import '../../../../MainPage/Model/DiscountModel.dart';
import '../../../../Search/Filter.dart';
import '../../../../darkMode/theme_services.dart';


// import 'DiscountGrid.dart';
// import 'DiscountList.dart';

import 'MainPage/SkidkaProduct/NewProduct/NewProductList.dart';
import 'MainPage/search/SearchMode.dart';

class MyHttpOverrids extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = ((cert, host, port) => true);
  }
}

class BarCodeProduct extends StatefulWidget {
  int sort;
  int page;
  bool checkpage;

  // String a;
  String productId;

  BarCodeProduct(
      {required this.sort,
      required this.page,
      required this.checkpage,
      required this.productId});

  @override
  State<BarCodeProduct> createState() => _BarCodeProductState();
}

class _BarCodeProductState extends State<BarCodeProduct> {
  late int totalPage;
  String checkLike = "";
  String? token;
  CheckSignUp checkSignUp = new CheckSignUp();

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  late DiscountModdel discountModel;
  int current_page = 0;
  String ip = IpAddress().ipAddress;
  bool check = false;
  int page = 0;

  List<Data> prod = [];

  late SearchModel _searchModel;
  String productcount = "";
  List a = [];
  String countPro = "";
  int b = 0;

  Future<bool> fetchAlbum({bool isrefest = false, int a = 0}) async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });
    await checkSignUp.dosyaOku().then((value) {
      checkLike = value;
    });
    if (isrefest) {
      current_page = 0;
    }
    debugPrint(a.toString());
    final response = await http.get(
      Uri.parse(checkLike.toString().length == 4
          ? "$ip/users/products/search?offset=$current_page&keyword=${widget.productId}&sort=$a"
          : "$ip/users/products/search?offset=$current_page&keyword=${widget.productId}&sort=$a"),
      headers: checkLike.toString().length.toInt() == 4
          ? <String, String>{
              "Content-Type": "application/json",
              'Authorization': 'Bearer ${token}',
            }
          : {},
    );
    b = a;
    debugPrint(response.body.toString() + 'dfsdf');
    debugPrint(current_page.toString() + "dsf");
    if (response.statusCode == 200) {
      _searchModel = searchModelFromJson(response.body);

      if (isrefest) {
        prod = _searchModel.products.rows != null
            ? _searchModel.products.rows
            : <Data>[];
        countPro = _searchModel.products.count.toString();
      } else {
        prod.addAll(_searchModel.products.rows);
        countPro = _searchModel.products.count.toString();
      }

      current_page = current_page + 10;

      setState(() {});
      return true;
    } else {
      return false;
    }
  }

  List filterinfo = ["", "", "2", "Defult"];

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.productId != "^"
                ? "Haryt ady:" + widget.productId
                : "Haryt ady: ",
            style: CustomTextStyle.profiledettails(context),
          ),
        ),
        body: SmartRefresher(
            controller: refreshController,
            enablePullUp: true,
            footer: const ClassicFooter(loadStyle: LoadStyle.HideAlways),
            onRefresh: () async {
              final result = await fetchAlbum(isrefest: true, a: b);
              if (result) {
                refreshController.refreshCompleted();
              } else {
                refreshController.refreshFailed();
              }
            },
            onLoading: () async {
              final result = await fetchAlbum();
              if (result) {
                refreshController.loadComplete();
              } else {
                refreshController.loadFailed();
              }
            },
            child: CustomScrollView(
              slivers: [
                SliverList(
                    delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            page = 0;
                            await fetchAlbum(isrefest: true, a: 23);
                            setState(() {});
                            refreshController.requestRefresh();
                          },
                          child: Container(
                            width: 100,
                            height: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: ThemeServices().theme == ThemeMode.dark
                                    ? Color.fromRGBO(55, 55, 55, 1)
                                    : select.searh,
                                border: widget.page != 0
                                    ? Border.all(color: select.searchtop)
                                    : Border.all(color: select.mainColo),
                                borderRadius: BorderRadius.circular(5)),
                            child: Text(
                              "Arzanladyşlar",
                              style: CustomTextStyle.discount(context),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            page = 1; //kopya
                            b == 0
                                ? await fetchAlbum(isrefest: true, a: 1)
                                : await fetchAlbum(isrefest: true, a: 0);
                            setState(() {});
                            refreshController.requestRefresh();
                          },
                          child: Container(
                            width: 100,
                            height: 30,
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(left: 14, right: 14),
                            decoration: BoxDecoration(
                                color: ThemeServices().theme == ThemeMode.dark
                                    ? Color.fromRGBO(55, 55, 55, 1)
                                    : select.searh,
                                border: widget.page != 1
                                    ? Border.all(color: select.searchtop)
                                    : Border.all(color: select.mainColo),
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Baha",
                                  style: CustomTextStyle.discount(context),
                                ),
                                SvgPicture.asset(
                                  "asset/MainPagePhoto/Group 337.svg",
                                  color: ThemeServices().theme == ThemeMode.dark
                                      ? Color.fromRGBO(250, 250, 250, 1)
                                      : Color.fromRGBO(41, 41, 41, 1),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            widget.checkpage == true
                                ? widget.checkpage = false
                                : widget.checkpage = true;
                            fetchAlbum(isrefest: true);
                            setState(() {});
                          },
                          child: Container(
                            width: 50,
                            height: 30,
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(left: 14, right: 14),
                            decoration: BoxDecoration(
                                color: ThemeServices().theme == ThemeMode.dark
                                    ? Color.fromRGBO(55, 55, 55, 1)
                                    : select.searh,
                                border: Border.all(color: select.searchtop),
                                borderRadius: BorderRadius.circular(5)),
                            child: widget.checkpage == false
                                ? SvgPicture.asset(
                                    "asset/MainPagePhoto/Group 87.svg",
                                    color:
                                        ThemeServices().theme == ThemeMode.dark
                                            ? Color.fromRGBO(250, 250, 250, 1)
                                            : Color.fromRGBO(41, 41, 41, 1),
                                  )
                                : SvgPicture.asset(
                                    "asset/MainPagePhoto/Group 88.svg",
                                    color:
                                        ThemeServices().theme == ThemeMode.dark
                                            ? Color.fromRGBO(250, 250, 250, 1)
                                            : Color.fromRGBO(41, 41, 41, 1),
                                  ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(
                                    builder: (context) => Filter(
                                          maglumat: filterinfo,
                                        )))
                                .then((value) {
                              filterinfo = value != null
                                  ? value
                                  : ["", "", "2", "Defult"];
                              widget.sort = value != null ? value[2] : "";
                              refreshController.requestRefresh();
                            });
                          },
                          child: Container(
                            width: 50,
                            height: 30,
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(left: 14, right: 14),
                            decoration: BoxDecoration(
                                color: ThemeServices().theme == ThemeMode.dark
                                    ? Color.fromRGBO(55, 55, 55, 1)
                                    : select.searh,
                                border: Border.all(color: select.searchtop),
                                borderRadius: BorderRadius.circular(5)),
                            child: SvgPicture.asset(
                              "asset/MainPagePhoto/Vector (1).svg",
                              color: ThemeServices().theme == ThemeMode.dark
                                  ? Color.fromRGBO(250, 250, 250, 1)
                                  : Color.fromRGBO(41, 41, 41, 1),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ])),
                widget.checkpage == true
                    ? NewProductList(newProduct: prod, url: "tm",)
                    :ProductMainPage( randomPro: prod,)
              ],
            )));
  }
}
