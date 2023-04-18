import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:serpay/IpAdress.dart';
import 'package:serpay/MainPage/MainPagee/ProductMainPage/ProductMainPage.dart';
import 'package:serpay/MainPage/Model/Product.dart';
import 'package:serpay/darkMode/theme_services.dart';

import '../../../Model/TextColor.dart';
import '../../PhotoIndex.dart';
import '../Product.dart';

class ProductRelated extends StatelessWidget {
  int index;
  List<OneProduct> recommenendations;
String url;
  ProductRelated({required this.index, required this.recommenendations,required this.url});

  @override
  Widget build(BuildContext context) {


    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) =>
            ProductDetails(
              productId: recommenendations[index].productId,image: recommenendations[index].images,), ),);

      },
      child: Container(
        margin: index % 2 == 0
            ? EdgeInsets.only(left: 15, top: 15,right: 7)
            : EdgeInsets.only(right: 15, top: 15, left: 7),
        decoration: BoxDecoration(
            color: ThemeServices().theme == ThemeMode.dark
                ? Color.fromRGBO(55, 55, 55, 1)
                : select.contaColor,
            borderRadius: BorderRadius.circular(10)
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    child: Stack(
                      children: [
                        CarouselSlider.builder(
                          itemCount:
                          recommenendations[index].images.length,
                          itemBuilder: (BuildContext context,
                              int itemIndex, int pageViewIndex) {
                            return Container(
                                width: double.infinity,
                                child: ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(5),
                                  child:recommenendations[index].images.length!=0 ? CachedNetworkImage(
                                    imageUrl:
                                    "${IpAddress().ipAddress}/" +
                                        recommenendations[index].images[itemIndex].image,
                                    placeholder: (context, url) =>
                                        Container(
                                          ),
                                    errorWidget:
                                        (context, url, error) =>
                                        Image.asset(
                                          "asset/Img/banner-img.jpg",
                                          fit: BoxFit.fill,
                                        ),
                                    fit: BoxFit.fill,
                                  ): Image.asset(
                                    "asset/Img/banner-img.jpg",
                                    fit: BoxFit.fill,
                                  ),
                                ));
                          },
                          options: CarouselOptions(
                            viewportFraction: 1,
                            aspectRatio: 16 / 9,
                            height: 115,
                            // onPageChanged: (index, reason) {
                            //   productIndex.check(index);
                            // },
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
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Text(url=="ru"? recommenendations
                          [index].nameRu.toString():recommenendations
                         [index].nameTm.toString(),
                          maxLines: 1,
                          style: CustomTextStyle.nameTm(context)),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 10),
                      child: Text(url=="ru"?recommenendations[index].bodyRu:recommenendations[index].bodyTm,
                          maxLines: 1,
                          style: CustomTextStyle.desStyle(context)),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(top: 5, left: 10, bottom: 5),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                      recommenendations[index].price!=null? recommenendations[index].price
                                    .toStringAsFixed(1):"0",
                                style: CustomTextStyle.priceColor(context),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                width: 22,
                                height: 10,
                                decoration: BoxDecoration(
                                    color: select.tmConCol,
                                    borderRadius: BorderRadius.circular(2)),
                                child: Center(
                                  child: Text("TMT",
                                      style: CustomTextStyle.TmCol(context)),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 17),
                            child: Text(
                                recommenendations[index].priceOld!=null?  recommenendations[index].priceOld!
                                  .toStringAsFixed(1) +
                                  " TMT":"",
                              style: CustomTextStyle.disprice(context),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              ProductLike(
                  like: recommenendations[index].isLiked,
                  id: recommenendations[index].productId
              ),
              Positioned(
                top: recommenendations[index].discount != null&&recommenendations[index].discount != 0
                    ? -5
                    : -25,
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
                      color: select.newconcol,
                    ),
                    child: Text(
                      "New",
                      style: CustomTextStyle.newStle(context),
                    ),
                  ),
                ),
              ),
              recommenendations[index].discount != null&&recommenendations[index].discount != 0
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
                            color: select.mainColo,
                          ),
                          child: Text(
                            "-${recommenendations[index].discount}%",
                            style: CustomTextStyle.disColor(context),
                          ),
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}
