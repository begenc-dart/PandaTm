import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:serpay/Profile/History/HistoryGet.dart';
import 'package:serpay/darkMode/theme_services.dart';
import 'package:http/http.dart' as http;
import '../../IpAdress.dart';
import '../../Language/Language.dart';
import '../../Liked/liked.dart';
import '../../LogIn/LogIn/Model/token.dart';
import '../../MainPage/PhotoIndex.dart';
import '../../MainPage/Product/Product.dart';
import '../../Model/TextColor.dart';
import 'DeleteHistory.dart';

class History extends StatefulWidget {
  LanguageModel languageModel;
  String url;
  History({required this.languageModel,required this.url});
  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List photoProduct = [
    "https://dlcdnrog.asus.com/rog/media/1610705538274.jpg",
    "https://dlcdnrog.asus.com/rog/media/1539690389456.jpg",
    "https://www.sentinels.gg/s/SEN-Championship-Mood.png"
  ];

  late int totalPage;

  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  late List<HistoryGet> _historyGet;

  int current_page = 0;

  String ip = IpAddress().ipAddress;

  List<HistoryGet> prod = [];
  String? token;

  Future<bool> fetchAlbum({bool isrefest = false}) async {
    await Token().tokenDosyaOku().then((value) {
      token = value;
    });
    if (isrefest) {
      current_page = 0;
    }
    ("sdas");
    final response = await http.get(
      Uri.parse("$ip/users/history?offset=$current_page"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}',
      },
    );
    debugPrint(response.body.toString() + 'dfsdf');

    if (response.statusCode == 200) {
      (response.statusCode.toString());
      _historyGet = (json.decode(response.body) as List)
          .map((e) => HistoryGet.fromJson(e))
          .toList();

      (response.statusCode.toString());
      if (isrefest) {
        prod = _historyGet;
      } else {
        prod.addAll(_historyGet);
      }

      current_page = current_page + 10;

      setState(() {});
      return true;
    } else {
      return false;
    }
  }
  LikedProducts postLiked =  LikedProducts();
