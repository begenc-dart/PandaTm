import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:serpay/IpAdress.dart';
import 'package:serpay/Model/Colors.dart';
import 'package:serpay/Model/TextColor.dart';
import 'package:serpay/Profile/GetMe/ModelGetMe.dart';
import 'package:serpay/Profile/MyAddress/AddressModel/AddressGet.dart';
import 'package:serpay/Profile/MyAddress/AddressModel/AddressGetHttp.dart';
import 'package:serpay/Sebet/NotOrderedProduct/AddOrder.dart';
import 'package:serpay/darkMode/theme_services.dart';
import 'package:serpay/main.dart';

import '../Language/Language.dart';
import '../MainPage/MainChangeNoti.dart';
import '../MainPage/PhotoIndex.dart';
import '../Profile/GetMe/PostGetMe.dart';
import '../Providers.dart';
import 'NotOrderedProduct/NotOrderProduct.dart';
import 'NotOrderedProduct/NotOrderedProductModel.dart';
import 'Order/OrderProduct.dart';

class OrderPro extends ConsumerStatefulWidget {
  int index;
  int proindex;
  String sellerID;
  String url;
  LanguageModel lan;

  OrderPro(
      {required this.index,
      required this.proindex,
      required this.sellerID,
      required this.url,
      required this.lan});

  @override
  ConsumerState<OrderPro> createState() {
    return _OrderProState();
  }
}

class _OrderProState extends ConsumerState<OrderPro> {
  String address = "";

  Colrs select = Colrs();

  late Future<NotOrderedProduct> _notOrderedProduct;

  @override
  void initState() {
    // TODO: implement initState
    addresMethod();
    _notOrderedProduct = NoteOrderProductHttp()
        .fetchAlbum(isrefest: true, sellerid: widget.sellerID);

    super.initState();
  }

  addresMethod() async {
    await AddressGetHttp()
        .addresGet()
        .then((value) => address = value.address![0].address);
  }

