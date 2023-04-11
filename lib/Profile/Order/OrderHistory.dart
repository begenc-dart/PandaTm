import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:serpay/darkMode/theme_services.dart';

import '../../HttpModel/BannerGet.dart';
import '../../IpAdress.dart';
import '../../Language/Language.dart';
import '../../LogIn/LogIn/Model/token.dart';
import '../../MainPage/PhotoIndex.dart';


import '../../MainPage/Product/Product.dart';
import 'OrderDetails.dart';
import 'OrderModels.dart';

class Deliver extends StatefulWidget {
  String a;
  String languageModel;
  String url;
  Deliver({required this.a,required this.languageModel,required this.url});
  @override
  State<Deliver> createState() => _DeliverState();
}

class _DeliverState extends State<Deliver> {
  @override
  List photoProduct = [
    "https://dlcdnrog.asus.com/rog/media/1610705538274.jpg",
    "https://dlcdnrog.asus.com/rog/media/1539690389456.jpg",
    "https://www.sentinels.gg/s/SEN-Championship-Mood.png"
  ];

  String checkLike = "";

  late String token;

  List<OrderDetails> prod = [];

  late OrderDetails orderDetails;

  String ip = IpAddress().ipAddress;
  late Future<OrderDetails> order;

  @override
  void initState() {
    // TODO: implement initState
    order = OrderModels().canceled(widget.a);
    OrderModels().canceled(widget.a).then((value) {
      debugPrint(value.count.toString());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeServices().theme == ThemeMode.dark
            ? const Color.fromRGBO(39, 39, 39, 1)
            : const Color.fromRGBO(250, 250, 250, 1),
        title: Text(
          widget.languageModel,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: ThemeServices().theme == ThemeMode.dark
                  ? Colors.white
                  : const Color.fromRGBO(39, 39, 39, 1)),
        ),
      ),
      body: FutureBuilder(
          future: order,
          builder: (context, AsyncSnapshot<OrderDetails> sonuc) {
            debugPrint(sonuc.data.toString());
            if (sonuc.hasData) {
              return CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.all(8),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: ThemeServices().theme == ThemeMode.dark
                                  ? const Color.fromRGBO(48, 48, 48, 1)
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          DateFormat('M/d/y').format(
                                              sonuc.data!.orders[index].date),
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: ThemeServices().theme ==
                                                      ThemeMode.dark
                                                  ? const Color.fromRGBO(
                                                      174, 174, 174, 1)
                                                  : const Color.fromRGBO(
                                                      71, 71, 71, 1)),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              for (int i = 0;
                                  i < sonuc.data!.orders[index].orders.length;
                                  i++)
                                InkWell(
                                  onTap:(){
                                    Navigator.of(context).push(MaterialPageRoute(
                                        builder: (context) => ProductDetails(
                                          productId: sonuc.data!.orders[index].orders[i].productId, image: [],
                                        )));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 7),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color.fromRGBO(
                                                229, 229, 229, 1),
                                            width: 1),
                                        borderRadius: BorderRadius.circular(5),
                                        color: ThemeServices().theme ==
                                                ThemeMode.dark
                                            ? const Color.fromRGBO(55, 55, 55, 1)
                                            : const Color.fromRGBO(
                                                243, 243, 243, 1),
                                      ),
                                      child: Stack(
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                      "${IpAddress().ipAddress}/" +
                                                          sonuc
                                                              .data!
                                                              .orders[index]
                                                              .orders[i]
                                                              .image,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Padding(
                                                  padding: const EdgeInsets.only(
                                                      left: 15,
                                                      right: 10,
                                                      top: 10),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                       widget.url=="ru"? sonuc.data!.orders[index]
                                                            .orders[i].nameRu:sonuc.data!.orders[index]
                                                           .orders[i].nameTm,
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                            fontSize: 14,
                                                            fontWeight:
                                                            FontWeight.w400,
                                                            color: ThemeServices()
                                                                .theme ==
                                                                ThemeMode.dark
                                                                ? const Color
                                                                .fromRGBO(
                                                                250,
                                                                250,
                                                                250,
                                                                1)
                                                                : const Color
                                                                .fromRGBO(
                                                                84,
                                                                84,
                                                                84,
                                                                1)),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [

                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    bottom: 5),
                                                            child: Row(
                                                              children: [
                                                                Text(
                                                                  sonuc
                                                                      .data!
                                                                      .orders[
                                                                          index]
                                                                      .orders[i]
                                                                      .price
                                                                      .toString(),
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize: 15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    color: const Color
                                                                            .fromRGBO(
                                                                        255,
                                                                        20,
                                                                        29,
                                                                        1),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: 30,
                                                                  height: 15,
                                                                  margin:
                                                                      const EdgeInsets
                                                                              .only(
                                                                          left:
                                                                              7),
                                                                  decoration: BoxDecoration(
                                                                      color: const Color
                                                                              .fromRGBO(
                                                                          196,
                                                                          196,
                                                                          196,
                                                                          1),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              2)),
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child:
                                                                      const Text(
                                                                    "TMT",
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontSize:
                                                                            10,
                                                                        color: const Color
                                                                                .fromRGBO(
                                                                            255,
                                                                            255,
                                                                            255,
                                                                            1)),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 26,
                                                            height: 20,
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          2),
                                                              border: Border.all(
                                                                  color: const Color
                                                                          .fromRGBO(
                                                                      174,
                                                                      174,
                                                                      174,
                                                                      1),
                                                                  width: 0.8),
                                                            ),
                                                            child: Text(
                                                              "x${sonuc.data!.orders[index].orders[i].quantity}",
                                                              style: const TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontSize: 14,
                                                                  color: const Color
                                                                          .fromRGBO(
                                                                      174,
                                                                      174,
                                                                      174,
                                                                      1)),
                                                              textAlign: TextAlign
                                                                  .center,
                                                            ),
                                                          )
                                                        ],
                                                      ),

                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                            ],
                          ),
                        );
                      },
                      // 40 list items
                      childCount: sonuc.data!.orders.length,
                    ),
                  ),
                ],
              );
            } else {
              return Container();
            }
          }),
    );
  }
}