List history=[];
  List indexList=[];
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(39, 39, 39, 1)
            : Color.fromRGBO(250, 250, 250, 1),
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back)),
            Text(
             widget.languageModel.profileDetails.taryhym,
              style: TextStyle(
                  color: ThemeServices().theme == ThemeMode.dark
                      ? Colors.white
                      : Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            InkWell(
              onTap: () {
                check=check==true? false: true;
                setState(() {});
                check==false &&history.length!=0? {
                  HistoryDelete().deleteAlbum(history,context,widget.url),
                  debugPrint(history.toString()+"dfs"),
                for(int i in indexList){
                  prod.removeAt(i),
                  indexList.remove(indexList)
                },
                  // history.clear()
                } :history.clear();


              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                 check==false? widget.languageModel.profileDetails.ocur:widget.languageModel.profileDetails.poz,
                  style: TextStyle(
                      color: Color.fromRGBO(117, 117, 255, 1),
                      fontWeight: FontWeight.w400,
                      fontSize: 14),
                ),
              ),
            )
          ],
        ),
      ),
      body: SmartRefresher(
        controller: refreshController,
        enablePullUp: true,
        footer: const ClassicFooter(
            loadStyle: LoadStyle.HideAlways),
        onRefresh: () async {
          final result = await fetchAlbum(isrefest: true);
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
        child: ListView.builder(
          itemBuilder: (context, index) => check == false
              ? Container(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ProductDetails(
                                productId: prod[index].product.productId, image: prod[index].product.images,
                              )));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 100,
                      margin: EdgeInsets.only(top: 15, right: 15, left: 15),
                      decoration: BoxDecoration(
                        color: ThemeServices().theme == ThemeMode.dark
                            ? Color.fromRGBO(55, 55, 55, 1)
                            : Color.fromRGBO(243, 243, 243, 1),
                        borderRadius: BorderRadius.circular(5)
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Stack(children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Stack(
                                  children: [
                                    prod[index].product != null
                                        ? prod[index].product.images.isNotEmpty
                                            ? CarouselSlider.builder(
                                                itemCount: prod[index]
                                                    .product
                                                    .images
                                                    .length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int itemIndex,
                                                        int pageViewIndex) {
                                                  return Container(
                                                      width: 120,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl:
                                                              "${IpAddress().ipAddress}/" +
                                                                  prod[index]
                                                                      .product
                                                                      .images[
                                                                          itemIndex]
                                                                      .image,
                                                          placeholder: (context,
                                                                  url) =>
                                                              Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    color: Colors
                                                                        .red,
                                                                  )),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              Image.asset(
                                                                  "asset/Img/banner-img.jpg"),
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ));
                                                },
                                                options: CarouselOptions(
                                                  viewportFraction: 1,
                                                  aspectRatio: 16 / 9,
                                                  height: 100,
                                                  // onPageChanged: (index, reason) {
                                                  //   productIndex.check(index);
                                                  // },
                                                  initialPage: 0,
                                                  enableInfiniteScroll: true,
                                                  reverse: false,
                                                  autoPlay: false,
                                                  autoPlayInterval:
                                                      Duration(seconds: 10),
                                                  autoPlayAnimationDuration:
                                                      Duration(
                                                          milliseconds: 800),
                                                  autoPlayCurve:
                                                      Curves.fastOutSlowIn,
                                                  enlargeCenterPage: true,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                ),
                                              )
                                            : Image.asset(
                                                "asset/Img/banner-img.jpg")
                                        : Image.asset(
                                            "asset/Img/banner-img.jpg"),
                                    // Positioned(
                                    //   bottom: 5,
                                    //   width:
                                    //       MediaQuery.of(context).size.width / 2 - 60,
                                    //   child: Row(
                                    //     mainAxisAlignment: MainAxisAlignment.center,
                                    //     children: pro![index].images[].image.map((url) {
                                    //       int index = pro![index].images.indexOf(url);
                                    //       return Container(
                                    //         width: 3.0,
                                    //         height: 3.0,
                                    //         margin: EdgeInsets.symmetric(
                                    //             vertical: 10.0, horizontal: 3.0),
                                    //         decoration: BoxDecoration(
                                    //           shape: BoxShape.circle,
                                    //           color: productIndex.sana == index
                                    //               ? select.photodotCol
                                    //               : select.photodotOffCol,
                                    //         ),
                                    //       );
                                    //     }).toList(),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 15, left: 15, right: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [

                                      Padding(
                                        padding: const EdgeInsets.only(top: 5),
                                        child: Text(
                                         widget.url=="ru"? prod[index].product.nameRu:prod[index].product.nameTm,
                                          maxLines: 1,
                                          style:
                                              CustomTextStyle.nameTm(context),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Flexible(
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 10,bottom: 10),
                                              child: Text(
                                                widget.url=="ru"? prod[index].product.bodyRu:prod[index].product.bodyTm,
                                                maxLines: 1,
                                                style:
                                                CustomTextStyle.desStyle(context),

                                              ),
                                            ),
                                          ),
                                          InkWell(
                                              onTap: (){
                                                prod[index].product.isLiked== true ?prod[index].product.isLiked = false : prod[index].product.isLiked = true;
                                                if (prod[index].product.isLiked == true) {
                                                  debugPrint("like = ${prod[index].product.isLiked}");
                                                  // debugPrint(widget.randomPro[index].productId!);
                                                  postLiked.postLikedProduct(prod[index].product.productId);
                                                } else {
                                                  postLiked.deleteAlbum(prod[index].product.productId);
                                                }
                                                setState(() {

                                                });
                                              },
                                              child: prod[index].product.isLiked== false
                                                  ?  SvgPicture.asset("asset/icon/like.svg",width: 25,height: 25,)
                                                  :   SvgPicture.asset("asset/icon/Like_on.svg",width: 25,height: 25,)
                                          )
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                prod[index]
                                                    .product
                                                    .price
                                                    .toString(),
                                                style:
                                                CustomTextStyle.priceColor(
                                                    context),
                                              ),
                                              Container(
                                                width: 30,
                                                height: 12,
                                                margin:
                                                EdgeInsets.only(left: 8),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        2),
                                                    color: Color.fromRGBO(
                                                        196, 196, 196, 1)),
                                                child: Center(
                                                    child: Text(
                                                      "TMT",
                                                      style:
                                                      CustomTextStyle.TmCollist(
                                                          context),
                                                    )),
                                              ),
                                            ],
                                          ),
                                          prod[index].product.priceOld != null
                                              ? Text(
                                            "${prod[index].product.priceOld} TMT",
                                            style:
                                            CustomTextStyle.disprice(
                                                context),
                                          )
                                              : Container(),

                                        ],
                                      ),

                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          prod[index].product.isNew != null
                              ? Positioned(
                                  top: prod[index].product.discount != null&&prod[index].product.discount!=0
                                      ? -5
                                      : -22,
                                  left: -33,
                                  child: RotationTransition(
                                    turns: new AlwaysStoppedAnimation(15 / 360),
                                    child: Container(
                                      width: 63,
                                      height: 38,
                                      alignment: Alignment.bottomRight,
                                      padding:
                                          EdgeInsets.only(right: 5, bottom: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color.fromRGBO(255, 199, 0, 1),
                                      ),
                                      child: Text(
                                        "New",
                                        style: CustomTextStyle.newStle(context),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          prod[index].product.discount != null&&prod[index].product.discount!=0
                              ? Positioned(
                                  top: -20,
                                  left: -25,
                                  child: RotationTransition(
                                    turns: new AlwaysStoppedAnimation(15 / 360),
                                    child: Container(
                                      width: 63,
                                      height: 38,
                                      alignment: Alignment.bottomRight,
                                      padding:
                                          EdgeInsets.only(right: 5, bottom: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color.fromRGBO(255, 20, 29, 1),
                                      ),
                                      child: Text(
                                        prod[index].product.discount.toString()+"%",
                                        style:
                                            CustomTextStyle.disColor(context),
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                        ]),
                      ),
                    ),
                  ),
                )
              : CheckboxListTile(
                  value: prod[index].isSelected,
                  onChanged: (value) {
                    prod[index].isSelected = value!;
                    value==true? {history.add(prod[index].historyId),indexList.add(index),
                      debugPrint(history.toString())
                   }
                        : {
                            history.remove(
                              prod[index].historyId,
                            ),
                    indexList.remove(index)
                          };

                    setState(() {});
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                  subtitle: Container(
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductDetails(
                                  productId: prod[index].product.productId,image:prod[index].product.images
                                )));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 100,
                        margin: EdgeInsets.only(top: 15, right: 15, left: 15),
                        decoration: BoxDecoration(
                            color: ThemeServices().theme == ThemeMode.dark
                                ? Color.fromRGBO(55, 55, 55, 1)
                                : Color.fromRGBO(243, 243, 243, 1),
                            borderRadius: BorderRadius.circular(5)
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Stack(children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Stack(
                                    children: [
                                      prod[index].product.images.length != 0
                                          ? CarouselSlider.builder(
                                              itemCount: prod[index]
                                                  .product
                                                  .images
                                                  .length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int itemIndex,
                                                      int pageViewIndex) {
                                                return Container(
                                                    width: 120,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      child: CachedNetworkImage(
                                                        imageUrl:
                                                            "${IpAddress().ipAddress}/" +
                                                                prod[index]
                                                                    .product!
                                                                    .images[
                                                                        itemIndex]
                                                                    .image,
                                                        placeholder: (context,
                                                                url) =>
                                                            Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color: Colors
                                                                      .red,
                                                                )),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Image.asset(
                                                                "asset/Img/banner-img.jpg"),
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ));
                                              },
                                              options: CarouselOptions(
                                                viewportFraction: 1,
                                                aspectRatio: 16 / 9,
                                                height: 100,
                                                // onPageChanged: (index, reason) {
                                                //   productIndex.check(index);
                                                // },
                                                initialPage: 0,
                                                enableInfiniteScroll: true,
                                                reverse: false,
                                                autoPlay: false,
                                                autoPlayInterval:
                                                    Duration(seconds: 10),
                                                autoPlayAnimationDuration:
                                                    Duration(milliseconds: 800),
                                                autoPlayCurve:
                                                    Curves.fastOutSlowIn,
                                                enlargeCenterPage: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                              ),
                                            )
                                          : Image.asset(
                                              "asset/Img/banner-img.jpg"),
                                      // Positioned(
                                      //   bottom: 5,
                                      //   width:
                                      //       MediaQuery.of(context).size.width / 2 - 60,
                                      //   child: Row(
                                      //     mainAxisAlignment: MainAxisAlignment.center,
                                      //     children: pro![index].images[].image.map((url) {
                                      //       int index = pro![index].images.indexOf(url);
                                      //       return Container(
                                      //         width: 3.0,
                                      //         height: 3.0,
                                      //         margin: EdgeInsets.symmetric(
                                      //             vertical: 10.0, horizontal: 3.0),
                                      //         decoration: BoxDecoration(
                                      //           shape: BoxShape.circle,
                                      //           color: productIndex.sana == index
                                      //               ? select.photodotCol
                                      //               : select.photodotOffCol,
                                      //         ),
                                      //       );
                                      //     }).toList(),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, left: 15, right: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [

                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5),
                                          child: Text(
                                            prod[index].product.nameTm,
                                            maxLines: 1,
                                            style:
                                                CustomTextStyle.nameTm(context),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10,bottom: 10),
                                          child: Text(
                                            prod[index].product.bodyTm,
                                            style: CustomTextStyle.desStyle(
                                                context),
                                            maxLines: 1,
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  prod[index]
                                                      .product
                                                      .price
                                                      .toString(),
                                                  style: CustomTextStyle
                                                      .priceColor(context),
                                                ),
                                                Container(
                                                  width: 30,
                                                  height: 12,
                                                  margin:
                                                  EdgeInsets.only(left: 8),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          2),
                                                      color: Color.fromRGBO(
                                                          196, 196, 196, 1)),
                                                  child: Center(
                                                      child: Text(
                                                        "TMT",
                                                        style: CustomTextStyle
                                                            .TmCollist(context),
                                                      )),
                                                ),
                                              ],
                                            ),
                                            prod[index].product.priceOld !=
                                                null&& prod[index].product.priceOld!=0
                                                ? Text(
                                              "${prod[index].product.priceOld} TMT",
                                              style: CustomTextStyle
                                                  .disprice(context),
                                            )
                                                : Container(),

                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            prod[index].product.isNew != null
                                ? Positioned(
                                    top: prod[index].product.discount != null&&prod[index].product.discount!=0
                                        ? -5
                                        : -22,
                                    left: -33,
                                    child: RotationTransition(
                                      turns:
                                          new AlwaysStoppedAnimation(15 / 360),
                                      child: Container(
                                        width: 63,
                                        height: 38,
                                        alignment: Alignment.bottomRight,
                                        padding: EdgeInsets.only(
                                            right: 5, bottom: 5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color.fromRGBO(255, 199, 0, 1),
                                        ),
                                        child: Text(
                                          "New",
                                          style:
                                              CustomTextStyle.newStle(context),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),
                            prod[index].product.discount != null&&prod[index].product.discount!=0
                                ? Positioned(
                                    top: -20,
                                    left: -25,
                                    child: RotationTransition(
                                      turns:
                                          new AlwaysStoppedAnimation(15 / 360),
                                      child: Container(
                                        width: 63,
                                        height: 38,
                                        alignment: Alignment.bottomRight,
                                        padding: EdgeInsets.only(
                                            right: 5, bottom: 5),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color.fromRGBO(255, 20, 29, 1),
                                        ),
                                        child: Text(
                                          "-${ prod[index].product.discount}%",
                                          style:
                                              CustomTextStyle.disColor(context),
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(),
                          ]),
                        ),
                      ),
                    ),
                  ),
                ),
          itemCount: prod.length,
        ),
      ),
    );
  }
}
