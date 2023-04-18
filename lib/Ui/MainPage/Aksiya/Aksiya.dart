import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:serpay/darkMode/theme_services.dart';

import '../../../../IpAdress.dart';
import '../../../../Model/TextColor.dart';

import '../../../MainPage/Model/Action.dart';
import '../../../HttpModel/AksiyaProduct.dart';
import '../../../MainPage/Model/mainModel.dart';
import '../../../MainPage/Product/Product.dart';
import '../../../language.dart';
import '../SkidkaProduct/ActionProduct/Action.dart';
import '../SkidkaProduct/NewProduct/NewProduct.dart';

class Aksiya extends StatefulWidget {
  String namepro;

  String img;

  Aksiya({Key? key, required this.img, required this.namepro})
      : super(key: key);

  @override
  State<Aksiya> createState() => _AksiyaState();
}

class _AksiyaState extends State<Aksiya> {

  List? action;
  Future<ActionModel>? take;

  @override
  void initState() {
    // TODO: implement initState
    take = AksiyaProdutModel().fetchAlbum();
    language();
    super.initState();
  }
  String url="";
  language()async{

    await LanguageFileRead().then((value) {
      url = value;
    });
  }
//ThemeServices().theme==ThemeMode.dark?Colors.red:Colors.green,
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: take,
        builder: ((context, AsyncSnapshot<ActionModel> snapshot) {
          debugPrint(snapshot.toString());
          if (snapshot.hasData) {
            return Container(
              width: MediaQuery.of(context).size.width,
              height: 80,
              margin: EdgeInsets.only(left: 15, right: 15, top: 5),
              padding: EdgeInsets.only(left: 10,right: 10),
              decoration: BoxDecoration(

                  gradient: LinearGradient(colors: [
                    Color.fromRGBO(255, 255, 255, 0.35),
                    Color.fromRGBO(255, 20, 29, 0.15),

                  ],),

                  // color: ThemeServices().theme == ThemeMode.dark
                  //     ? Color.fromRGBO(55, 55, 55, 1)
                  //     : Color.fromRGBO(255, 20, 29, 0.15),
                  border:
                      Border.all(color: Colors.red,width: 0.5),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                 snapshot.data!.actionProducts.rows.length,
                  (int index) {
                    return index !=0
                        ? InkWell(
                      onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                ProductDetails(
                                  productId: snapshot.data!.actionProducts.rows[index-1].productId, image:snapshot.data!.actionProducts.rows[index-1].images ,
                                )));
                      },
                          child: Container(
                              width: 70,
                              height: 80,

                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 7),
                                    child: snapshot.data!.actionProducts.rows[index-1]
                                                .images.length ==
                                            0
                                        ? Image.asset(widget.img)
                                        : ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                          child: CachedNetworkImage(
                                              height: 50,
                                              imageUrl:
                                                  "${IpAddress().ipAddress}/" +
                                                      snapshot
                                                          .data!
                                                          .actionProducts.rows[index-1]
                                                          .images[0]
                                                          .image,
                                              placeholder: (context, url) =>
                                                  Container(
                                                     ),
                                              errorWidget: (context, url, error) =>
                                                  Image.asset(
                                                      "asset/Img/banner-img.jpg"),
                                              fit: BoxFit.fill,
                                            ),
                                        ),
                                  ),
                                  Text(
                                    url=="ru"?snapshot.data!.actionProducts.rows[index-1].nameRu:snapshot.data!.actionProducts.rows[index-1].nameTm,
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    style: CustomTextStyle.Skidkapro(context),
                                  )
                                ],
                              ),
                            ),
                        )
                        : GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ActionProduct(
                                  sort: "2",
                                  page: 0,
                                  checkpage: false,
                                )));
                      },
                          child: Container(
                            width: 70,
                            height: 75,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              // border: Border.all(
                              //     color: select.mainColo, width: 0.5),
                              gradient: LinearGradient(
                                  colors: [
                                    Color.fromRGBO(255, 211, 213, 1),
                                    Color.fromRGBO(255, 246, 222, 1)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 7),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.asset(widget.img,height: 50,
                                        ),
                                  ),
                                ),
                                Text(
                                   widget.namepro,
                                  style: CustomTextStyle.newSty(context),
                                )
                              ],
                            ),
                          ),
                        );
                  },
                ),
              ),
            );
          } else {
            return Container();
          }
        }));
  }
}

