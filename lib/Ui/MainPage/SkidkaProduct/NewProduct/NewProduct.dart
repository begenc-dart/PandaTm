
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:serpay/IpAdress.dart';
import 'package:serpay/Database/checkSignUp.dart';
import 'package:serpay/Database/token.dart';
import 'package:serpay/Model/mainModel.dart';
import 'package:serpay/MainPage/PhotoIndex.dart';
import 'package:serpay/Model/TextColor.dart';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:serpay/Ui/MainPage/SkidkaProduct/NewProduct/NewProductList.dart';

import '../../../../Model/Language.dart';
import '../../../../MainPage/MainPagee/ProductMainPage/ProductMainPage.dart';
import '../../../../Search/Filter.dart';
import '../../../../darkMode/theme_services.dart';
import '../../../../language.dart';


class NewProductModel extends StatefulWidget {
  String sort;
  int page;
  bool checkpage;
  NewProductModel(
      {required this.sort, required this.page, required this.checkpage});
  @override
  State<NewProductModel> createState() => _NewProductModelState();
}

class _NewProductModelState extends State<NewProductModel> {
  late int totalPage;
  String checkLike = "";
  String? token;
  CheckSignUp checkSignUp = new CheckSignUp();
  String url="";
  @override
  void initState() {
    // TODO: implement initState
    language();
    controller = ScrollController()..addListener(_scrollListener);
    languageModel=Language().fetchAlbum(context);
    super.initState();
  }
  late Future<LanguageModel> languageModel;
  language()async{
    await LanguageFileRead().then((value) {
      url = value;
    });
  }
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);
  late NewAndProduct newProducy;
  int current_page = 0;
  List<NewProduct> prod = [];
  String ip = IpAddress().ipAddress;
  int b=0;
  String maxfil="";
  String minfil="";
  String countproduct="";
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
    maxfil=max;
    minfil=min;
b=a;
    print(max+min);
    print(a.toString()+"dsf");
    final response = await http.get(Uri.parse(
        checkLike.toString().length == 4 ?
        "$ip/users/products/new?offset=$current_page&sort=${a}&max_price=${max}&min_price=${min}&limit=10"
:"$ip/public/products/new?offset=$current_page&sort=${a}&max_price=${max}&min_price=${min}&limit=10" ),
      headers: checkLike.toString().length.toInt() == 4
          ? <String, String>{
        "Content-Type": "application/json",
        'Authorization': 'Bearer ${token}',
      } : {},);

    debugPrint(response.body.toString() + 'dfsdf');

    if (response.statusCode == 200) {

      newProducy = newAndProductFromJson(response.body);


      if (isrefest) {
        countproduct=newProducy.count.toString();
        prod = newProducy.newProducts;
      } else {
        prod.addAll(newProducy.newProducts);

      }

      current_page = current_page + 10;

      setState(() {});
      return true;
    } else {
      return false;
    }
  }
  ScrollController? controller;

  void dispose() {
    controller!.removeListener(_scrollListener);
    super.dispose();
  }
  void _scrollListener() async{
    print(controller!.position.extentAfter);
    if (controller!.position.extentAfter < 500&&refreshController.isLoading) {


    };

  }
  List photoProduct = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRp0-c7PZi3hJulH_fnbH3UfG_4iX6ULwsuKQ&usqp=CAU",
    "https://media.dnd.wizards.com/ToD_1280x960_Wallpaper.jpg",
    "https://wallpapercave.com/wp/wp5187178.jpg"
  ];
  List filterinfo=["","","2","Defult"];
  @override

  Widget build(BuildContext context) {

    return FutureBuilder(
        future: languageModel,
        builder:
        (BuildContext context, AsyncSnapshot<LanguageModel> snapshot) {
      // debugPrint(snapshot.data.profile.toString());
      if (snapshot.hasData) {
        return
          Scaffold(
              appBar: AppBar(
                title: Text(
                  snapshot.data!.tazeHaryt,
                  style: CustomTextStyle.profiledettails(context),
                ),
              ),
              body: SmartRefresher(
                  controller: refreshController,
                  enablePullUp: true,
                  footer: const ClassicFooter(
                      loadStyle: LoadStyle.HideAlways),
                  onRefresh: () async {
                    final result = await fetchAlbum(isrefest: true,a: b,min: minfil, max: maxfil);
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
                                    snapshot.data!.gosmaca.totanleyin,
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
                                      snapshot.data!.harytlar,
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
                              onTap: ()async {
                                widget.checkpage == true
                                    ? widget.checkpage = false
                                    : widget.checkpage = true;
                                await fetchAlbum(isrefest: true,min: minfil, max: maxfil);
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
                                    builder: (context) => Filter(maglumat: filterinfo,))).then((value)async {
                                  await fetchAlbum(isrefest: true, a: int.parse(value[2]),min: value[1],max: value[0]);
                                  filterinfo=value;
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
                      ),
                      SliverList(
                          delegate: SliverChildListDelegate([

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(snapshot.data!.haryt+countproduct,style: TextStyle(color: ThemeServices().theme == ThemeMode.dark
                                  ? Colors.white:Colors.black),),
                            )
                          ])),
                      widget.checkpage == true
                          ? NewProductList(newProduct: prod, url: url,)
                          :ProductMainPage( randomPro: prod,)
                    ],
                  )));}else{
      return CircularProgressIndicator();}
        });



  }
}
