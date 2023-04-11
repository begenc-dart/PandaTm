import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../IpAdress.dart';
import '../../Model/TextColor.dart';
import '../Model/OneFreeProduct.dart';
class ProductAppBar extends StatelessWidget {
  List<OneFreeProductImage> image;
  ProductAppBar({required this.image});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300.0,
      leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.only(left: 10, top: 15),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
                color: Colors.white70, borderRadius: BorderRadius.circular(5)),
            child: Icon(
              Icons.arrow_back,
              color: select.recColor,
            ),
          )),
      flexibleSpace: FlexibleSpaceBar(
        background: CarouselSlider.builder(
          itemCount:image.length,
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
                        image[itemIndex].image,
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
                          fit: BoxFit.contain,
                        ),
                    fit: BoxFit.fill,
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
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 10),
            autoPlayAnimationDuration:
            Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }
}
