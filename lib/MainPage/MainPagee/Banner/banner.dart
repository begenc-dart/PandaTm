
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:serpay/Categorya/Categoriya.dart';
import 'package:serpay/Categorya/Categoriya/Categoriya.dart';

import 'package:serpay/HttpModel/CaruselGet.dart';
import 'package:serpay/IpAdress.dart';
import 'package:serpay/Model/Language.dart';
import 'package:serpay/Servers/FreeProduct.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Categorya/SubCategor/SubCategorProduct.dart';
import '../../../Model/TextColor.dart';
import '../../MainChangeNoti.dart';
import '../../../Model/BannerProductModel.dart';
import 'package:http/http.dart' as http;
// import 'dart:js' as js;
class BannerMainPage extends StatefulWidget {
  String url;
  LanguageModel lan;
  BannerMainPage({required this.lan,required this.url});
  @override
  State<BannerMainPage> createState() => _BannerMainPageState();
}

class _BannerMainPageState extends State<BannerMainPage> {
  late Future<BannerProdcut> banner;
  late BannerProdcut bannerProductModel;



  @override
  void initState() {
    banner = CaruselGet().fetchAlbum();
    // TODO: implement initState
    super.initState();
  }
int a=0;
  Future<void> launchLink(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
List link=[];
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: banner,
        builder: (context, AsyncSnapshot<BannerProdcut> snapshot) {
          if (snapshot.hasData) {

            return Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CarouselSlider.builder(
                    itemCount:snapshot.data!.banners.rows.length,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) {
                      link=snapshot.data!.banners.rows[itemIndex].link!.split("/");
                    return    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),),
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: (snapshot.data!.banners.rows[itemIndex].image != null)
                                ? InkWell(
                                    onTap: () {
                                      

                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                              link[3]=="category"? SubCategorProduct(sort: "0",
                                                subcatId:
                                                link[4],
                                                checkpage: false,
                                                nameSubCat:
                                                "",
                                                page: 0, url:widget.url,lan: widget.lan,):link[4]=="share"?FreeProductPerson(ipAddress: link[5], url:widget.url,lan: widget.lan,):Container()));
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                        imageUrl: "${IpAddress().ipAddress}/"+snapshot.data!.banners.rows[itemIndex].image!,

                                        placeholder: (context, url) => Container(
                                            alignment: Alignment.center,
                                            child: Container()),
                                        errorWidget: (context, url, error) =>
                                            Image.asset(
                                                "asset/Img/banner-img.jpg"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  )
                                : Image.asset("asset/Img/banner-img.jpg"));},
                    options: CarouselOptions(
                      viewportFraction: 1,
                      height: 200,
                      aspectRatio: 16 / 9,

                      onPageChanged: (index, reason) {

                       a=index;
                       setState(() {

                       });
                        // setState(() {
                        //   currentPos = index;
                        // });
                      },
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
                // Positioned(top: 0,child: Text(snapshot.data!.banners.rows[0].link!.split("/").toString(),)),
                Positioned(
                  bottom: 5,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: snapshot.data!.banners.rows.map((url) {
                      int index = snapshot.data!.banners.rows.indexOf(url);
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 3.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: a == index
                              ? select.mainColo
                              : select.bannerOffColor,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            );
          } else {
            debugPrint(snapshot.toString());
            return Container(
              height: 200,

            );
          }
        });
  }
}