class NewProduct extends StatefulWidget {
  String namepro;

  String img;

  NewProduct({Key? key, required this.img, required this.namepro})
      : super(key: key);

  @override
  State<NewProduct> createState() => _NewProductState();
}

class _NewProductState extends State<NewProduct> {

  List? action;
  Future<NewAndProduct>? take;
String url="";
  @override
  void initState() {
   language();
    // TODO: implement initState
    take = NewProductsModel().fetchAlbum();
    super.initState();
  }
  language()async{

    await LanguageFileRead().then((value) {
      url=value.toString();
    });

  }
//ThemeServices().theme==ThemeMode.dark?Colors.red:Colors.green,
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 80,
      padding: EdgeInsets.only(left: 10,right: 10),
      margin: EdgeInsets.only(left: 15, right: 15, top: 5),
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(255, 255, 255, 0.35),
            Color.fromRGBO(255, 20, 29, 0.15),

          ],),

          // color: ThemeServices().theme == ThemeMode.dark
          //     ? Color.fromRGBO(55, 55, 55, 1)
          //     : Color.fromRGBO(255, 20, 29, 0.15),
          border:
          Border.all(color: Colors.red, width: 0.5),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:[GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NewProductModel(
                          sort: "2",
                          page: 0,
                          checkpage: false,
                        )));
              },
              child: Container(
                width: 70,
                height: 75,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  // border: Border.all(
                  //     color: select.mainColo, width: 0.5),
                  gradient: LinearGradient(
                      colors: [
                        Color.fromRGBO(255, 211, 213, 1),
                        Color.fromRGBO(255, 246, 222, 1)
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset(widget.img,
                          height: 50,
                        ),
                      ),
                    ),
                    Text(
                      widget.namepro,
                      style: CustomTextStyle.newSty(context),
                    )
                  ],
                ),
              ),

        ),
    FutureBuilder(
    future: take,
    builder: ((context, AsyncSnapshot<NewAndProduct> snapshot) {
    debugPrint(snapshot.toString());
    if (snapshot.hasData) {

    return    Row(
    children: List.generate(snapshot.data!.newProducts.length, (index) =>InkWell(
    onTap: (){
    Navigator.of(context).push(MaterialPageRoute(
    builder: (context) =>
    ProductDetails(
    productId: snapshot.data!.newProducts[index-1].productId, image: snapshot.data!.newProducts[index-1].images,
    )));
    },
    child: Container(
    width: 70,
    height: 80,
    child: Column(
    children: [
    Padding(
    padding: const EdgeInsets.only(top: 7),
    child: snapshot.data!.newProducts[index-1]
        .images.length ==
    0
    ? Image.asset(widget.img)
        : ClipRRect(
    borderRadius: BorderRadius.circular(5),
    child: CachedNetworkImage(
    height: 50,
    imageUrl:
    "${IpAddress().ipAddress}/" +
    snapshot
        .data!.
    newProducts[index-1]
        .images[0]
        .image,
    placeholder: (context, url) =>
    Container(
    ),
    errorWidget: (context, url, error) =>
    Image.asset(
    "asset/Img/banner-img.jpg"),
    fit: BoxFit.fill,
    ),
    ),
    ),
    Text(
    url=="ru"?snapshot.data!.newProducts[index-1].nameRu:snapshot.data!.newProducts[index-1].nameTm,
    maxLines: 1,
    textAlign: TextAlign.center,
    style: CustomTextStyle.Skidkapro(context),
    )
    ],
    ),
    ),
    )
    ));
    } else {
    return Container();
    }
    }))

    ]));



  }
}
