import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photo_view/photo_view.dart';
// import 'package:sebet/IpAddress.dart';
import 'package:serpay/IpAdress.dart';
class PhotoDetails extends StatefulWidget {
  String photo;
  String name;
  PhotoDetails({required this.photo,required this.name});


  @override
  State<PhotoDetails> createState() => _PhotoDetailsState();
}

class _PhotoDetailsState extends State<PhotoDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white60),
        title: Text(widget.name,style: TextStyle(color: Colors.white60),) ,
      ),
      body: SafeArea(
        child: Container(

          child: Column(
            children: [

              Expanded(
                child: Container(alignment: Alignment.center,
                    height: double.infinity,
                    width: MediaQuery.of(context).size.width,

                    // padding: EdgeInsets.only(left: 5, right: 5),
                    child: (widget.photo.length != 0)
                        ?PhotoView(imageProvider: CachedNetworkImageProvider("${IpAddress().ipAddress}/${widget.photo}",)):Container()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
