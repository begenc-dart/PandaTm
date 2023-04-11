import 'package:flutter/material.dart';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:serpay/LogIn/LogIn/Model/checkSignUp.dart';
import 'package:serpay/LogIn/LogIn/Model/token.dart';
import 'package:serpay/MainPage/Model/Action.dart';
import 'package:serpay/MainPage/Model/BannerProdcutModel.dart';

import 'package:serpay/MainPage/PhotoIndex.dart';
import 'package:serpay/Model/TextColor.dart';

import 'package:http/http.dart' as http;

import '../../../../IpAdress.dart';
import '../../../../MainPage/Model/SellerProduct.dart';
import '../../../../Search/Filter.dart';
import '../../../../darkMode/theme_services.dart';

import '../ActionProduct/Action.dart';
import 'OwnGrid.dart';
import 'OwnList.dart';
import 'OwnProductModel.dart';

class OwnProduct extends StatefulWidget {
  String sort;
  int page;
  bool checkpage;
  String brend;
  String nameBrenad;
  OwnProduct(
      {required this.sort,
        required this.page,
        required this.checkpage,
        required this.brend,
        required this.nameBrenad});
  @override
  State<OwnProduct> createState() => _OwnProductState();
}

class _OwnProductState extends State<OwnProduct> {
  late int totalPage;

  final RefreshController refreshController =
  RefreshController(initialRefresh: true);
  late OwnProductModel bannerProductProduct;
  int current_page = 0;
  String ip = IpAddress().ipAddress;
  List<OwnRow> prod=[] ;
// late Seller seller;
  String checkLike = "";
  String? token;
  CheckSignUp checkSignUp = new CheckSignUp();
  String count="";
  int b=0;
  Future<bool> fetchAlbum({bool isrefest = false,int a=0}) async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });
    await checkSignUp.dosyaOku().then((value) {
      checkLike = value;
    });
    // ("sdas");
    if (isrefest) {
      current_page = 0;
    }
b=a;
    final response = await http.get(Uri.parse(
        checkLike.toString().length == 4 ?
         "$ip/public/products/own?offset=$current_page&sort=${a}&max_price=${filterinfo[0]}&min_price=${filterinfo[1]}&limit=10"
            : "$ip/public/products/own?offset=$current_page&sort=${a}&max_price=${filterinfo[0]}&min_price=${filterinfo[1]}&limit=10"
          ),
      headers: checkLike.toString().length.toInt() == 4
          ? <String, String>{
        "Content-Type": "application/json",
        'Authorization': 'Bearer ${token}',
      }
          : {},);
    (response.body.toString() + 'dfsdf');

    if (response.statusCode == 200) {
      (response.statusCode.toString());
      bannerProductProduct = ownProductModelFromJson(response.body);

      (response.statusCode.toString());
      if (isrefest) {
        prod = bannerProductProduct.rows;
        count=bannerProductProduct.count.toString();
        // seller=bannerProductProduct.seller;
      } else {
        prod.addAll(bannerProductProduct.rows);
      }
      ("new");
      current_page = current_page + 10;

      setState(() {});
      return true;
    } else {
      return false;
    }
  }

  List filterinfo = ["", "", "2", "Defult"];
  @override
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(
           "Serpay",
            style: CustomTextStyle.profiledettails(context),
          ),
        ),
        body: SmartRefresher(
            controller: refreshController,
            enablePullUp: true,
            footer: const ClassicFooter(
                loadStyle: LoadStyle.HideAlways,loadingText: "",canLoadingIcon: Text(""),),
            onRefresh: () async {
              final result = await fetchAlbum(isrefest: true,a: b);
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
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  floating: true,
                  toolbarHeight: 40,
                  title:  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: ()async {
                          await fetchAlbum(isrefest: true, a: 0);
                          widget.page = 0;

                          refreshController.requestRefresh();
                          setState(() {});
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
                              "widget..data!.gosmaca.totanleyin",
                            style: CustomTextStyle.discount(context),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async{
                          widget.page = 1;   //kopya
                          b == 2
                              ? await fetchAlbum(isrefest: true, a: 1)
                              : await fetchAlbum(isrefest: true, a: 2);
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
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Filter(maglumat: filterinfo,))).then((value) {
                            filterinfo=value!=null?value:["","","2","Defult"];
                            widget.sort=value!=null?value[2]:"";
                            refreshController.requestRefresh();

                            // debugPrint(filterinfo.toString()+"dfg");
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
                ),
                SliverList(
                    delegate: SliverChildListDelegate([

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Haryt sany: "+count),
                      )
                    ])),
                widget.checkpage == true
                    ? OwnList(brend: prod)
                    : OwnGrid(brend: prod)
              ],
            )));
  }
}
