import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:serpay/IpAdress.dart';
import 'package:serpay/MainPage/MainPagee/ProductMainPage/ProductMainPage.dart';
import 'package:serpay/Model/mainModel.dart';

import '../../../../Services/HistoryProduct.dart';
import '../../../../MainPage/Product/Product.dart';
import '../../../../Model/TextColor.dart';
import '../../../../darkMode/theme_services.dart';

class NewProductList extends StatefulWidget {
  List newProduct;
  String url;
  NewProductList({required this.newProduct,required this.url});

  @override
  State<NewProductList> createState() => _NewProductListState();
}

class _NewProductListState extends State<NewProductList> {
  @override
  int a=0;
  Widget build(BuildContext context) {

    return SliverList(
      delegate: SliverChildBuilderDelegate(
              (context, index) {
                List one=widget.newProduct[index].images;
                return InkWell(
                onTap: () {
                  HistoryProduct().history(widget.newProduct[index].productId);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductDetails(
                        productId: widget.newProduct[index].productId, image: widget.newProduct[index].images,
                      )));
                },
                child: Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            margin: EdgeInsets.only(
                  top: 15, right: 15, left: 15),
            decoration: BoxDecoration(
                color:
                ThemeServices().theme == ThemeMode.dark
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
                            widget.newProduct[index].images.length != 0
                                ? CarouselSlider.builder(
                              itemCount: widget.newProduct[index]
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
                                            widget.newProduct[index]
                                                .images[
                                            itemIndex]
                                                .image,
                                        placeholder: (context,
                                            url) =>
                                            Container(

                                               ),
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
                                enlargeCenterPage:
                                true,
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
                                children: one.map((url) {
                                  int indexx = one
                                      .indexOf(url);
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
                                  widget.url=="ru"?widget.newProduct[index].nameRu: widget.newProduct[index].nameTm,
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
                                  widget.url=="ru"?widget.newProduct[index].bodyRu: widget.newProduct[index].bodyTm,
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
                          widget.newProduct[index]
                              .price!=null? widget.newProduct[index]
                                            .price
                                            .toStringAsFixed(1):"0",
                                        style:
                                        CustomTextStyle
                                            .priceColor(
                                            context),
                                      ),
                                      Container(
                                        width: 30,
                                        height: 12,
                                        margin:
                                        EdgeInsets.only(
                                            left: 8),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius
                                                .circular(
                                                2),
                                            color: Color
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
                                  widget.newProduct[index].priceOld !=
                                      null &&widget.newProduct[index].priceOld!=0
                                      ? Text(
                                    "${widget.newProduct[index].priceOld.toStringAsFixed(1)} TMT",
                                    style: CustomTextStyle
                                        .disprice(
                                        context),
                                  )
                                      : Container(),
                                  ProductLikeList(
                                      like: widget.newProduct[index].isLiked,
                                      id: widget.newProduct[index].productId
                                  )
                                ],
                              ),

                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  widget.newProduct[index].isNew != null&&widget.newProduct[index].isNew==true
                      ? Positioned(
                    top: widget.newProduct[index].discount != 0&& widget.newProduct[index].discount!=null
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
                        padding: EdgeInsets.only(
                            right: 5, bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius:
                          BorderRadius.circular(
                              10),
                          color: Color.fromRGBO(
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
                  widget.newProduct[index].discount != 0&& widget.newProduct[index].discount!=null
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
                          color: Color.fromRGBO(
                              255, 20, 29, 1),
                        ),
                        child: Text(
                          "-${widget.newProduct[index].discount}%",
                          style: CustomTextStyle
                              .disColor(context),
                        ),
                      ),
                    ),
                  )
                      : Container(),
                ]),
            ),
          )
              );},
          childCount: widget.newProduct.length),
    );
  }
}
