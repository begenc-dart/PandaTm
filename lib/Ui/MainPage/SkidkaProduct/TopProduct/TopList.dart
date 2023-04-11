import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:serpay/IpAdress.dart';
import 'package:serpay/MainPage/MainPagee/ProductMainPage/ProductMainPage.dart';
import 'package:serpay/MainPage/Model/BannerProdcutModel.dart';
import 'package:serpay/MainPage/Product/Product.dart';

import '../../../../MainPage/MainPagee/model/HistoryProduct.dart';
import '../../../../MainPage/Model/BannerProductModel.dart';
import '../../../../MainPage/Model/SellerProduct.dart';
import '../../../../Model/TextColor.dart';
import '../../../../darkMode/theme_services.dart';
import 'TopProductModel.dart';


class TopList extends StatefulWidget {
  List<TopRow> brend;
String url;
  TopList({required this.brend,required this.url});

  @override
  State<TopList> createState() => _TopListState();
}

class _TopListState extends State<TopList> {
int current=0;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
              (context, index) => InkWell(
            onTap: () {
              HistoryProduct().history(widget.brend[index].productId);
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductDetails(
                    productId: widget.brend[index].productId, image: widget.brend[index].images,
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
                            widget.brend[index].images.length != 0
                                ? CarouselSlider.builder(
                              itemCount: widget.brend[index].images.length,
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
                                            widget.brend[index]
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
                                onPageChanged: (index, reason) {
                                  current=index;
                                  setState(() {

                                  });
                                },
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
                            Positioned(
                              bottom: 5,
                              left: 0,right: 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: widget.brend[index]
                                    .images.map((url) {
                                  int indexx = widget.brend[index]
                                      .images.indexOf(url);
                                  return Container(
                                    width: 3.0,
                                    height: 3.0,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 3.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: current == indexx
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  widget.url=="ru"?  widget.brend[index].nameRu: widget.brend[index].nameTm,
                                  maxLines: 1,
                                  style: CustomTextStyle.nameTm(context),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Text(
                                  widget.url=="ru"? widget.brend[index].bodyRu:  widget.brend[index].bodyTm,
                                  style: CustomTextStyle.desStyle(context),
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
                                        widget.brend[index].price != null
                                            ? widget.brend[index]
                                            .price
                                            .toStringAsFixed(1)
                                            : "",
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
                                  widget.brend[index].priceOld != null
                                      ? Text(
                                    "${widget.brend[index].priceOld.toStringAsFixed(1)} TMT",
                                    style: CustomTextStyle.disprice(
                                        context),
                                  )
                                      : Container(),
                                  ProductLikeList(
                                      like: false,
                                      id: widget.brend[index].productId)
                                ],
                              ),

                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  widget.brend[index].isNew != null
                      ? Positioned(
                    top: widget.brend[index].discount != null && widget.brend[index].discount!=0? -5 : -22,
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
                  widget.brend[index].discount != null&&widget.brend[index].discount!=0
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
                          widget.brend[index].discount.toString()+"%",
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
          childCount: widget.brend.length),
    );
  }
}
