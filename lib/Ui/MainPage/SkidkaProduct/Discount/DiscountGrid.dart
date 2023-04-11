import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:serpay/IpAdress.dart';
import 'package:serpay/MainPage/MainPagee/ProductMainPage/ProductMainPage.dart';
import 'package:serpay/MainPage/Model/DiscountModel.dart';
import 'package:serpay/MainPage/Product/Product.dart';

import '../../../../MainPage/MainPagee/model/HistoryProduct.dart';
import '../../../../Model/TextColor.dart';
import '../../../../darkMode/theme_services.dart';

class DiscountGrid extends StatefulWidget {
List<Rowes> dis;
String url;
DiscountGrid({required this.dis,required this.url});

  @override
  State<DiscountGrid> createState() => _DiscountGridState();
}

class _DiscountGridState extends State<DiscountGrid> {
  @override
  int a=0;
  Widget build(BuildContext context) {
    return SliverGrid(
        delegate: SliverChildBuilderDelegate(
              (context, index) => InkWell(
            onTap: () {
              HistoryProduct().history(widget.dis[index].productId);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductDetails(
                    productId: widget.dis[index].productId, image: widget.dis[index].images,
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
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
                          children: [
                            widget.dis[index].images.length != 0
                                ? CarouselSlider.builder(
                              itemCount: widget.dis[index]
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
                                            widget.dis[index]
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
                                onPageChanged: (index, reason) {
                                 a=index;
                                 setState(() {

                                 });
                                },
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
                            Positioned(
                              bottom: 5,
                              left: 0,right: 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: widget.dis[index]
                                    .images.map((url) {
                                  int indexx =widget.dis[index]
                                      .images.indexOf(url);
                                  return Container(
                                    width: 3.0,
                                    height: 3.0,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 3.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: a == indexx
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
                              left: 10, right: 10,top: 10,bottom: 10 ),
                          child: Text(widget.url=="ru"?widget.dis[index].nameRu:widget.dis[index].nameTm,
                              maxLines: 1,
                              style: CustomTextStyle.nameTm(
                                  context)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10),
                          child: Text(widget.url=="ru"?widget.dis[index].bodyRu:widget.dis[index].bodyTm,
                              maxLines: 1,
                              style: CustomTextStyle.desStyle(
                                  context)),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: 5, left: 10, bottom: 10),
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
                          widget.dis[index]
                              .price!=null? widget.dis[index]
                                        .price
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
                              widget.dis[index].discount != null
                                  ? Padding(
                                padding:
                                const EdgeInsets
                                    .only(
                                    right: 17),
                                child: Text(
                                    widget.dis[index].priceOld!=null?  "${widget.dis[index].priceOld.toStringAsFixed(1)} TMT":"0 TMT",
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
                        like: widget.dis[index].isLiked,
                        id: widget.dis[index].productId
                    ),
                    Positioned(
                      top: widget.dis[index].discount != null
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
                    widget.dis[index].discount != null
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
                            "-${widget.dis[index].discount}%",
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
          childCount: widget.dis.length,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
          crossAxisCount: 2,

          height: 230.0,  ));
  }
}
