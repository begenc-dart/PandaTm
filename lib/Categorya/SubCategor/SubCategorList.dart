import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:serpay/IpAdress.dart';
import 'package:serpay/MainPage/MainPagee/ProductMainPage/ProductMainPage.dart';


import '../../../../Model/TextColor.dart';
import '../../../../darkMode/theme_services.dart';

import '../../MainPage/MainPagee/model/HistoryProduct.dart';
import '../../MainPage/Product/Product.dart';

import '../Model/SubCategoriesProduct.dart';
class SubCategorList extends StatelessWidget {
  List<ProductSub> brend;
  String url;
  SubCategorList({required this.brend,required this.url});

  @override
  Widget build(BuildContext context) {
    return SliverList(
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
              width: MediaQuery.of(context).size.width,
              height: 100,
              margin: const EdgeInsets.only(
                  top: 15, right: 15, left: 15),
              decoration: BoxDecoration(
                color:
                ThemeServices().theme == ThemeMode.dark
                    ? const Color.fromRGBO(55, 55, 55, 1)
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
                                    width: 120,
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
                                                alignment: Alignment
                                                    .center,
                                                child:
                                                const CircularProgressIndicator(
                                                  color:
                                                  Colors.red,
                                                )),
                                        errorWidget: (context,
                                            url,
                                            error) =>
                                            Image.asset(
                                                "asset/Img/banner-img.jpg"),
                                        fit: BoxFit
                                            .fill,
                                      ),
                                    ));
                              },
                              options:
                              CarouselOptions(
                                viewportFraction: 1,
                                aspectRatio: 16 / 9,
                                height: 100,
                                // onPageChanged: (index, reason) {
                                //   productIndex.check(index);
                                // },
                                initialPage: 0,
                                enableInfiniteScroll:
                                true,
                                reverse: false,
                                autoPlay: false,
                                autoPlayInterval:
                                const Duration(
                                    seconds: 10),
                                autoPlayAnimationDuration:
                                const Duration(
                                    milliseconds:
                                    800),
                                autoPlayCurve: Curves
                                    .fastOutSlowIn,
                                enlargeCenterPage:
                                true,
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
                                const EdgeInsets.only(
                                    top: 5),
                                child: Text(
                                  url=="ru"?brend[index].nameRu:brend[index].nameTm,
                                  maxLines: 1,
                                  style: CustomTextStyle
                                      .nameTm(context),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.only(
                                    top: 5),
                                child: Text(
                                  url=="ru"? brend[index].bodyRu:brend[index].bodyTm,

                                  maxLines: 1,
                                  style: CustomTextStyle
                                      .desStyle(context),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment
                                    .spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                          brend[index]
                              .price!=null?  brend[index]
                                            .price!
                                            .toStringAsFixed(1):0.toString(),
                                        style:
                                        CustomTextStyle
                                            .priceColor(
                                            context),
                                      ),
                                      Container(
                                        width: 30,
                                        height: 12,
                                        margin:
                                        const EdgeInsets.only(
                                            left: 8),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius
                                                .circular(
                                                2),
                                            color: const Color
                                                .fromRGBO(
                                                196,
                                                196,
                                                196,
                                                1)),
                                        child: Center(
                                            child: Text(
                                              "TMT",
                                              style: CustomTextStyle
                                                  .TmCollist(
                                                  context),
                                            )),
                                      ),
                                    ],
                                  ),
                                  brend[index].priceOld !=
                                      null
                                      ? Text(
                                    "${brend[index].priceOld!.toStringAsFixed(1)} TMT",
                                    style: CustomTextStyle
                                        .disprice(
                                        context),
                                  )
                                      : Container(),
                                  ProductLikeList(
                                      like: brend[index].isLiked,
                                      id: brend[index].productId
                                  )
                                ],
                              ),

                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  brend[index].isNew != null
                      ? Positioned(
                    top: brend[index].discount != 0
                        ? -5
                        : -22,
                    left: -33,
                    child: RotationTransition(
                      turns:
                      new AlwaysStoppedAnimation(
                          15 / 360),
                      child: Container(
                        width: 63,
                        height: 38,
                        alignment:
                        Alignment.bottomRight,
                        padding: const EdgeInsets.only(
                            right: 5, bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(
                              10),
                          color: const Color.fromRGBO(
                              255, 199, 0, 1),
                        ),
                        child: Text(
                          "New",
                          style:
                          CustomTextStyle.newStle(
                              context),
                        ),
                      ),
                    ),
                  )
                      : Container(),
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
                        padding: const EdgeInsets.only(
                            right: 5, bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(
                              10),
                          color: const Color.fromRGBO(
                              255, 20, 29, 1),
                        ),
                        child: Text(
                          "-${brend[index].discount}%",
                          style: CustomTextStyle
                              .disColor(context),
                        ),
                      ),
                    ),
                  )
                      : Container(),
                ]),
              ),
            ),
          ),
          childCount: brend.length),
    );
  }
}
