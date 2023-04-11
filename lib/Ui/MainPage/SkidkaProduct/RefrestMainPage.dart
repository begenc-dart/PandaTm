import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:serpay/MainPage/MainPagee/Banner/banner.dart';

import '../../../IpAdress.dart';
import '../../../MainPage/MainPagee/ProductMainPage/ProductMainPage.dart';
import '../../../MainPage/MainPagee/Skidka/Skidka.dart';
import '../../../Model/TextColor.dart';
import '../../../darkMode/theme_services.dart';
import '../../../main.dart';
import '../Aksiya/Aksiya.dart';
import '../search/Search.dart';

class RefrestMainPage extends StatelessWidget {
   RefrestMainPage(
       {required this.nameTm,
   required   this.priceOld,
  required    this.images,
   required   this.bodyRu,
   required   this.discount,
   required   this.Price,
    required  this.nameRu,
    required  this.bodyTm,
    required  this.caar}) ;
  List bodyTm ;
  List bodyRu ;
  List nameTm ;
  List nameRu ;
  List Price ;
  List images ;
  List priceOld ;
  List discount ;
  List caar ;
  @override
  Widget build(BuildContext context) {
    // method();
    // debugPrint(images.toString());
    return CustomScrollView(
      slivers: [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                padding: EdgeInsets.only(
                    bottom: 15, top: MediaQuery.of(context).size.height * 0.02),
                decoration: BoxDecoration(
                    gradient: ThemeServices().theme == ThemeMode.light
                        ? LinearGradient(
                            colors: [select.mainColo, select.gradie],
                            begin: Alignment.center,
                            end: Alignment.bottomRight)
                        : null,
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10))),
                child: Stack(
                  children: [
                    ThemeServices().theme == ThemeMode.light
                        ? Positioned(
                            child: Image.asset(
                                "asset/MainPagePhoto/gift-dynamic-gradient (1).png"),
                            right: -70,
                            top: 10,
                          )
                        : Container(),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 15),
                          child: Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    // ThemeServices().switchTheme();
                                    // Navigator.pushAndRemoveUntil(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => MyApp()),(Route<dynamic> route) => true);
                                  },
                                  child: SvgPicture.asset(
                                      "asset/icon/Subtract (2).svg")),
                              Expanded(
                                child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    width: MediaQuery.of(context).size.width,
                                    padding: const EdgeInsets.only(
                                        left: 15, right: 15),
                                    height: 40,
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                        color: select.searh,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Search",
                                          style: CustomTextStyle.searchStyle(
                                              context),
                                        ),
                                        SvgPicture.asset("asset/icon/qr.svg")
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SvgPicture.asset(
                                "asset/icon/Group 59 (1).svg",
                              )
                              //color: ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(174, 174, 174, 1):Colors.white,)
                            ],
                          ),
                        ),
                        Stack(
                          children: [
                            CarouselSlider.builder(
                              itemCount: caar.length,
                              itemBuilder: (BuildContext context, int itemIndex,
                                      int pageViewIndex) =>
                                  Container(
                                      padding:
                                          EdgeInsets.only(left: 5, right: 5),
                                      child: (caar[itemIndex] != null)
                                          ? InkWell(
                                              onTap: () {
                                                // Navigator.of(context).push(
                                                //     MaterialPageRoute(
                                                //         builder: (context) =>
                                                //            Categoriya()));
                                              },
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      "${IpAddress().ipAddress}/" +
                                                          caar[itemIndex]!,
                                                  placeholder: (context, url) =>
                                                      Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child:
                                                              CircularProgressIndicator(
                                                            color:
                                                                select.mainColo,
                                                          )),
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      Image.asset(
                                                          "asset/Img/banner-img.jpg"),
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            )
                                          : Image.asset(
                                              "asset/Img/banner-img.jpg")),
                              options: CarouselOptions(
                                viewportFraction: 1,
                                height: 200,
                                aspectRatio: 16 / 9,
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
                      ],
                    ),
                  ],
                ),
              ),
              Stack(children: [
                ThemeServices().theme == ThemeMode.light
                    ? Positioned(
                        left: -50,
                        child: Image.asset(
                            "asset/MainPagePhoto/bag-dynamic-color.png"))
                    : Container(),
                Column(children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    margin: EdgeInsets.only(left: 15, right: 15, top: 5),
                    decoration: BoxDecoration(
                        color: ThemeServices().theme == ThemeMode.dark
                            ? Color.fromRGBO(55, 55, 55, 1)
                            : Color.fromRGBO(255, 20, 29, 0.15),
                        border: Border.all(
                            color: Color.fromRGBO(255, 255, 255, 0.35)),
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        nameTm.length < 3 ? nameTm.length : 4,
                        (int index) {
                          return index != 0
                              ? Container(
                                  width: 70,
                                  height: 80,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 7),
                                        child: images.length == null
                                            ? Image.asset(
                                                "asset/Img/aksiya 1.jpg")
                                            : CachedNetworkImage(
                                                height: 50,
                                                imageUrl:
                                                    "${IpAddress().ipAddress}/" +
                                                        images[index].toString(),
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
                                      ),
                                      Text(
                                        nameTm[index].toString(),
                                        maxLines: 1,
                                        textAlign: TextAlign.center,
                                        style:
                                            CustomTextStyle.Skidkapro(context),
                                      )
                                    ],
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    width: 70,
                                    height: 75,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                          color: select.mainColo, width: 0.5),
                                      gradient: LinearGradient(
                                          colors: [
                                            Color.fromRGBO(255, 211, 213, 1),
                                            Color.fromRGBO(255, 246, 222, 1)
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight),
                                    ),
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 7),
                                          child: Image.asset(
                                              "asset/Img/aksiya 1.jpg"),
                                        ),
                                        Text(
                                          "Aksiýa",
                                          style:
                                              CustomTextStyle.newSty(context),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                        },
                      ),
                    ),
                  )
                ]),
              ]),
              Stack(
                children: [
                  ThemeServices().theme == ThemeMode.light
                      ? Positioned(
                          right: -50,
                          child: Image.asset(
                              "asset/MainPagePhoto/headphone-dynamic-color.png"))
                      : Container(),
                  Column(
                    children: [
                      // Aksiya(
                      //   img: "asset/Img/new.jpg",
                      //   namepro: "Täzeler",
                      // ),
                      Row(
                        children: [
                          Expanded(
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 6, top: 10),
                                  child: InkWell(
                                    onTap: () {},
                                    child: Skidka(
                                      imgUrl: "asset/Img/aksiya.jpg",
                                      name: "Skidka",
                                    ),
                                  ))),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(right: 15, top: 10),
                            child: Skidka(
                              imgUrl: "asset/Img/top.jpg",
                              name: "Top sales",
                            ),
                          )),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => InkWell(
                onTap: () {},
                child: Container(
                  height: 200,
                  margin: index % 2 == 0
                      ? EdgeInsets.only(left: 15, top: 15)
                      : EdgeInsets.only(right: 15, top: 15, left: 15),
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
                            children: [
                              Stack(
                                children: [
                                  images.length != 0
                                      ? CarouselSlider.builder(
                                          itemCount: images.length,
                                          itemBuilder: (BuildContext context,
                                              int itemIndex,
                                              int pageViewIndex) {
                                            return Container(
                                                width: double.infinity,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        "${IpAddress().ipAddress}/" +
                                                            images[index].toString(),
                                                    placeholder: (context,
                                                            url) =>
                                                        Container(
                                                            alignment: Alignment
                                                                .center,
                                                            child:
                                                                CircularProgressIndicator(
                                                              color: Colors.red,
                                                            )),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Image.asset(
                                                      "asset/Img/banner-img.jpg",
                                                      fit: BoxFit.fill,
                                                    ),
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
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10),
                                child: Text(nameTm[index].toString(),
                                    maxLines: 1,
                                    style: CustomTextStyle.nameTm(context)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 10),
                                child: Text(bodyTm[index].toString(),
                                    maxLines: 1,
                                    style: CustomTextStyle.desStyle(context)),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    top: 5, left: 10, bottom: 5),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          Price[index].toString(),
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
                                    discount[index] != 0
                                        ? Padding(
                                            padding: const EdgeInsets.only(
                                                right: 17),
                                            child: Text(
                                              "${priceOld[index]} TMT",
                                              style: CustomTextStyle.disprice(
                                                  context),
                                            ),
                                          )
                                        : Container()
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            top: discount[index] != null ? -5 : -25,
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
                          discount[index] != null
                              ? Positioned(
                                  top: -20,
                                  left: -25,
                                  child: RotationTransition(
                                    turns: new AlwaysStoppedAnimation(15 / 360),
                                    child: Container(
                                      width: 63,
                                      height: 38,
                                      alignment: Alignment.bottomRight,
                                      padding:
                                          EdgeInsets.only(right: 5, bottom: 5),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: select.mainColo,
                                      ),
                                      child: Text(
                                        "-${discount[index]} %",
                                        style:
                                            CustomTextStyle.disColor(context),
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
              childCount: 6,
            ),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300, childAspectRatio: 18 / 20))
      ],
    );
  }
}
