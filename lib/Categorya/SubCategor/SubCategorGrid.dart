import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:serpay/IpAdress.dart';


import '../../../../Model/TextColor.dart';
import '../../../../darkMode/theme_services.dart';

import '../../MainPage/MainPagee/ProductMainPage/ProductMainPage.dart';
import '../../MainPage/MainPagee/model/HistoryProduct.dart';
import '../../MainPage/Product/Product.dart';
import '../Model/SubCategoriesProduct.dart';

class SubCategorGrid extends StatelessWidget {
  List<ProductSub> brend;
  String url;
  SubCategorGrid({required this.brend,required this.url});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
        delegate: SliverChildBuilderDelegate(
              (context, index) => InkWell(
            onTap: () {
              HistoryProduct().history(brend[index].productId);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductDetails(
                    productId: brend[index].productId, image: brend[index].images,
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
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              brend[index].images.length != 0
                                  ? CarouselSlider.builder(
                                itemCount: brend[index]
                                    .images
                                    .length,
                                itemBuilder: (BuildContext
                                context,
                                    int itemIndex,
                                    int pageViewIndex) {
                                  return Container(
                                      width: double.infinity,
                                      child: ClipRRect(
                                        borderRadius:
                                        BorderRadius
                                            .circular(
                                            5),
                                        child:
                                        CachedNetworkImage(
                                          imageUrl: "${IpAddress().ipAddress}/" +
                                              brend[index]
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
                                                    color:
                                                    Colors.red,
                                                  )),
                                          errorWidget: (context,
                                              url,
                                              error) =>
                                              Image.asset(
                                                  "asset/Img/banner-img.jpg"),
                                          fit:
                                          BoxFit.fill,
                                        ),
                                      ));
                                },
                                options: CarouselOptions(
                                  viewportFraction: 1,
                                  aspectRatio: 16 / 9,
                                  height: 120,
                                  // onPageChanged: (index, reason) {
                                  //   productIndex.check(index);
                                  // },
                                  initialPage: 0,
                                  enableInfiniteScroll:
                                  true,
                                  reverse: false,
                                  autoPlay: false,
                                  autoPlayInterval:
                                  Duration(
                                      seconds: 10),
                                  autoPlayAnimationDuration:
                                  Duration(
                                      milliseconds:
                                      800),
                                  autoPlayCurve: Curves
                                      .fastOutSlowIn,
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
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10),
                            child: Text(url=="ru"?brend[index].nameRu:brend[index].nameTm,
                                maxLines: 1,
                                style: CustomTextStyle.nameTm(
                                    context)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10,bottom: 10),
                            child: Text(url=="ru"?brend[index].bodyRu:brend[index].bodyTm,

                                style: CustomTextStyle.desStyle(
                                    context),maxLines: 1,),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                top: 5, left: 10, bottom: 5),
                            child: Row(
                              crossAxisAlignment:
                              CrossAxisAlignment.center,
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                            brend[index]
                                .price!=null? brend[index]
                                          .price!
                                          .toStringAsFixed(1):"0",
                                      style: CustomTextStyle
                                          .priceColor(context),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: 5),
                                      width: 22,
                                      height: 10,
                                      decoration: BoxDecoration(
                                          color:
                                          select.tmConCol,
                                          borderRadius:
                                          BorderRadius
                                              .circular(2)),
                                      child: Center(
                                        child: Text("TMT",
                                            style: CustomTextStyle
                                                .TmCol(
                                                context)),
                                      ),
                                    ),
                                  ],
                                ),
                                brend[index].discount != 0
                                    ? Padding(
                                  padding:
                                  const EdgeInsets
                                      .only(
                                      right: 17),
                                  child: Text(
                                      brend[index].priceOld!=null? "${brend[index].priceOld!.toStringAsFixed(1)} TMT":"",
                                    style: CustomTextStyle
                                        .disprice(
                                        context),
                                  ),
                                )
                                    : Container()
                              ],
                            ),
                          ),
                        ],
                      ),
                      ProductLike(
                          like: brend[index].isLiked,
                          id: brend[index].productId
                      ),
                      Positioned(
                        top: brend[index].discount != 0
                            ? -5
                            : -25,
                        left: -33,
                        child: RotationTransition(
                          turns: new AlwaysStoppedAnimation(
                              15 / 360),
                          child: Container(
                            width: 63,
                            height: 38,
                            alignment: Alignment.bottomRight,
                            padding: EdgeInsets.only(
                                right: 5, bottom: 5),
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(10),
                              color: select.newconcol,
                            ),
                            child: Text(
                              "New",
                              style: CustomTextStyle.newStle(
                                  context),
                            ),
                          ),
                        ),
                      ),
                      brend[index].discount != 0
                          ? Positioned(
                        top: -20,
                        left: -25,
                        child: RotationTransition(
                          turns:
                          new AlwaysStoppedAnimation(
                              15 / 360),
                          child: Container(
                            width: 63,
                            height: 38,
                            alignment:
                            Alignment.bottomRight,
                            padding: EdgeInsets.only(
                                right: 5, bottom: 5),
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(
                                  10),
                              color: select.mainColo,
                            ),
                            child: Text(
                              "-${brend[index].discount}%",
                              style: CustomTextStyle
                                  .disColor(context),
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
          ),
          childCount: brend.length,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
          crossAxisCount: 2,

          height: 225.0,  ));
  }
}
