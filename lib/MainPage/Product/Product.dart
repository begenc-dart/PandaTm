import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:serpay/IpAdress.dart';
import 'package:serpay/LogIn/LogIn/Model/checkSignUp.dart';
import 'package:serpay/LogIn/LogIn/Model/token.dart';
import 'package:serpay/MainPage/Model/Product.dart';
import 'package:serpay/MainPage/Product/AppBarProduct/AppBarProduct.dart';
import 'package:serpay/MainPage/Product/FotterProduct/FutterProduct.dart';
import 'package:serpay/MainPage/Product/ProductRealted/ProductRelated.dart';
import 'package:serpay/MainPage/Product/ProtuctText/ProductText.dart';
import 'package:serpay/Model/Colors.dart';
import 'package:http/http.dart' as http;

import '../../Language/Language.dart';
import '../../Servers/OneProduct.dart';
import '../../language.dart';
import 'ProductDetails/ProductDetails.dart';

class ProductDetails extends StatefulWidget {
  String productId;
  List? image;

  ProductDetails({required this.productId, this.image});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int currentPos = 0;
  Colrs select = Colrs();
  Future<ProductModel>? veri;
  ProductModel? productModel;
  String checkLike = "";
  String? token;
  CheckSignUp checkSignUp = new CheckSignUp();
  String ip = IpAddress().ipAddress;
  String url = "";

  language() async {
    await LanguageFileRead().then((value) {
      url = value.toString();
    });
  }

  @override
  void initState() {
    language();
    languageModel = Language().fetchAlbum(context);
    // TODO: implement initState
    veri = fetchAlbum(widget.productId) as Future<ProductModel>?;

    super.initState();
  }

  late Future<LanguageModel> languageModel;

  @override
  Widget build(BuildContext context) {
    debugPrint("fsdfsd");

    return SafeArea(
        child: Scaffold(
            body: FutureBuilder(
                future: languageModel,
                builder: (BuildContext context,
                    AsyncSnapshot<LanguageModel> lan) {
                  // debugPrint(snapshot.data.profile.toString());
                  if (lan.hasData) {
                    return FutureBuilder(
                        future: veri,
                        builder:
                            (context, AsyncSnapshot<ProductModel> snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.89,
                                  child: CustomScrollView(
                                    slivers: [
                                      AppBarProct(
                                        oneProduct:
                                            snapshot.data!.product.oneProduct,
                                      ),
                                      ProductText(
                                        oneProductElement:
                                            snapshot.data!.product.oneProduct, url: url, lan: lan.data!,
                                      ),
                                      ProductDetailsPhoto(
                                        imageDetal: snapshot
                                            .data!.product.oneProduct.details!,
                                      ),
                                      ProductText(
                                              oneProductElement: snapshot
                                                  .data!.product.oneProduct, url: url, lan: lan.data!,)
                                          .realated(context),
                                      SliverGrid(
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                                            crossAxisCount: 2,
                                            height: 220.0,
                                          ),
                                          delegate: SliverChildBuilderDelegate(
                                              (BuildContext context,
                                                  int index) {
                                                debugPrint(snapshot.data!
                                                    .product.recommenendations.toString());
                                            return ProductRelated(
                                              index: index,
                                              recommenendations: snapshot.data!
                                                  .product.recommenendations, url: url,
                                            );
                                          },
                                              childCount: snapshot
                                                  .data!
                                                  .product!
                                                  .recommenendations
                                                  .length)),
                                    ],
                                  ),
                                ),
                                ProductFotter(
                                  oneProductElement:
                                      snapshot.data!.product!.oneProduct,
                                  onpress: setSt,
                                  like: snapshot
                                      .data!.product.oneProduct.isLiked, lan: lan.data!, url: url,
                                ),
                              ],
                            );
                          } else {
                            debugPrint(snapshot.toString());
                            return Center(
                                child: CircularProgressIndicator(
                              color: Colors.red,
                            ));
                          }
                        });
                  } else {
                    return Center(child: CircularProgressIndicator(color: Colors.red,));
                  }
                })));
  }

  setSt() {
    setState(() {});
  }
}
