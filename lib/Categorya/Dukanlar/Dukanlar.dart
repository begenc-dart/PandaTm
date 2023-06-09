import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:serpay/Model/Language.dart';
import 'package:serpay/Model/SelersModel.dart';

import '../../IpAdress.dart';
import '../../Ui/MainPage/SkidkaProduct/BrendProduct/BannerProduct.dart';
import '../../darkMode/theme_services.dart';


class Dukanlar extends StatefulWidget {
  LanguageModel lan;
  String url;

  Dukanlar({required this.lan, required this.url});

  @override
  State<Dukanlar> createState() => _DukanlarState();
}

class _DukanlarState extends State<Dukanlar> {
  int current_page = 0;
  String ip = IpAddress().ipAddress;
  SellersModel? _seller;
  List<Seller> prod = [];
  final RefreshController refreshController =
      RefreshController(initialRefresh: true);

  Future<bool> fetchAlbum({bool isrefest = false}) async {
    if (isrefest) {
      current_page = 0;
    }

    final response = await http.get(
      Uri.parse("$ip/public/seller?limit=1000000&offset=$current_page"),
      headers: {},
    );
    debugPrint(response.statusCode.toString());
    debugPrint(response.body.toString() + 'dfsdf');

    if (response.statusCode == 200) {
      _seller = sellersModelFromJson(response.body);

      if (isrefest) {
        prod = _seller!.sellers;
      } else {
        prod.addAll(_seller!.sellers);
      }

      current_page = current_page + 10000000000;

      setState(() {});
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return SmartRefresher(
      controller: refreshController,
      footer: const ClassicFooter(loadStyle: LoadStyle.HideAlways),
      enablePullUp: true,
      onRefresh: () async {
        final result = await fetchAlbum(isrefest: true);
        if (result) {
          refreshController.refreshCompleted();
        } else {
          refreshController.refreshFailed();
        }
      },
      onLoading: () async {
        final result = await fetchAlbum();
        if (result) {
          refreshController.loadComplete();
        } else {
          refreshController.loadFailed();
        }
      },
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 150, childAspectRatio: size.height/size.width*0.41),
        itemBuilder: (BuildContext context, int index) {
          debugPrint(prod.toString());
          return InkWell(
            onTap: () {
              debugPrint(prod[index].sellerId.toString());
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BannerProduct(
                            sort: "2",
                            page: 0,
                            checkpage: false,
                            brend: prod[index].sellerId!,
                            nameBrenad: prod[index].nameTm!,
                            lan: widget.lan,
                            url: widget.url,
                          )));
            },
            child: Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromRGBO(174, 174, 174, 1), width: 0.5),
                  borderRadius: BorderRadius.circular(8)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  prod[index].image != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: CachedNetworkImage(
                              width: double.infinity,
                              height: 100,
                              fit: BoxFit.fill,
                              imageUrl: "$ip/" + prod[index].image!),
                        )
                      : Image.asset(
                    ThemeServices().theme == ThemeMode.dark
                        ?"asset/bann/2121px.png": "asset/Setting/No_Image_Available.png",
                          width: double.infinity,
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                  Padding(
                    padding: const EdgeInsets.only(top: 4, bottom: 4),
                    child: Text(
                      widget.url == "ru"
                          ? prod[index].nameRu.toString()
                          : prod[index].nameTm.toString(),
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: ThemeServices().theme == ThemeMode.dark
                              ? Colors.white
                              : Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: prod.length,
      ),
    );
  }
}
