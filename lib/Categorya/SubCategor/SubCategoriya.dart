import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:serpay/Categorya/Categoriya/CategoriyaModel.dart';
import 'package:serpay/Language/Language.dart';

import '../../IpAdress.dart';
import '../../Model/TextColor.dart';
import '../../darkMode/theme_services.dart';
import '../Categoriya/Categoriya.dart';
import '../Model/CategpriyaModel.dart';
import 'SubCategorProduct.dart';

class Subcategoriya extends StatefulWidget {
  List<Subcategory> subCate;
CategoriyaModel cate;
LanguageModel lan;
String url;
  Subcategoriya({required this.subCate,required this.cate,required this.url,required this.lan});

  @override
  _SubcategoriyaState createState() => _SubcategoriyaState();
}

class _SubcategoriyaState extends State<Subcategoriya> {

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight -25) / 3;
    final double itemWidth = size.width / 2;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        InkWell(
        onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CateProduct(
                sort: "0",
                subcatId:
                widget.cate.categoryId,
                checkpage: false,
                nameSubCat:
              widget.url=="ru"?widget.cate.nameRu:  widget.cate.nameTm,
                page: 0, url:widget.url,lan: widget.lan,
              )));},
          child: Padding(
            padding: const EdgeInsets.only(top: 5,bottom: 10,left: 16),
            child: Row(
              children: [
                Text(
                  widget.lan.all,
                  style: TextStyle(fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: ThemeServices().theme == ThemeMode.dark
                          ? select.scaf
                          : select.cateproCol),
                ),
                Icon(Icons.arrow_forward_ios, color: ThemeServices().theme == ThemeMode.dark
                    ? select.scaf
                    : select.cateproCol,size: 15,)
              ],
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height*0.73,
          width: MediaQuery.of(context).size.width - 110,

          child: GridView.extent(
            maxCrossAxisExtent: 100,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.88,
            children: List.generate(
              widget.subCate.length ,
              (index) {
                return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SubCategorProduct(
                                        sort: "0",
                                        subcatId:
                                            widget.subCate[index ].subcategoryId,
                                        checkpage: false,
                                        nameSubCat:
                                           widget.url=="ru"?widget.subCate[index ].nameRu: widget.subCate[index ].nameTm,
                                        page: 0, url: widget.url, lan: widget.lan,
                                      )));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 5,right: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              widget.subCate[index].image!=null? ClipRRect(
                               borderRadius: BorderRadius.circular(10), child: CachedNetworkImage(
                                  imageUrl: "${IpAddress().ipAddress}/" +
                                      widget.subCate[index ].image!,
                                  width: 60,
                                  height: 60,
                                  placeholder: (context, url) => Container(
                                      alignment: Alignment.center,
                                      child: Container()),
                                  errorWidget: (context, url, error) =>
                                      Image.asset("asset/Img/banner-img.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ):Image.asset("assets/Setting/banner-img.jpg"),
                              Padding(
                                padding: const EdgeInsets.only(top: 5,bottom: 10),
                                child: Text(
                                 widget.url=="ru"?widget.subCate[index ].nameRu: widget.subCate[index ].nameTm,
                                  maxLines: 2,

                                  style: CustomTextStyle.cateprostyle(context),
                                  textAlign: TextAlign.center,
                                ),
                              )
                            ],
                          ),
                        ),
                      );

              },
            ),
          ),
        ),
      ],
    );
  }
}
