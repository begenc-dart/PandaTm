import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:serpay/IpAdress.dart';
import 'package:serpay/Model/Product.dart';
import 'package:serpay/Model/TextColor.dart';

import '../../../photo/photoDetails.dart';



class ProductDetailsPhoto extends StatelessWidget {
  List<Detail> imageDetal;
  ProductDetailsPhoto({required this.imageDetal});

  @override
  Widget build(BuildContext context) {
    return SliverList(
        delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
      return InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>PhotoDetails(photo: imageDetal[index].image, name: '',)));
        },
        child: CachedNetworkImage(
          imageUrl: "${IpAddress().ipAddress}/" + imageDetal[index].image,
          placeholder: (context, url) => Container(
              alignment: Alignment.center,
              child: Container()),
          errorWidget: (context, url, error) =>
              Image.asset("asset/Img/banner-img.jpg"),
          fit: BoxFit.fill,
        ),
      );
    }, childCount: imageDetal.length));
  }
}
