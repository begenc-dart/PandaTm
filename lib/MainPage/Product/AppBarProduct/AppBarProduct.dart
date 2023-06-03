import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:serpay/IpAdress.dart';
import 'package:serpay/Model/Product.dart';
import 'package:share/share.dart';

import '../../../Model/TextColor.dart';
import '../../../photo/photo.dart';
import '../../PhotoIndex.dart';
import '../../PhotoIndex.dart';

class AppBarProct extends StatefulWidget {

  OneProduct oneProduct;
  AppBarProct({required this.oneProduct});

  @override
  State<AppBarProct> createState() => _AppBarProctState();
}

class _AppBarProctState extends State<AppBarProct> {
  String ip = IpAddress().ipAddress;

int a=0;

  @override
  Widget build(BuildContext context) {

    return SliverAppBar(
      expandedHeight: 300.0,
      leadingWidth: 50,

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
      actions: [
        InkWell(
          onTap: () {
            Share.share('http://panda.com.tm/product/${widget.oneProduct.productId}');
          },
          child: Container(
              margin:
              EdgeInsets.only(right: 10,top: 15),
              padding: EdgeInsets.all(10),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(5)),
              child: Image.asset("asset/icon/Vector.png",fit: BoxFit.cover,width: 30,height: 30,)),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            widget.oneProduct.images.length != 0
                ? InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Photo(
                                    photo: widget.oneProduct.images!,
                                    name: '',
                                  )));
                    },
                    child: CarouselSlider.builder(
                      itemCount: widget.oneProduct.images!.length,
                      itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) {
                        return Container(
                            child: (widget.oneProduct.images![itemIndex] !=
                                    null)
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: CachedNetworkImage(
                                      imageUrl: ip +
                                          "/" +
                                          widget.oneProduct.images!
                                             [itemIndex].image,
                                      placeholder: (context, url) => Container(
                                          alignment: Alignment.center,
                                          child: CircularProgressIndicator(
                                            color: select.mainColo,
                                          )),
                                      errorWidget: (context, url, error) =>
                                          Image.asset(
                                              "asset/Img/banner-img.jpg"),
                                      fit: BoxFit.fill,
                                    ),
                                  )
                                : Image.asset("assets/images/1.jpg"));
                      },
                      options: CarouselOptions(
                        viewportFraction: 1,
                        aspectRatio: 16 / 9,
                        height: double.infinity,
                        onPageChanged: (index, reason) {
                          a=index;
                          setState(() {

                          });
                        },
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: false,
                        autoPlayInterval: Duration(seconds: 10),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  )
                : Image.asset(
                    "asset/Img/banner-img.jpg",
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width,
                  ),
            Positioned(
              bottom: 5,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: widget.oneProduct.images.map((url) {
                  int index = widget.oneProduct.images.indexOf(url);
                  return Container(
                    width: 3.0,
                    height: 3.0,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: a == index
                          ? select.desColor
                          : select.photodotOffCol,
                    ),
                  );
                }).toList(),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
