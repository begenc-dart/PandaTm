import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:serpay/Liked/liked.dart';
import 'package:serpay/LogIn/LogIn/LogIn.dart';
import 'package:serpay/LogIn/LogIn/Model/checkSignUp.dart';

import 'package:serpay/MainPage/MainPagee/model/HistoryProduct.dart';
import 'package:serpay/MainPage/Model/RandomProduct.dart';

import '../../../HttpModel/BannerGet.dart';
import '../../../IpAdress.dart';
import '../../../Model/TextColor.dart';
import '../../../darkMode/theme_services.dart';
import '../../../language.dart';
import '../../../photo/photo.dart';
import '../../PhotoIndex.dart';
import '../../Product/Product.dart';

class ProductMainPage extends StatefulWidget {
  List randomPro;

  ProductMainPage({required this.randomPro});

  @override
  State<ProductMainPage> createState() => _ProductMainPageState();
}

class _ProductMainPageState extends State<ProductMainPage> {


  bool liked = false;

  String checkLike = "";
  String url="";
language()async{

  await LanguageFileRead().then((value) {
    url = value;
  });
}
  void initState() {
    // TODO: implement initState
language();
    checkSignUp.dosyaOku().then((value) {
      checkLike = value;
    });
    super.initState();
  }
  int _current=0;
  @override
  Widget build(BuildContext context) {
    //Color renk = Color.fromRGBO(250, 250, 250, 1);

    return SliverGrid(
        delegate: SliverChildBuilderDelegate(
              (context, index) {
                List a=widget.randomPro[index].images;
                return  InkWell(
                  onTap: () {
                    HistoryProduct().history(widget.randomPro[index].productId);

                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            ProductDetails(
                              productId: widget.randomPro[index].productId, image: widget.randomPro[index].images,
                            )));
                  },
                  child: Container(
                    height: 200,
                    margin: index % 2 == 0
                        ? EdgeInsets.only(left: 15, top: 15,right: 7)
                        : EdgeInsets.only(right: 15, top: 15, left: 7),
                    decoration: BoxDecoration(
                        color: ThemeServices().theme == ThemeMode.dark
                            ? Color.fromRGBO(55, 55, 55, 1)
                            : select.contaColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Stack(
                                  children: [
                                    widget.randomPro[index].images.length != 0
                                        ? CarouselSlider.builder(
                                      itemCount:
                                      widget.randomPro[index].images.length,
                                      itemBuilder: (BuildContext context,
                                          int itemIndex, int pageViewIndex) {
                                        return Container(
                                            width: double.infinity,
                                            child: ClipRRect(
                                              borderRadius:
                                              BorderRadius.circular(5),
                                              child: CachedNetworkImage(
                                                imageUrl:
                                                "${IpAddress().ipAddress}/" +
                                                    widget
                                                        .randomPro[index]
                                                        .images[itemIndex]
                                                        .image,
                                                placeholder: (context, url) =>
                                                    Container(
                                                        alignment:
                                                        Alignment.center,
                                                        child:
                                                        CircularProgressIndicator(
                                                          color: Colors.red,
                                                        )),
                                                errorWidget:
                                                    (context, url, error) =>
                                                    Image.asset(
                                                      "asset/Img/banner-img.jpg",
                                                      fit: BoxFit.fill,
                                                    ),
                                                fit: BoxFit.fill,
                                              ),
                                            ));
                                      },
                                      options: CarouselOptions(
                                        viewportFraction: 1,
                                        aspectRatio: 16 / 9,
                                        height: 115,
                                        onPageChanged: (index, reason) {
                                          _current=index;
                                          setState(() {

                                          });
                                        },
                                        initialPage: 0,
                                        enableInfiniteScroll: true,
                                        reverse: false,
                                        autoPlay: false,
                                        autoPlayInterval: Duration(seconds: 10),
                                        autoPlayAnimationDuration:
                                        Duration(milliseconds: 800),
                                        autoPlayCurve: Curves.fastOutSlowIn,
                                        enlargeCenterPage: true,
                                        scrollDirection: Axis.horizontal,
                                      ),
                                    )
                                        : Image.asset("asset/Img/banner-img.jpg"),

                                    ProductLike(
                                        like: widget.randomPro[index].isLiked,
                                        id: widget.randomPro[index].productId),
                                    Positioned(
                                      bottom: 5,
                                    left: 0,right: 0,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children:  a.map((url) {
                                          int indexx =  a.indexOf(url);
                                          return Container(
                                            width: 3.0,
                                            height: 3.0,
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10.0, horizontal: 3.0),
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: current_page == indexx
                                                  ? select.photodotCol
                                                  : select.photodotOffCol,
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10, right: 10, ),
                                  child: Text(
                                      url=="ru"?widget.randomPro[index].nameRu: widget.randomPro[index].nameTm, maxLines: 1,
                                      style: CustomTextStyle.nameTm(context)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10,bottom: 5,top: 5),
                                  child: Text(url=="ru"?widget.randomPro[index].bodyRu:widget.randomPro[index].bodyTm,
                                      maxLines: 1,
                                      style: CustomTextStyle.desStyle(context)),
                                ),
                                Container(
                                  margin:
                                  EdgeInsets.only( left: 10,bottom: 5),
                                  child:                                                                                                                                                                                                                                                                                                            Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            widget.randomPro[index].price != null
                                                ? widget.randomPro[index].price
                                                .toStringAsFixed(1):0.toString(),
                                            style:
                                            CustomTextStyle.priceColor(context),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(left: 5),
                                            width: 22,
                                            height: 10,
                                            decoration: BoxDecoration(
                                                color: select.tmConCol,
                                                borderRadius:
                                                BorderRadius.circular(2)),
                                            child: Center(
                                              child: Text("TMT",
                                                  style:
                                                  CustomTextStyle.TmCol(context)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      widget.randomPro[index].discount != 0
                                          ? Padding(
                                        padding:
                                        const EdgeInsets.only(right: 17),
                                        child:widget.randomPro[index].priceOld!=null? Text(
                                          "${widget.randomPro[index].priceOld
                                              .toStringAsFixed(1)} TMT",
                                          style:
                                          CustomTextStyle.disprice(context),
                                        ): Text(
                                          "",
                                          style:
                                          CustomTextStyle.disprice(context),
                                        ),
                                      )
                                          : Container()
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            widget.randomPro[index].isNew==true?   Positioned(
                              top:
                              widget.randomPro[index].discount != null && widget.randomPro[index].discount != 0? -5 : -25,
                              left: -33,
                              child: RotationTransition(
                                turns: new AlwaysStoppedAnimation(15 / 360),
                                child: Container(
                                  width: 63,
                                  height: 38,
                                  alignment: Alignment.bottomRight,
                                  padding: EdgeInsets.only(right: 5, bottom: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: select.newconcol,
                                  ),
                                  child: Text(
                                    "New",
                                    style: CustomTextStyle.newStle(context),
                                  ),
                                ),
                              ),
                            ):Container(),
                            widget.randomPro[index].discount != null&& widget.randomPro[index].discount != 0
                                ? Positioned(
                              top: -20,
                              left: -25,
                              child: RotationTransition(
                                turns: new AlwaysStoppedAnimation(15 / 360),
                                child: Container(
                                  width: 63,
                                  height: 38,
                                  alignment: Alignment.bottomRight,
                                  padding: EdgeInsets.only(right: 5, bottom: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: select.mainColo,
                                  ),
                                  child: Text(
                                    "-${widget.randomPro[index].discount}%",
                                    style: CustomTextStyle.disColor(context),
                                  ),
                                ),
                              ),
                            )
                                : Container()
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },


          childCount: widget.randomPro.length,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
          crossAxisCount: 2,

          height: 200.0,  ));
  }
}

class ProductLike extends StatefulWidget {
  bool like;
  String id;

  ProductLike({required this.like, required this.id});

  @override
  _ProductLikeState createState() => _ProductLikeState();
}

class _ProductLikeState extends State<ProductLike> {
  LikedProducts postLiked = new LikedProducts();
  CheckSignUp checkSignUp = new CheckSignUp();
  @override
  String checkLike = "";

  void initState() {
    // TODO: implement initState

    checkSignUp.dosyaOku().then((value) {
      checkLike = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 5,
      right: 5,
      child: InkWell(
          onTap: () {
            setState(() {
              // debugPrint(checkLike+"mmmmmmmmmmmmmmmmmmmmmmmmm");

              if (checkLike
                  .toString()
                  .length == 4) {
                debugPrint("checkLike = ${checkLike}");
                widget.like == true ? widget.like = false : widget.like = true;
                if (widget.like == true) {
                  debugPrint("like = ${widget.like}");
                  // debugPrint(widget.randomPro[index].productId!);
                  postLiked.postLikedProduct(widget.id);
                } else {
                  postLiked.deleteAlbum(widget.id);
                }
              } else {
                debugPrint("like basyldy" +
                    widget.like.toString() +
                    "\n ${checkLike}barla");
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LogIn()));
              }
            });
          },
          child: Container(
            width: 30, height: 30,
            // decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(5)),
alignment: Alignment.center,
            child: widget.like == false
                ?  SvgPicture.asset("asset/icon/like.svg",width: 20,height: 20,)
                :   SvgPicture.asset("asset/icon/Like_on.svg",width: 25,height: 25,)
          )
      ),
    );
  }
}

class ProductLikeList extends StatefulWidget {
  bool like;
  String id;

  ProductLikeList({required this.like, required this.id});

  @override
  _ProductLikeListState createState() => _ProductLikeListState();
}

class _ProductLikeListState extends State<ProductLikeList> {
  LikedProducts postLiked = new LikedProducts();
  CheckSignUp checkSignUp = new CheckSignUp();
  @override
  String checkLike = "";

  void initState() {
    // TODO: implement initState

    checkSignUp.dosyaOku().then((value) {
      checkLike = value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          setState(() {
            // debugPrint(checkLike+"mmmmmmmmmmmmmmmmmmmmmmmmm");

            if (checkLike
                .toString()
                .length == 4) {
              debugPrint("checkLike = ${checkLike}");
              widget.like == true ? widget.like = false : widget.like = true;
              if (widget.like == true) {
                debugPrint("like = ${widget.like}");
                // debugPrint(widget.randomPro[index].productId!);
                postLiked.postLikedProduct(widget.id);
              } else {
                postLiked.deleteAlbum(widget.id);
              }
            } else {
              debugPrint("like basyldy" +
                  widget.like.toString() +
                  "\n ${checkLike}barla");
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LogIn()));
            }
          });
        },
        child: Container(

          child: widget.like == false
              ?  SvgPicture.asset("asset/icon/like.svg",width: 25,height: 25,)
              :   SvgPicture.asset("asset/icon/Like_on.svg",width: 25,height: 25,)
        )
    );
  }
}