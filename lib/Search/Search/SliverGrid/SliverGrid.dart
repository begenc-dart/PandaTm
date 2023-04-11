
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:serpay/Search/Filter.dart';
import 'package:serpay/Search/Search/ProductList/ProductList.dart';
import 'package:serpay/Search/Search/SliverGrid/ProductGrid.dart';
import 'package:serpay/Ui/MainPage/search/SearchMode.dart';
import 'package:serpay/darkMode/theme_services.dart';

import '../../../HttpModel/BannerGet.dart';
import '../../../IpAdress.dart';
import '../../../Language/Language.dart';
import '../../../LogIn/LogIn/Model/token.dart';

import '../../../MainPage/PhotoIndex.dart';

import '../../../Model/TextColor.dart';
import 'package:http/http.dart' as http;

import '../../../language.dart';

class ProductGrid extends StatefulWidget {
  // List<ActionProduct>? pro;
  int sort;
  String keys;
  LanguageModel data;
  ProductGrid({required this.sort, required this.keys,required this.data});

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  List filterinfo = ["", "", "2", "Defult"];
  bool check = false;
  int page = 0;
  String token = "";
  String ip = IpAddress().ipAddress;
  String checkLike = "";
  List<Data> prod = [];
  String countPro = "";
  String url="";
  language()async{

    await LanguageFileRead().then((value) {
      url=value.toString();
    });

  }
  @override
  void initState() {
    language();
    // TODO: implement initState
    super.initState();
  }
  late SearchModel _searchModel;
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
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

    debugPrint(token.toString()+"dffsf");
    final response = await http.get(
      Uri.parse( checkLike.toString().length == 4 ?"$ip/users/products/search?offset=$current_page&keyword=${widget.keys}&sort=$a":"$ip/users/products/search?offset=$current_page&keyword=${widget.keys}&sort=$a"),
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

  int grvalue = 1;
  @override
  List maglumat = [];

  Widget build(BuildContext context) {

    return SmartRefresher(
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
                          border: page != 0
                              ? Border.all(color: select.searchtop)
                              : Border.all(color: select.mainColo),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        widget.data.gosmaca.totanleyin,
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

                      // setState(() {});
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
                          border: page != 1
                              ? Border.all(color: select.searchtop)
                              : Border.all(color: select.mainColo),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.data.harytlar,
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
                      check == true ? check = false : check = true;
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
                      child: check == false
                          ? SvgPicture.asset(
                              "asset/MainPagePhoto/Group 87.svg",
                              color: ThemeServices().theme == ThemeMode.dark
                                  ? Color.fromRGBO(250, 250, 250, 1)
                                  : Color.fromRGBO(41, 41, 41, 1),
                            )
                          : SvgPicture.asset(
                              "asset/MainPagePhoto/Group 88.svg",
                              color: ThemeServices().theme == ThemeMode.dark
                                  ? Color.fromRGBO(250, 250, 250, 1)
                                  : Color.fromRGBO(41, 41, 41, 1),
                            ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {


                      Navigator.of(context)
                          .push(MaterialPageRoute(
                              builder: (context) => Filter(
                                    maglumat: filterinfo,
                                  )))
                          .then((value) {
                        filterinfo=value!=null?value:["","","2","Defult"];
                        widget.sort=value!=null?value[2]:"";
                        refreshController.requestRefresh();

                      } );

                      debugPrint(maglumat.toString());
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
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15),
              child: Text(widget.data.haryt + countPro),
            ),
          ])),
          check != false
              ? ProductList(
                  pro: prod, url: url,
                )
              : GridProduct(
                  searchProdut: prod, url: url,
                )
        ],
      ),
    );
  }
}
