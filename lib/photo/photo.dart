import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photo_view/photo_view.dart';
// import 'package:sebet/IpAddress.dart';
import 'package:serpay/IpAdress.dart';
class Photo extends StatefulWidget {
  List photo;
  String name;
  Photo({required this.photo,required this.name});


  @override
  State<Photo> createState() => _PhotoState();
}

class _PhotoState extends State<Photo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(widget.name,style: TextStyle(color: Colors.black),) ,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [

              Container(alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height-100,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: (widget.photo.length != 0)
                      ? CarouselSlider.builder(
                    itemCount:
                    widget.photo.length,
                    itemBuilder: (BuildContext context,
                        int itemIndex, int pageViewIndex) {
                      return Container(
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius:
                            BorderRadius.circular(5),
                            child: CachedNetworkImage(
                              imageUrl:
                              "${IpAddress().ipAddress}/" +
                                  widget.photo[itemIndex]
                                      .image,
                              placeholder: (context, url) =>
                                  Container(
                                      alignment:
                                      Alignment.center,
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
                              fit: BoxFit.contain,
                            ),
                          ));
                    },
                    options: CarouselOptions(
                      viewportFraction: 1,
                      aspectRatio: 16 / 9,
                      height: double.infinity,
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
                  ):Container())
            ],
          ),
        ),
      ),
    );
  }
}
