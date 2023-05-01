import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'package:serpay/IpAdress.dart';
import 'package:serpay/Servers/Model/AllFreeProduct.dart';
import 'package:serpay/darkMode/theme_services.dart';

import '../../Language/Language.dart';
import '../../MainPage/PhotoIndex.dart';
import '../../Model/TextColor.dart';
import '../../Profile/GetMe/PostGetMe.dart';
import '../FreeProduct.dart';

class FreeListProduct extends StatefulWidget {
  Datum allFreeProduct;
int time;
  LanguageModel lan;
  String url;
  FreeListProduct({required this.allFreeProduct,required this.time,required this.lan,required this.url});

  @override
  State<FreeListProduct> createState() => _FreeListProductState();
}

class _FreeListProductState extends State<FreeListProduct> {
  String paylas="";

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
debugPrint(widget.time.toString());
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>  FreeProductPerson(ipAddress: widget.allFreeProduct.freeproductId, url: widget.url,lan: widget.lan,)));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 125,
        margin: const EdgeInsets.only(top: 15, right: 15, left: 15),
        decoration: BoxDecoration(
            color: ThemeServices().theme == ThemeMode.dark
                ? const Color.fromRGBO(55, 55, 55, 1)
                : select.contaColor,
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  CarouselSlider.builder(
                    itemCount: widget.allFreeProduct.images.length,
                    itemBuilder: (BuildContext context,
                        int itemIndex, int pageViewIndex) {
                      return Container(
                          width: 120,
                          child: (widget.allFreeProduct
                              .images.length !=
                              0)
                              ? ClipRRect(
                            borderRadius:
                            BorderRadius.circular(5),
                            child: CachedNetworkImage(
                              imageUrl:
                              "${IpAddress().ipAddress}/" +
                                  widget.allFreeProduct

                                      .images[itemIndex]
                                      .image,
                              placeholder: (context, url) =>
                                  Container(
                                      alignment:
                                      Alignment.center,
                                      child:
                                      const CircularProgressIndicator(
                                        color: Colors.red,
                                      )),
                              errorWidget: (context, url,
                                  error) =>
                                  Image.asset(
                                      "asset/Img/banner-img.jpg"),
                              fit: BoxFit.fill,
                            ),
                          )
                              : Image.asset("assets/images/1.jpg"));
                    },
                    options: CarouselOptions(
                      viewportFraction: 1,
                      aspectRatio: 16 / 9,
                      height: 100,
                      onPageChanged: (index, reason) {

                      },
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: false,
                      autoPlayInterval: const Duration(seconds: 10),
                      autoPlayAnimationDuration:
                      const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),

                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                    const EdgeInsets.only(left: 15, top: 15),
                    child: Text(
                    widget.url=="ru"?widget.allFreeProduct.nameRu:  widget.allFreeProduct.nameTm,
                      style: CustomTextStyle.priceRange(context),
                    ),
                  ),
                  widget.allFreeProduct.max!=null?Padding(
                    padding: const EdgeInsets.all(15.0),
                    child:  LinearPercentIndicator(
                      width: 130,
                      animation: true,
                      lineHeight: 10.0,
                      animationDuration: 2000,
                      percent: (widget.allFreeProduct.max.toInt()*100/widget.allFreeProduct.goal.toInt())/100,
                      center: Text(
                        (widget.allFreeProduct.max.toInt()*100/widget.allFreeProduct.goal).toStringAsFixed(1),
                        style: CustomTextStyle.proset(context),
                      ),
                      linearStrokeCap: LinearStrokeCap.roundAll,
                      // progressColor: Colors.greenAccent,
                      linearGradient: LinearGradient(colors: [
                        select.freeProd,
                        select.mainColo,
                      ]),
                    ),
                  ):Container(),
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            "asset/MainPagePhoto/users (1).svg",
                            color: ThemeServices().theme ==
                                ThemeMode.dark
                                ? const Color.fromRGBO(174, 174, 174, 1)
                                : const Color.fromRGBO(97, 97, 97, 1),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Text(
                              widget.allFreeProduct.contestants.toString(),
                              style: CustomTextStyle.topPersonShare(
                                  context),
                            ),
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                         widget.time>0? FreeProductOwn().fetchAlbum(widget.allFreeProduct.freeproductId,context):"";
                        },
                        child: Container(
                          width: 150,
                          height: 40,
                          decoration: BoxDecoration(
                            color: widget.time>0?select.mainColo:Colors.black45,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                  "asset/MainPagePhoto/Share.svg"),
                              Padding(
                                padding:
                                const EdgeInsets.only(left: 10),
                                child: Text(
                                 widget.lan.gosmaca.paylas,
                                  style: CustomTextStyle
                                      .productfotterPrice(context),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  quit(String free,BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: ThemeServices().theme == ThemeMode.dark
                ? Color.fromRGBO(55, 55, 55, 1)
                : Color.fromRGBO(250, 250, 250, 1),
            title: Center(
                child: Text(
                  "Paýlaşmagyň görnüşini saýlaň",
                  style: CustomTextStyle.quit(context),
                )),
            actions: [
              ButtonBar(
                buttonHeight: 40,
                buttonMinWidth: 115,
                alignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    // color: select.mainColo,
                    onPressed: () {
                      FreeProductOwn().fetchAlbum(free,context);
                    },
                    child: Text("Ozüm üçin",style: TextStyle(color: Colors.red),),
                  ),
                  TextButton(
                    // color: select.mainColo,
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                                builder: (BuildContext context, StateSetter setState) {
                                  return AlertDialog(
                                      backgroundColor: Colors.white,
                                      // contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                      title: Column(
                                        children: [
                                          Text(
                                            "Dostun un gatnaşsan özüň üçin gatnaşyp bileňizok",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,),
                                            textAlign: TextAlign.center,),
                                          Text(
                                            "Dostun ucin paylasjak bolsan dostun nomerini girinin",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,),
                                            textAlign: TextAlign.center,),
                                          Form(
                                            key: _formkey,
                                            child: TextFormField(
                                              textAlignVertical:
                                              TextAlignVertical.top,

                                              // cursorColor: Color.fromRGBO(104, 109, 118, 1),
                                              keyboardType: TextInputType.number,

                                              decoration: InputDecoration(
                                                // hintStyle:CustomTextStyle.fieldmax(context),
                                                  errorStyle:
                                                  CustomTextStyle.error(context),
                                                  prefixText: "+993"
                                                // hintText: "min",
                                              ),
                                              validator: (jog) {
                                                if (jog!.length < 8) {
                                                  return "Doly nomerinizi girizin";
                                                } else {
                                                  return null;
                                                }
                                              },
                                              onSaved: (deger) => paylas = deger!,
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap:(){
                                                  Navigator.pop(context);
                                                }                                     ,child: Container(
                                                  width: 100,
                                                  margin: EdgeInsets.only(top: 10),
                                                  height: 50,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.red,width: 1)),
                                                  child: Text("Cancel",style: TextStyle(color: Colors.red),textAlign: TextAlign.center,),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: (){
                                                  girisBilgi(context, free);
                                                },
                                                child: Container(
                                                  width: 100,
                                                  margin: EdgeInsets.only(top: 10,left: 10),
                                                  height: 50,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.red),
                                                  child: Text("Share",style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                  );
                                });});

                    },
                    child: Text("Dostym bilen",style: TextStyle(color: Colors.red),),
                  )
                ],
              )
            ],
          );
        });
  }

  void girisBilgi(BuildContext context,String free) async {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();

      FreeProductPost().fetchAlbum(free,"+993"+paylas,context);
    } else {
      setState(() {

      });
    }
  }
}
