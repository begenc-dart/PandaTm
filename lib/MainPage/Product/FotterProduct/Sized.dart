import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:serpay/Language/Language.dart';

import 'package:serpay/Model/TextColor.dart';
import 'package:serpay/darkMode/theme_services.dart';

import '../../../IpAdress.dart';
import '../../../Sebet/NotOrderedProduct/NotOrderProduct.dart';
import '../../../Ui/toast.dart';
import '../../MainChangeNoti.dart';
import '../../Model/Product.dart';
import '../Model/AddCart.dart';
import '../Model/Is_Order.dart';
import '../SnackBarMessage/SnackbarMessage.dart';

class Sized {
  int _count = 1;
  int photo = 0;
  String orderProductId = "";

  bool check = false;
  int doneme = 0;
  int sizeCounter = 0;
  String productSize = "";

  addcard(BuildContext context, OneProduct oneProductElement,LanguageModel lan,String url) {
    // final counter = Provider.of<Counter>(context);
    // final productIndex = Provider.of<Price>(context);
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        isScrollControlled: true,
        backgroundColor: ThemeServices().theme == ThemeMode.dark
            ? const Color.fromRGBO(39, 39, 39, 1)
            : const Color.fromRGBO(250, 250, 250, 1),
        context: context,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            check = false;
            return Wrap(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 25, left: 15, bottom: 15),
                      child: Row(
                        children: [
                          Text(
                            oneProductElement.productColors!.length == 0
                                ? oneProductElement.price.toString()
                                : oneProductElement.productColors![doneme]
                                            .productSizes.length ==
                                        0
                                    ? ""
                                    : oneProductElement.productColors![doneme]
                                        .productSizes[sizeCounter].price
                                        .toString(),
                            style: CustomTextStyle.sellproprice(context),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 5),
                            alignment: Alignment.center,
                            width: 30,
                            height: 15,
                            decoration: BoxDecoration(
                                color: ThemeServices().theme == ThemeMode.dark
                                    ? const Color.fromRGBO(97, 97, 97, 1)
                                    : select.tmConCol,
                                borderRadius: BorderRadius.circular(2)),
                            child: Text(
                              "TMT",
                              style: CustomTextStyle.sellpro(context),
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, bottom: 15),
                      child: Text(
                       url=="ru"? oneProductElement.nameRu:oneProductElement.nameTm,
                        style: CustomTextStyle.selldes(context),
                      ),
                    ),
                    oneProductElement.productColors!.length != 0
                        ? SizedBox(
                            height: 90,
                            width: double.infinity,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                debugPrint(oneProductElement
                                    .productColors![index].id
                                    .toString());
                                return Stack(
                                  children: [
                                    InkWell(
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 12.5, right: 12.5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              border: index == doneme
                                                  ? Border.all(
                                                      color: select.mainColo,
                                                      width: 2)
                                                  : Border.all(
                                                      color: select.newCol,
                                                      width: 1)),
                                          child: Stack(
                                            children: [
                                              SizedBox(
                                                width: 80,
                                                height: 80,
                                                child: oneProductElement
                                                        .productColors![index]
                                                        .productImages
                                                        .isNotEmpty
                                                    ? CachedNetworkImage(
                                                        imageUrl: "${IpAddress().ipAddress}/" +
                                                            oneProductElement
                                                                .productColors![
                                                                    index]
                                                                .productImages[
                                                                    0]
                                                                .image
                                                                .toString(),
                                                        placeholder: (context,
                                                                url) =>
                                                            Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color: select
                                                                      .mainColo,
                                                                )),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            Image.asset(
                                                                "asset/Img/banner-img.jpg"),
                                                        fit: BoxFit.cover,
                                                      )
                                                    : Image.asset(
                                                        "asset/Img/banner-img.jpg"),
                                              ),
                                              Positioned(
                                                bottom: 0,
                                                child: Container(
                                                  width: 80,
                                                  alignment: Alignment.center,
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                      color: select.photdes),
                                                  child: Text(
                                                   url=="ru"? oneProductElement
                                                       .productColors![index]
                                                       .colorNameRu
                                                       .toString():oneProductElement
                                                        .productColors![index]
                                                        .colorNameTm
                                                        .toString(),
                                                    style: CustomTextStyle
                                                        .photodesstyle(context),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        setState(() {});
                                        sizeCounter = 0;
                                        doneme = index;
                                      },
                                    ),
                                  ],
                                );
                              },
                              itemCount:
                                  oneProductElement.productColors!.length,
                            ))
                        : Container(),
                    oneProductElement.productColors!.length != 0
                        ? Padding(
                            padding: const EdgeInsets.only(
                                left: 15, bottom: 20, top: 30),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: Text(
                                    "Size:",
                                    style: CustomTextStyle.size(context),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 15),
                                  height: oneProductElement
                                              .productColors![doneme]
                                              .productSizes
                                              .length !=
                                          1
                                      ? 90
                                      : 40,
                                  width: MediaQuery.of(context).size.width - 61,
                                  child: GridView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: oneProductElement
                                          .productColors![doneme]
                                          .productSizes
                                          .length,
                                      gridDelegate: oneProductElement
                                                  .productColors![doneme]
                                                  .productSizes
                                                  .length !=
                                              1
                                          ? const SliverGridDelegateWithFixedCrossAxisCount(
                                              mainAxisSpacing: 10,
                                              childAspectRatio: 15 / 30,
                                              crossAxisSpacing: 15,
                                              crossAxisCount: 2)
                                          : const SliverGridDelegateWithFixedCrossAxisCount(
                                              mainAxisSpacing: 10,
                                              childAspectRatio: 15 / 30,
                                              crossAxisSpacing: 15,
                                              crossAxisCount: 1),
                                      itemBuilder: (context, index) {
                                        productSize = oneProductElement
                                            .productColors![doneme]
                                            .productSizes[index]
                                            .productSizeId;
                                        return InkWell(
                                          onTap: () {
                                            sizeCounter = index;

                                            setState(() {});
                                          },
                                          child: Container(
                                            height: 35,
                                            width: 85,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                border: index == sizeCounter
                                                    ? Border.all(
                                                        color: ThemeServices().theme == ThemeMode.dark
                                                            ? const Color.fromRGBO(
                                                                255, 20, 29, 1)
                                                            : const Color.fromRGBO(
                                                                255, 20, 29, 1))
                                                    : Border.all(
                                                        color: ThemeServices().theme == ThemeMode.dark
                                                            ? const Color.fromRGBO(
                                                                174, 174, 174, 1)
                                                            : const Color.fromRGBO(
                                                                221, 221, 221, 1)),
                                                color: ThemeServices().theme == ThemeMode.dark
                                                    ? const Color.fromRGBO(55, 55, 55, 1)
                                                    : select.tmcolo,
                                                borderRadius: BorderRadius.circular(5)),
                                            child: Text(
                                              oneProductElement
                                                  .productColors![doneme]
                                                  .productSizes![index]
                                                  .size,
                                              style: CustomTextStyle.sizepro(
                                                  context),
                                            ),
                                          ),
                                        );
                                      }),
                                )
                              ],
                            ),
                          )
                        : Container(),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15, left: 15, right: 30, bottom: 30),
                          child: Text(
                            lan.mukdar,
                            style: CustomTextStyle.size(context),
                          ),
                        ),
                        Container(
                            width: 100,
                            margin: const EdgeInsets.only(top: 15, bottom: 30),
                            height: 40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _count != 1
                                    ? InkWell(
                                        child: Container(
                                          width: 25,
                                          height: 25,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: ThemeServices()
                                                              .theme ==
                                                          ThemeMode.dark
                                                      ? const Color.fromRGBO(
                                                          174, 174, 174, 1)
                                                      : select.login,
                                                  width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(3)),
                                          child: Icon(
                                            Icons.remove,
                                            color: ThemeServices().theme ==
                                                    ThemeMode.dark
                                                ? const Color.fromRGBO(
                                                    250, 250, 250, 1)
                                                : select.newCol,
                                            size: 10,
                                          ),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            _count--;
                                          });
                                        },
                                      )
                                    : Container(
                                        width: 25,
                                        height: 25,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: ThemeServices().theme ==
                                                        ThemeMode.dark
                                                    ? const Color.fromRGBO(
                                                        174, 174, 174, 1)
                                                    : select.login,
                                                width: 1),
                                            borderRadius:
                                                BorderRadius.circular(3)),
                                        child: Icon(
                                          Icons.remove,
                                          color: ThemeServices().theme ==
                                                  ThemeMode.dark
                                              ? const Color.fromRGBO(
                                                  250, 250, 250, 1)
                                              : select.newCol,
                                          size: 10,
                                        ),
                                      ),
                                Text(
                                  _count.toString(),
                                  style: TextStyle(
                                      color: ThemeServices().theme ==
                                              ThemeMode.dark
                                          ? const Color.fromRGBO(
                                              250, 250, 250, 1)
                                          : const Color.fromRGBO(
                                              39, 39, 39, 1)),
                                ),
                                InkWell(
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: ThemeServices().theme ==
                                                    ThemeMode.dark
                                                ? const Color.fromRGBO(
                                                    174, 174, 174, 1)
                                                : select.login,
                                            width: 1),
                                        borderRadius: BorderRadius.circular(3)),
                                    child: Icon(
                                      Icons.add,
                                      color: ThemeServices().theme ==
                                              ThemeMode.dark
                                          ? const Color.fromRGBO(
                                              250, 250, 250, 1)
                                          : select.newCol,
                                      size: 10,
                                    ),
                                  ),
                                  onTap: () {
                                    setState(() {
                                      _count++;
                                    });
                                  },
                                )
                              ],
                            )),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(
                          color: select.mainColo,
                          boxShadow: [
                            BoxShadow(color: select.shadowCol, blurRadius: 6)
                          ]),
                      child: InkWell(
                        onTap: () {
                          Is_Order()
                              .fetchAlbum(
                            oneProductElement.productId,
                            productSize,
                          )
                              .then((value) {
                            photo = value.status;

                            AddCart().createUser(
                              context,
                                oneProductElement.productId,
                                productSize,
                                _count.toString(),
                                value.orderProduct==null?false.toString():true.toString(),
                                photo,
                                value.orderProduct==null?null.toString():   value.orderProduct!.orderproductId);


                          });
                          Fluttertoast.showToast(
                              msg: url=="tm"?"Sebede Gosuldy":"Добавлено в корзину",
                              // toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                          Navigator.of(context).pop();

                          // SnackBarMessage().showToastEdit(context, "Sebede Gosuldy");
                        },
                        splashColor:Colors.blue,
                        hoverColor: Colors.blue,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  oneProductElement.productColors!.length == 0
                                      ? (oneProductElement.price!*_count).toString()
                                      : oneProductElement.productColors![doneme]
                                      .productSizes!.length ==
                                      0
                                      ? ""
                                      : (oneProductElement.productColors![doneme]
                                      .productSizes![sizeCounter].price!*_count)
                                      .toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                            color: select.tmcolo),
                                      )
                                    ,
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Text(
                                    "TMT",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: select.tmcolo),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                lan.sebetAdd,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: select.tmcolo),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          });
        });
  }

}
