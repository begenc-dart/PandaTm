import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:serpay/IpAdress.dart';
import 'package:serpay/darkMode/theme_services.dart';

import '../../../MainPage/MainPagee/ProductMainPage/ProductMainPage.dart';
import '../../../MainPage/Product/Product.dart';
import '../../../Model/TextColor.dart';
import '../../../Ui/MainPage/search/SearchMode.dart';
import '../../../language.dart';

class ProductList extends StatelessWidget {
  List<Data> pro;
String url;
  ProductList({required this.pro,required this.url});

  @override
  Widget build(BuildContext context) {
    // final productIndex = Provider.of<ProductIndex>(context);

    return SliverList(
      delegate: SliverChildBuilderDelegate(
          (context, index) => InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductDetails(
                            productId: pro[index].productId,
                            image: pro[index].images,
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
                                pro[index].images.length != 0
                                    ? CarouselSlider.builder(
                                        itemCount: pro[index].images.length,
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
                                                          pro[index]
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
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            pro[index].price != 0 &&
                                                    pro[index].price != null
                                                ? pro[index]
                                                    .price
                                                    .toStringAsFixed(1)
                                                : "0",
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
                                      pro[index].priceOld != null &&
                                              pro[index].priceOld != 0
                                          ? Text(
                                              "${pro[index].priceOld.toStringAsFixed(1)} TMT",
                                              style: CustomTextStyle.disprice(
                                                  context),
                                            )
                                          : Container(),
                                      ProductLikeList(
                                          like: pro[index].isLiked,
                                          id: pro[index].productId
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      url=="ru"?pro[index].nameRu:pro[index].nameTm,
                                      maxLines: 1,
                                      style: CustomTextStyle.nameTm(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Text(
                                      url=="ru"? pro[index].bodyRu:pro[index].bodyTm,
                                      style: CustomTextStyle.desStyle(context),
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      pro[index].isNew != null && pro[index].isNew == true
                          ? Positioned(
                              top: pro[index].discount != null &&
                                      pro[index].discount != 0
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
                                    "new",
                                    style: CustomTextStyle.newStle(context),
                                  ),
                                ),
                              ),
                            )
                          : Container(),
                      pro[index].discount != null && pro[index].discount != 0
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
                                    "-${pro[index].discount}%",
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
          childCount: pro.length),
    );
  }
}
