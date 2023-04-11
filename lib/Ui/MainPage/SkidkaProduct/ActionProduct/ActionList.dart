import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:serpay/IpAdress.dart';
import 'package:serpay/MainPage/MainPagee/ProductMainPage/ProductMainPage.dart';
import 'package:serpay/MainPage/MainPagee/model/HistoryProduct.dart';
import 'package:serpay/MainPage/Model/Action.dart';
import 'package:serpay/MainPage/Product/Product.dart';
import 'package:serpay/Model/TextColor.dart';
import 'package:serpay/darkMode/theme_services.dart';

class ActionList extends StatelessWidget {
  List actionProduct;
String url;
  ActionList({required this.actionProduct,required this.url});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
          (context, index) => InkWell(
                onTap: () {
                  HistoryProduct().history(actionProduct[index].productId);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductDetails(
                            productId: actionProduct[index].productId, image: actionProduct[index].images,
                          )));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 100,
                  margin: EdgeInsets.only(top: 15, right: 15, left: 15),
                  decoration: BoxDecoration(
                    color: ThemeServices().theme == ThemeMode.dark
                        ? Color.fromRGBO(55, 55, 55, 1)
                        : select.contaColor,
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
                                actionProduct[index].images!.length != 0
                                    ? CarouselSlider.builder(
                                        itemCount:
                                            actionProduct[index].images!.length,
                                        itemBuilder: (BuildContext context,
                                            int itemIndex, int pageViewIndex) {
                                          return Container(
                                              width: 120,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      "${IpAddress().ipAddress}/" +
                                                          actionProduct[index]
                                                              .images![itemIndex]
                                                              .image,
                                                  placeholder: (context, url) =>
                                                      Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color: Colors.red,
                                                          )),
                                                  errorWidget: (context, url,
                                                          error) =>
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
                                          autoPlayCurve: Curves.fastOutSlowIn,
                                          enlargeCenterPage: true,
                                          scrollDirection: Axis.horizontal,
                                        ),
                                      )
                                    : Image.asset("asset/Img/banner-img.jpg"),
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      url=="ru"?actionProduct[index].nameRu: actionProduct[index].nameTm,
                                      maxLines: 1,
                                      style: CustomTextStyle.nameTm(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      url=="ru"?actionProduct[index].bodyRu: actionProduct[index].bodyTm,
                                      maxLines: 1,
                                      style: CustomTextStyle.desStyle(context),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            actionProduct[index]
                                                .price
                                                .toStringAsFixed(1),
                                            style: CustomTextStyle.priceColor(
                                                context),
                                          ),
                                          Container(
                                            width: 30,
                                            height: 12,
                                            margin: EdgeInsets.only(left: 8),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                                color: Color.fromRGBO(
                                                    196, 196, 196, 1)),
                                            child: Center(
                                                child: Text(
                                              "TMT",
                                              style: CustomTextStyle.TmCollist(
                                                  context),
                                            )),
                                          ),
                                        ],
                                      ),
                                      actionProduct[index].priceOld != null&&actionProduct[index].priceOld!=0
                                          ? Text(
                                              "${actionProduct[index].priceOld} TMT",
                                              style: CustomTextStyle.disprice(
                                                  context),
                                            )
                                          : Container(),
                                      ProductLikeList(
                                          like: actionProduct[index].isLiked,
                                          id: actionProduct[index].productId
                                      )
                                    ],
                                  ),

                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      actionProduct[index].isNew != null
                          ? Positioned(
                              top: actionProduct[index].discount != null&& actionProduct[index].discount!=0
                                  ? -5
                                  : -22,
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
                      actionProduct[index].discount != null &&actionProduct[index].discount!=0
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
                                    color: Color.fromRGBO(255, 20, 29, 1),
                                  ),
                                  child: Text(
                                    "-${actionProduct[index].discount}%",
                                    style: CustomTextStyle.disColor(context),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                    ]),
                  ),
                ),
              ),
          childCount: actionProduct.length),
    );
  }
}
