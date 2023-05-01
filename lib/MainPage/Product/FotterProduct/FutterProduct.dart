import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:serpay/MainPage/Model/Product.dart';
import 'package:serpay/MainPage/Product/Model/AddCart.dart';
import 'package:serpay/MainPage/Product/ProductChangeNotifier.dart';
import 'package:serpay/MainPage/Product/SnackBarMessage/SnackbarMessage.dart';
import 'package:serpay/Profile/ContactUs/Contact.dart';
import 'package:serpay/Profile/Profile/Like.dart';
import 'package:serpay/Profile/Profile/MessageCenter.dart';
import 'package:serpay/darkMode/theme_services.dart';

import '../../../HttpModel/BannerGet.dart';
import '../../../Language/Language.dart';
import '../../../Liked/liked.dart';
import '../../../LogIn/LogIn/LogIn.dart';
import '../../../Model/TextColor.dart';
import '../../../Profile/GetMe/PostGetMe.dart';
import '../../../Ui/MainPage/SkidkaProduct/BrendProduct/BannerProduct.dart';
import '../../../Ui/MainPage/SkidkaProduct/OwnProduct/OwnProduct.dart';
import '../Model/Is_Order.dart';
import '../Product.dart';
import 'Sized.dart';

class ProductFotter extends StatefulWidget {
  OneProduct oneProductElement;
  Function onpress;
  bool like;
String url;
  LanguageModel lan;
  ProductFotter({required this.oneProductElement, required this.onpress,required this.like,required this.lan,required this.url});

  @override
  State<ProductFotter> createState() => _ProductFotterState();
}

class _ProductFotterState extends State<ProductFotter> {
  String checkLike="";
  void initState() {
    // TODO: implement initState
fToast=FToast();
    checkSignUp.dosyaOku().then((value) {
      checkLike = value;
    });
    super.initState();
  }

  LikedProducts postLiked = new LikedProducts();
  @override
  Widget build(BuildContext context) {
    debugPrint( widget.oneProductElement.seller.toString());
    return Container(
      width: double.infinity,
      height: 60,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: ThemeServices().theme == ThemeMode.dark
              ? const Color.fromRGBO(55, 55, 55, 1)
              : const Color.fromRGBO(246, 246, 246, 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            flex: 1,
            child: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: InkWell(
                  onTap: () {
                    widget.oneProductElement.seller!=null? Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BannerProduct(
                                  sort: "2",
                                  page: 0,
                                  checkpage: false,
                                  brend: widget.oneProductElement.seller!.sellerId,
                                  nameBrenad:
                                      widget.oneProductElement.seller!.nameTm, lan: widget.lan,url: widget.url,
                                ))):Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OwnProduct(
                              sort: "2",
                              page: 0,
                              checkpage: false,
                              brend: "",
                              nameBrenad:
                             "",
                            )));
                  },
                  child: productFotter(
                      "asset/productIcon/home-icon.svg", widget.oneProductElement.seller!=null?widget.oneProductElement.seller!.nameTm.toString():"Serpay", context),
                )),
          ),
          Flexible(
            flex: 1,
            child: InkWell(
              onTap: () {
                setState(() {
                  // debugPrint(checkLike+"mmmmmmmmmmmmmmmmmmmmmmmmm");

                  if (checkLike
                      .toString()
                      .length == 4) {
                    debugPrint("checkLike = ${checkLike}");
                    widget.like == true ? widget.like = false : widget.like = true;
                    if (widget.like == true) {
                      debugPrint("like = ${widget.like}");
                      // debugPrint(widget.randomPro[index].productId!);
                      postLiked.postLikedProduct(widget.oneProductElement.productId);
                    } else {
                      postLiked.deleteAlbum(widget.oneProductElement.productId);
                    }
                  } else {
                    debugPrint("like basyldy" +
                        widget.like.toString() +
                        "\n ${checkLike}barla");
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => LogIn()));
                  }
                });
              },
              child: productFotter(
                 widget.like==false? "asset/productIcon/Like.svg":"asset/icon/Like_on.svg", widget.lan.gosmaca.haladym, context),

            ),
          ),
          Flexible(
            flex: 1,
            child: InkWell(
              onTap: () async{
                if(checkLike
                    .toString()
                    .length == 4){
                await  PostGetMe().fetchAlbum().then((value) {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => MessagesNot(userid: value.userId!, nickname: value.nickname!, languageModel: widget.lan,url: widget.url,link: 'http://panda.com.tm/product/${widget.oneProductElement.productId}', )));
                  });
                }
                else{

                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => LogIn()));
                }

              },
              child: productFotter(
                  "asset/productIcon/chat.svg", widget.lan.admin, context),
            ),
          ),
          GestureDetector(
            onTap: () {
              if(checkLike
                  .toString()
                  .length == 4){

                Sized( ).addcard(context, widget.oneProductElement,widget.lan,widget.url);
              }
              else{

                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => LogIn()));
              }

            },
            child: Container(
              width: 175,
              // height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(color: select.mainColo, boxShadow: [
                BoxShadow(color: select.shadowCol, blurRadius: 6)
              ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.oneProductElement.price!=null?  Text(
                    "${widget.oneProductElement.price.toStringAsFixed(1)} TMT",
                    style: CustomTextStyle.productfotterPrice(context),
                  ): Text(
                    "0 TMT",
                    style: CustomTextStyle.productfotterPrice(context),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      widget.lan.sebetAdd,
                      style: CustomTextStyle.productfotterBasket(context),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }


   FToast fToast =FToast();

  setSt() {
    setState(() {
      widget.onpress();
    });
  }

  productFotter(String imgurl, String con, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            imgurl,
            color: Colors.red,
            width: 20,height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              con,
              style: CustomTextStyle.proother(context),
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
