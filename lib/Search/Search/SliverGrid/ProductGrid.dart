import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:serpay/IpAdress.dart';
import 'package:serpay/Ui/MainPage/search/SearchMode.dart';
import 'package:serpay/darkMode/theme_services.dart';

import '../../../MainPage/MainPagee/ProductMainPage/ProductMainPage.dart';
import '../../../MainPage/PhotoIndex.dart';
import '../../../MainPage/Product/Product.dart';
import '../../../Model/TextColor.dart';
import '../../../language.dart';

class GridProduct extends StatelessWidget {
  List<Data> searchProdut;
String url;
  GridProduct({required this.searchProdut,required this.url});

int a=0;

  @override
  Widget build(BuildContext context) {

    return SliverGrid(
      delegate: SliverChildBuilderDelegate((context, index) =>
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      ProductDetails(
                        productId: searchProdut[index].productId, image: searchProdut[index].images,
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
                              CarouselSlider.builder(
                                itemCount: searchProdut[index].images.length,
                                itemBuilder: (BuildContext context,
                                    int itemIndex, int pageViewIndex) =>
                                    Container(
                                        width: MediaQuery
                                            .of(context)
                                            .size
                                            .width,
                                        height: 120,
                                        child: (searchProdut[itemIndex].images
                                            .length !=
                                            0)
                                            ? ClipRRect(
                                          borderRadius:
                                          BorderRadius.only(
                                              topRight: Radius
                                                  .circular(10),
                                              topLeft:
                                              Radius.circular(
                                                  10)),
                                          child: CachedNetworkImage(
                                            imageUrl: "${IpAddress()
                                                .ipAddress}/" +
                                                searchProdut[index]
                                                    .images[itemIndex].image,
                                            placeholder: (context,
                                                url) =>
                                                Container(
                                                    alignment:
                                                    Alignment
                                                        .center,
                                                    child:
                                                    CircularProgressIndicator(
                                                      color: select
                                                          .mainColo,
                                                    )),
                                            errorWidget: (context,
                                                url, error) =>
                                                Image.asset(
                                                    "asset/Img/banner-img.jpg"),
                                            fit: BoxFit.fill,
                                          ),
                                        )
                                            : Image.asset(
                                            "assets/images/1.jpg")),
                                options: CarouselOptions(
                                  viewportFraction: 1,
                                  height:
                                  120,
                                  aspectRatio: 16 / 9,
                                  onPageChanged: (index, reason) {
                                   a=index;

                                    // setState(() {
                                    //   currentPos = index;
                                    // });
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
                              ),

                            ],
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 10, top: 10,bottom: 5),
                              child: Text(url=="ru"?searchProdut[index].nameRu:searchProdut[index].nameTm,
                                  maxLines: 1,
                                  style: CustomTextStyle.desStyle(context)),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: 5, left: 10, bottom: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        searchProdut[index].price != null
                                            ? searchProdut[index].price
                                            .toStringAsFixed(1)
                                            : "",
                                        style: CustomTextStyle.priceColor(
                                            context),
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
                                              style: CustomTextStyle.TmCol(
                                                  context)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 17),
                                    child: Text(
                                      searchProdut[index].priceOld != null
                                          ? "${searchProdut[index].priceOld
                                          .toStringAsFixed(1)}TMT":"",
                                      style:
                                      CustomTextStyle.disprice(context),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                          right: 10,
                          top: 10,
                          child:  ProductLikeList(
                              like: searchProdut[index].isLiked,
                              id: searchProdut[index].productId
                          )),
                      searchProdut[index].isNew != null&&searchProdut[index].isNew==true
                          ? Positioned(
                        top:  searchProdut[index].discount != null&&searchProdut[index].discount!=0 ? -5 : -22,
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
                      searchProdut[index].discount != null&&searchProdut[index].discount!=0
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
                              "-${searchProdut[index].discount}%",
                              style: CustomTextStyle.disColor(context),
                            ),
                          ),
                        ),
                      )
                          : Container(),
                    ],
                  ),
                ),
              ),
            ),
          ), childCount: searchProdut.length),

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
        crossAxisCount: 2,

        height: 200.0,  ),);
  }
}