  String userName = "";
  String phone = "";
  late String name, note;
  bool checkAdress = false;
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // final productIndex = Provider.of<ProductIndex>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ThemeServices().theme == ThemeMode.dark
            ? const Color.fromRGBO(39, 39, 39, 1)
            : const Color.fromRGBO(250, 250, 250, 1),
        title: Text(
          widget.lan.sargyt,
          style: CustomTextStyle.carAppBar(context),
        ),
      ),
      body: FutureBuilder(
        future: _notOrderedProduct,
        builder:
            (BuildContext context, AsyncSnapshot<NotOrderedProduct> snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 136,
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, top: 15, bottom: 14),
                        child: FutureBuilder(
                          future: PostGetMe().fetchAlbum(),
                          builder: (BuildContext context,
                              AsyncSnapshot<ModelGetMe> userInfo) {
                            if (userInfo.hasData) {
                              phone = userInfo.data!.userPhone!;
                              name = userInfo.data!.username!;
                              return InkWell(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    Text(
                                      widget.lan.info.toString(),
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Color.fromRGBO(174, 174, 174, 1)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 12, right: 12),
                                      child: Text(
                                        userInfo.data!.username.toString(),
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: ThemeServices().theme ==
                                                    ThemeMode.dark
                                                ? const Color.fromRGBO(
                                                    250, 250, 250, 1)
                                                : const Color.fromRGBO(
                                                    97, 97, 97, 1)),
                                      ),
                                    ),
                                    Text(
                                      userInfo.data!.userPhone.toString(),
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Color.fromRGBO(174, 174, 174, 1)),
                                    )
                                  ],
                                ),
                              );
                            } else {
                              return const Center(
                                  child: CircularProgressIndicator());
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 15),
                        child: Text(
                          widget.lan.address,
                          style: CustomTextStyle.drowDown(context),
                        ),
                      ),
                      checkAdress == false
                          ? address != null
                          ? FutureBuilder(
                        future: AddressGetHttp().addresGet(),
                        builder: (BuildContext context,
                            AsyncSnapshot<AddressGet> addresssnap) {
                          if (snapshot.hasData) {
                            if (addresssnap.data != null) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: ThemeServices().theme ==
                                      ThemeMode.dark
                                      ? const Color.fromRGBO(
                                      55, 55, 55, 1)
                                      : select.dorpDown,
                                  // borderRadius: BorderRadius.circular(5)
                                ),
                                margin: const EdgeInsets.all(15),
                                padding: const EdgeInsets.all(5),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    alignment: Alignment.centerLeft,
                                    focusColor:
                                    ThemeServices().theme ==
                                        ThemeMode.dark
                                        ? const Color.fromRGBO(
                                        55, 55, 55, 1)
                                        : Colors.white,
                                    value: address,
                                    //elevation: 5,
                                    isExpanded: true,

                                    dropdownColor:
                                    ThemeServices().theme ==
                                        ThemeMode.dark
                                        ? const Color.fromRGBO(
                                        55, 55, 55, 1)
                                        : Colors.white,
                                    style: TextStyle(
                                        color: select.dorpDown),
                                    iconEnabledColor:
                                    const Color.fromRGBO(
                                        97, 97, 97, 1),
                                    items: List.generate(
                                      addresssnap
                                          .data!.address!.length ,
                                          (index) => addresssnap.data!
                                          .address![index].address,
                                    ).map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(
                                              value,
                                              overflow:
                                              TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: ThemeServices()
                                                      .theme ==
                                                      ThemeMode.dark
                                                      ? const Color
                                                      .fromRGBO(
                                                      250,
                                                      250,
                                                      250,
                                                      1)
                                                      : select.recColor,
                                                  fontSize: 14,
                                                  fontWeight:
                                                  FontWeight.w400),
                                            ),
                                          );
                                        }).toList(),
                                    hint: const Text(
                                      "Adress gos",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight:
                                          FontWeight.w500),
                                    ),
                                    onChanged: (String? tip) {
                                      setState(() {
                                        address = tip.toString();
                                      });
                                    },
                                  ),
                                ),
                              );
                            } else {
                              return Container();
                            }
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        },
                      )
                          : Container()
                          : Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 15),
                        child: Form(
                          key: _formkey,
                          child: TextFormField(

                            minLines: 1,
                            maxLines: null,
                            style: TextStyle(
                                fontSize: 18,
                                color: ThemeServices().theme ==
                                    ThemeMode.dark
                                    ? Colors.white
                                    : const Color.fromRGBO(55, 55, 55, 1)),
                            textAlign: TextAlign.left,
                            textAlignVertical: TextAlignVertical.center,

                            // cursorColor: Color.fromRGBO(104, 109, 118, 1),
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              fillColor:
                              ThemeServices().theme == ThemeMode.dark
                                  ? const Color.fromRGBO(55, 55, 55, 1)
                                  : Colors.white,

                              // hintStyle: CustomTextStyle.fieldmax(context),
                              errorStyle: CustomTextStyle.error(context),
                              // hintText: "max",
                            ),
                            validator: (jog) {

                                return null;

                            },
                            onSaved: (deger) {
                              address = deger!;
                                  setState(() {

                                  });
                            },
                          ),
                        ),
                      ),
                      CheckboxListTile(
                        value: checkAdress,
                        activeColor: Colors.red,
                        onChanged: (value) {
                          checkAdress = value!;
                          setState(() {});
                        },
                        title: Text(widget.url=="tm"?"Başka salgy":"Другой адрес",
                            style: TextStyle(
                                color: ThemeServices().theme == ThemeMode.dark
                                    ? Colors.white
                                    : Colors.black)),
                      ),

                      Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: ThemeServices().theme == ThemeMode.dark
                                ? const Color.fromRGBO(48, 48, 48, 1)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                            padding: const EdgeInsets.only(top: 7),
                            child: Column(
                              children: List.generate(
                                  snapshot.data!.notOrderedProducts[0].orders
                                      .length,
                                  (index) => Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: const Color.fromRGBO(
                                                  229, 229, 229, 1),
                                              width: 1),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: ThemeServices().theme ==
                                                  ThemeMode.dark
                                              ? const Color.fromRGBO(
                                                  55, 55, 55, 1)
                                              : const Color.fromRGBO(
                                                  243, 243, 243, 1),
                                        ),
                                        child: Stack(children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                  width: 120,
                                                  child: (snapshot
                                                              .data!
                                                              .notOrderedProducts[
                                                                  0]
                                                              .orders[index]
                                                              .image !=
                                                          null)
                                                      ? ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                          child:
                                                              CachedNetworkImage(
                                                            imageUrl: "${IpAddress().ipAddress}/" +
                                                                snapshot
                                                                    .data!
                                                                    .notOrderedProducts[
                                                                        0]
                                                                    .orders[
                                                                        index]
                                                                    .image,
                                                            width: 100,
                                                            height: 100,
                                                            fit: BoxFit.cover,
                                                          ))
                                                      : Image.asset(
                                                          "asset/Img/1.png")),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15,
                                                    right: 10,
                                                    top: 10),
                                                child: SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.5,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                bottom: 10),
                                                        child: Text(
                                                          widget.url == "ru"
                                                              ? snapshot
                                                                  .data!
                                                                  .notOrderedProducts[
                                                                      0]
                                                                  .orders[index]
                                                                  .nameRu
                                                              : snapshot
                                                                  .data!
                                                                  .notOrderedProducts[
                                                                      0]
                                                                  .orders[index]
                                                                  .nameTm,
                                                          maxLines: 1,
                                                          softWrap: false,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                              fontSize: 14,
                                                              fontWeight: FontWeight
                                                                  .w400,
                                                              color: ThemeServices()
                                                                          .theme ==
                                                                      ThemeMode
                                                                          .dark
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
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .width *
                                                            0.5,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      bottom:
                                                                          5),
                                                              child: Row(
                                                                children: [
                                                                  Text(
                                                                    snapshot
                                                                        .data!
                                                                        .notOrderedProducts[
                                                                            0]
                                                                        .orders[
                                                                            index]
                                                                        .price
                                                                        .toString(),
                                                                    style:
                                                                        const TextStyle(
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: Color
                                                                          .fromRGBO(
                                                                              255,
                                                                              20,
                                                                              29,
                                                                              1),
                                                                    ),
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 4,
                                                                  ),
                                                                  const Text(
                                                                    "TMT",
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700,
                                                                      color: Color
                                                                          .fromRGBO(
                                                                              255,
                                                                              20,
                                                                              29,
                                                                              1),
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
                                                                "x${snapshot.data!.notOrderedProducts[0].orders[index].quantity}",
                                                                style: const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        14,
                                                                    color: const Color
                                                                            .fromRGBO(
                                                                        174,
                                                                        174,
                                                                        174,
                                                                        1)),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ]),
                                      )),
                            )),
                      ),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: MediaQuery.of(context).size.width / 2 - 20,
                        height: 50,
                        //alignment: Alignment.center,

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              ref
                                  .watch(PriceState.pricepro)[widget.index]
                                  .toString(), style:TextStyle(color: ThemeServices().theme == ThemeMode.dark
                    ? Colors.white:Colors.black,fontSize: 16,
                    fontWeight: FontWeight.w500,
                    )
                            ),
                            Text(
                              " TMT",
                            style:TextStyle(color: ThemeServices().theme == ThemeMode.dark
              ? Colors.white:Colors.black,fontSize: 12,
              fontWeight: FontWeight.w500,
              ))
                          ],
                        )),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OrderProdut(
                                  name: name.toString(),
                                  phone: phone.toString(),
                                  adress: address,
                                  sellerId: widget.sellerID,
                                  lan: widget.lan,
                                  url: widget.url, index: widget.index,
                                )));


                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2 - 20,
                        height: 50,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: select.mainColo,
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          widget.url=="tm"?"Sargydy taýýarla":"Оформлять заказ",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: select.tmcolo),
                        ),
                      ),
                    ),
                  ],
                )

                ///list
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
  void logInOpen(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();

      setState(() {});
    } else {
      setState(() {});
    }
  }
}
