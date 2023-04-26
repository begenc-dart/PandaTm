import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:serpay/LogIn/LogIn/Model/checkSignUp.dart';
import 'package:serpay/LogIn/LogIn/Model/token.dart';

import 'package:serpay/Model/TextColor.dart';

import 'package:http/http.dart' as http;

import '../../../../IpAdress.dart';
import '../../../../Language/Language.dart';
import '../../../../MainPage/MainPagee/ProductMainPage/ProductMainPage.dart';
import '../../../../MainPage/Model/SellerProduct.dart';
import '../../../../Search/Filter.dart';
import '../../../../darkMode/theme_services.dart';

import '../NewProduct/NewProductList.dart';


class BannerProduct extends StatefulWidget {
  String sort;
  int page;
  bool checkpage;
  String brend;
  String nameBrenad;
  LanguageModel lan;
  String url;
  BannerProduct(
      {required this.sort,
      required this.page,
      required this.checkpage,
      required this.brend,
      required this.nameBrenad,required this.lan, required this.url});
  @override
  State<BannerProduct> createState() => _BannerProductState();
}

class _BannerProductState extends State<BannerProduct> {
  late int totalPage;

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  late SellerProduct bannerProductProduct;
  int current_page = 0;
  String ip = IpAddress().ipAddress;
   List<Datum> prod=[] ;
// late Seller seller;
  String checkLike = "";
  String? token;
  CheckSignUp checkSignUp = new CheckSignUp();
String count="";
int b=23;
  String maxfil="";
  String minfil="";
  Future<bool> fetchAlbum({bool isrefest = false,int a=23,required String max,required String min}) async {
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
    maxfil=max;
    minfil=min;
    debugPrint(maxfil);
b=a;
    debugPrint(widget.brend.toString());
    final response = await http.get(Uri.parse(
        checkLike.toString().length == 4 ?
        "$ip/users/seller/${widget.brend}?offset=$current_page&sort=${a}&limit=10&max_price=${max}&min_price=${min}"

            :"$ip/public/seller/${widget.brend}?offset=$current_page&sort=${a}&max_price=${max}&min_price=${min}&limit=10"
           ),
      headers: checkLike.toString().length.toInt() == 4
          ? <String, String>{
        "Content-Type": "application/json",
        'Authorization': 'Bearer ${token}',
      }
          : {},);
    debugPrint(response.body.toString() + 'dfsdf');

    if (response.statusCode == 200) {

      bannerProductProduct = sellerProductFromJson(response.body);
debugPrint(isrefest.toString());

      if (isrefest) {
        prod = bannerProductProduct.products.data;
        count=bannerProductProduct.products.count.toString();
        // seller=bannerProductProduct.seller;
      } else {
        prod.addAll(bannerProductProduct.products.data);

        debugPrint("else");
      }
      // debugPrint("else");
      current_page = current_page + 10;

      setState(() {});
      return true;
    } else {
      return false;
    }
  }
@override
ScrollController? controller;
  void initState() {
    // TODO: implement initState
  controller = ScrollController()..addListener(_scrollListener);
  super.initState();
  }
  void dispose() {
    controller!.removeListener(_scrollListener);
    super.dispose();
  }
  void _scrollListener() async{
    print(controller!.position.extentAfter);
    if (controller!.position.extentAfter < 500&&controller!.position.extentAfter !=0) {


      };

  }
  List filterinfo = ["", "", "2", "Defult"];
  @override
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.nameBrenad.toString(),
            style: CustomTextStyle.profiledettails(context),
          ),
        ),
        body: SmartRefresher(
            controller: refreshController,
            enablePullUp: true,

            footer: const ClassicFooter(
                loadStyle: LoadStyle.HideAlways),
            onRefresh: () async {
              debugPrint("refrest");
              final result = await fetchAlbum(isrefest: true,a: b,max: maxfil,min: minfil);
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
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  floating: true,
                  toolbarHeight: 40,

                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () async{
                          await fetchAlbum(isrefest: true, a: 23, max: maxfil, min: minfil);
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
                              ? await fetchAlbum(isrefest: true, a: 1, max: maxfil, min: minfil)
                              : await fetchAlbum(isrefest: true, a: 0, max: maxfil, min: minfil);
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
                                widget.lan.harytlar,
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
                        onTap: () async{
                          widget.checkpage == true
                              ? widget.checkpage = false
                              : widget.checkpage = true;
                          await fetchAlbum(isrefest: true, max: maxfil, min: minfil);
                          refreshController.requestRefresh();
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
                SliverList(
                    delegate: SliverChildListDelegate([

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
