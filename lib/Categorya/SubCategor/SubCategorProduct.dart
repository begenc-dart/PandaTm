import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:serpay/LogIn/LogIn/Model/checkSignUp.dart';
import 'package:serpay/LogIn/LogIn/Model/token.dart';
import 'package:serpay/MainPage/MainPagee/ProductMainPage/ProductMainPage.dart';

import 'package:serpay/Model/TextColor.dart';
import 'package:http/http.dart' as http;
import 'package:serpay/Ui/MainPage/SkidkaProduct/NewProduct/NewProductList.dart';
import '../../../../../IpAdress.dart';
import '../../../../../Search/Filter.dart';
import '../../../../../darkMode/theme_services.dart';
import '../../Language/Language.dart';
import '../Model/SubCategoriesProduct.dart';

class SubCategorProduct extends StatefulWidget {
  String sort;
  int page;
  bool checkpage;
  String subcatId;
  String nameSubCat;
  LanguageModel lan;
  String url;
  SubCategorProduct(
      {required this.sort,
      required this.page,
      required this.checkpage,
      required this.subcatId,
      required this.nameSubCat,required this.url,required this.lan});

  @override
  State<SubCategorProduct> createState() => _SubCategorProductState();
}

class _SubCategorProductState extends State<SubCategorProduct> {
  late int totalPage;

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  late SubCategoriyaProduct _subCategoriyaProduct;
  int current_page = 0;
  String ip = IpAddress().ipAddress;
  List<ProductSub> prod = [];

  String checkLike = "";
  String? token;
  CheckSignUp checkSignUp = new CheckSignUp();
int b=0;  String maxfil="";
  String minfil="";
  String count="";
  Future<bool> fetchAlbum({bool isrefest = false,int a=0,required String min,required String max}) async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });
    await checkSignUp.dosyaOku().then((value) {
      checkLike = value;
    });

    if (isrefest) {
      current_page = 0;
    }
b=a;maxfil=max;
    minfil=min;

    debugPrint(widget.subcatId);
    debugPrint(token);
    final response = await http.get(Uri.parse(
        checkLike.toString().length == 4 ?

            "$ip/users/products/sub-categories/${widget.subcatId}?offset=$current_page&sort=${a}&max_price=${max}&min_price=${min}&limit=10"
         :
           "$ip/public/sub-categories/products/${widget.subcatId}?offset=$current_page&sort=${a}&max_price=${max}&min_price=${min}&limit=10"),
      headers: checkLike.toString().length.toInt() == 4
          ? <String, String>{
        "Content-Type": "application/json",
        'Authorization': 'Bearer ${token}',
      }
      : {},
    );
    debugPrint(response.body.toString() + 'dfsdf');
debugPrint(response.statusCode.toString());
    if (response.statusCode == 200) {
      (response.statusCode.toString());

      _subCategoriyaProduct = subCategoriyaProductFromJson(response.body);

      (response.statusCode.toString());
      if (isrefest) {
        count=_subCategoriyaProduct.count.toString();
        prod = _subCategoriyaProduct.products!;
      } else {
        prod.addAll(_subCategoriyaProduct.products!);
      }
      ("new");
      current_page = current_page + 10;

      setState(() {});
      return true;
    } else {
      return false;
    }
  }
  ScrollController? controller;
@override
  void initState() {
    // TODO: implement initState\
  controller = ScrollController()..addListener(_scrollListener);
    super.initState();
  }
  void dispose() {
    controller!.removeListener(_scrollListener);
    super.dispose();
  }
  void _scrollListener() async{
    print(controller!.position.extentAfter.toString()+"dsfsdfdf");
    if (controller!.position.extentAfter < 500&&controller!.position.extentAfter !=0) {


    };

  }
  List filterinfo=["","","2","Defult"];
  @override
  @override
  Widget build(BuildContext context) {
    // final productIndex = Provider.of<ProductIndex>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.nameSubCat.toString(),
            style: CustomTextStyle.profiledettails(context),
          ),
        ),
        body: SmartRefresher(
            controller: refreshController,
            enablePullUp: true,
            footer: const ClassicFooter(
                loadStyle: LoadStyle.HideAlways),
            onRefresh: () async {
              final result = await fetchAlbum(isrefest: true,a: b,min: minfil,max: maxfil);
              if (result) {
                refreshController.refreshCompleted();
              } else {
                refreshController.refreshFailed();
              }
            },
            onLoading: () async {
              final result = await fetchAlbum(max: maxfil,min: minfil,a: b);
              if (result) {
                refreshController.loadComplete();
              } else {
                refreshController.loadFailed();
              }
            },
            child: CustomScrollView(
              controller: controller,
              slivers: [
                SliverList(
                    delegate: SliverChildListDelegate([
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: ()async {
                            await fetchAlbum(isrefest: true, a: 23,min: minfil, max: maxfil);
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
                                widget.lan.gosmaca.totanleyin,
                              style: CustomTextStyle.discount(context),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async{
                            widget.page = 1;   //kopya
                            b == 0
                                ? await fetchAlbum(isrefest: true, a: 1,min: minfil, max: maxfil)
                                : await fetchAlbum(isrefest: true, a: 0,min: minfil, max: maxfil);
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
                                 widget.lan.harytlar ,
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
                            fetchAlbum(isrefest: true,min: minfil, max: maxfil);
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
                                builder: (context) => Filter(maglumat: filterinfo,))).then((value) async{
                              await fetchAlbum(isrefest: true, a: int.parse(value[2]),min: value[1],max: value[0]);
                              filterinfo=value;
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(widget.lan.haryt+count,style: TextStyle(color: ThemeServices().theme == ThemeMode.dark
                            ? Colors.white:Colors.black),),
                      )
                ])),
                widget.checkpage == true
                    ? NewProductList(newProduct: prod, url: widget.url,)
                    :ProductMainPage( randomPro: prod,)
              ],
            )));
  }
}
