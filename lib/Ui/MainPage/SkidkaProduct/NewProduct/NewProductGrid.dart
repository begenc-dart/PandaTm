import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:serpay/IpAdress.dart';
import 'package:serpay/MainPage/MainPagee/ProductMainPage/ProductMainPage.dart';
import 'package:serpay/MainPage/MainPagee/model/HistoryProduct.dart';

import '../../../../MainPage/Model/mainModel.dart';
import '../../../../MainPage/Product/Product.dart';
import '../../../../Model/TextColor.dart';
import '../../../../darkMode/theme_services.dart';

class NewProductGrid extends StatefulWidget {
  List<NewProduct> newProduct;
  String url;
  NewProductGrid({required this.newProduct,required this.url});

  @override
  State<NewProductGrid> createState() => _NewProductGridState();
}

class _NewProductGridState extends State<NewProductGrid> {
  @override
  int a=0;
  Widget build(BuildContext context) {
    return  SliverGrid(
        delegate: SliverChildBuilderDelegate(
              (context, index) => InkWell(
            onTap: () {
              HistoryProduct().history(widget.newProduct[index].productId);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductDetails(
                    productId: widget.newProduct[index].productId, image: widget.newProduct[index].images,
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Stack(
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
                                      width: double.infinity,
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
                                  children: widget.newProduct[index]
                                      .images.map((url) {
                                    int indexx = widget.newProduct[index]
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
                                left: 10, right: 10, top: 10),
                            child: Text(widget.url=="ru"?widget.newProduct[index].nameRu:widget.newProduct[index].nameTm,
                                maxLines: 1,
                                style: CustomTextStyle.nameTm(
                                    context)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10,bottom: 10),
                            child: Text(widget.url=="ru"?widget.newProduct[index].bodyRu:widget.newProduct[index].bodyTm,
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
                            widget.newProduct[index]
                                .price!=null? widget.newProduct[index]
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
                                widget.newProduct[index].priceOld != null&&widget.newProduct[index].priceOld!=0
                                    ? Padding(
                                  padding:
                                  const EdgeInsets
                                      .only(
                                      right: 17),
                                  child: Text(
                                    "${widget.newProduct[index].priceOld.toStringAsFixed(1)} TMT",
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
                          like: widget.newProduct[index].isLiked,
                          id: widget.newProduct[index].productId
                      ),
                      widget.newProduct[index].isNew==true? Positioned(
                        top: widget.newProduct[index].discount != 0 && widget.newProduct[index].discount!=null
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
                      ):Container(),
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
                              color: select.mainColo,
                            ),
                            child: Text(
                              "-${widget.newProduct[index].discount}%",
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
          childCount: widget.newProduct.length,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
          crossAxisCount: 2,

          height: 230.0,  ));
  }
}
