import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serpay/Sebet/Order/OrderProduct.dart';

import 'package:serpay/Sebet/Sebet/CardProduct.dart';

import '../../IpAdress.dart';
import '../../Model/Language.dart';
import '../../MainPage/MainChangeNoti.dart';
import '../../Model/Colors.dart';
import '../../Model/TextColor.dart';
import '../../Services/AddressGetHttp.dart';
import '../../Providers.dart';
import '../../darkMode/theme_services.dart';
import '../../language.dart';
import '../NotOrderedProduct/DeleteCart.dart';
import '../NotOrderedProduct/NotOrderProduct.dart';
import '../NotOrderedProduct/NotOrderedProductModel.dart';
import '../NotOrderedProduct/UpdateProduct.dart';
import '../Order.dart';




class Cart extends ConsumerStatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  ConsumerState<Cart> createState() {
    return _CartState();
  }
}

class _CartState extends ConsumerState<Cart> {
  String address = "";

  Colrs select = Colrs();

  late Future<NotOrderedProduct> _notOrderedProduct;
  List<int> cartProduct = [];
  List<double> cart = [];
  double pricecheck = 0;
  List<List<int>> totalprice = [];
  late Future<LanguageModel> languageModel;
  String url="";
  language()async{

    await LanguageFileRead().then((value) {
      url = value;
    });
  }
  @override
  void initState() {
    language();
    ref.read(CounterState.provider.notifier).add();
    ref.read(PriceState.pricepro.notifier).add();
    languageModel=Language().fetchAlbum(context);
    // TODO: implement initState
    AddressGetHttp()
        .addresGet()
        .then((value) => address = value.address![0].address);
    _notOrderedProduct = NoteOrderProductHttp().fetchAlbum();

    super.initState();
  }

  int a = 0;
  String userName = "";
  String phone = "";
  late String name, note;
  int indexproduct = 0;

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: languageModel,
        builder: (BuildContext context, AsyncSnapshot<LanguageModel> lan) {
      // debugPrint(snapshot.data.profile.toString());
      if(lan.hasData){
        return  Scaffold(
          appBar: AppBar(
            backgroundColor: ThemeServices().theme == ThemeMode.dark
                ? const Color.fromRGBO(39, 39, 39, 1)
                : const Color.fromRGBO(250, 250, 250, 1),
            title: Text(
              url=="tm"?"Sebet":"Корзина",
              style: CustomTextStyle.carAppBar(context),
            ),
          ),
          body: FutureBuilder(
            future: _notOrderedProduct,
            builder:
                (BuildContext context, AsyncSnapshot<NotOrderedProduct> snapshot) {
              debugPrint(snapshot.toString());
              if (snapshot.hasData) {
                return snapshot.data!.notOrderedProducts.length!=0?ListView.builder(
                  itemBuilder: (context, index) => Container(
                      width: double.infinity,
                      // height: 100,
                      padding: const EdgeInsets.all(10),

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: ThemeServices().theme == ThemeMode.dark
                              ?  Colors.black12
                              : Colors.white),
                      child: Column(
                        children: [
                          snapshot.data!.notOrderedProducts[index].seller != null
                              ? Text(
                          url=="ru"?  snapshot.data!.notOrderedProducts[index].seller!
                                .nameRu
                                .toString():snapshot.data!.notOrderedProducts[index].seller!
                              .nameTm
                              .toString(),
                            style: TextStyle(color: ThemeServices().theme == ThemeMode.dark
                    ? Colors.white:Colors.black,fontWeight: FontWeight.w500, fontSize: 15,decoration: TextDecoration.underline),
                          )
                              :  Text(
                            "Serpay",
                            style: TextStyle(color: ThemeServices().theme == ThemeMode.dark
                    ? Colors.white:Colors.black,fontWeight: FontWeight.w500, fontSize: 16)
                          ),
                          // Divider(
                          //   indent: 0,
                          //   endIndent: 0,
                          //   thickness: 1,
                          // ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Column(
                              children: List.generate(
                                  snapshot.data!.notOrderedProducts[index].orders
                                      .length, (proindex) {
                                indexproduct=proindex;
                                return CardProduct(
                                    snapshot.data!.notOrderedProducts[index]
                                        .orders[proindex],
                                    infiniti,
                                    index,
                                    proindex,
                                    snapshot.data!.notOrderedProducts[index].orders,
                                    snapshot.data!.notOrderedProducts,url);
                              }),
                            ),
                          ),
                          Row(
                            children: [
                              Container(
                                height: 30,
                                width: MediaQuery.of(context).size.width / 2 - 10,
                                decoration: BoxDecoration(
                                    color: ThemeServices().theme == ThemeMode.dark
                                        ? const Color.fromRGBO(39, 39, 39, 1)
                                        : select.tmcolo,
                                    border: Border.all(
                                        color: ThemeServices().theme ==
                                            ThemeMode.dark
                                            ? const Color.fromRGBO(97, 97, 97, 1)
                                            : select.bannerOffColor,
                                        width: 1)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      ref.watch(PriceState.pricepro)[index].toString(),
                                      style: CustomTextStyle.pricecard(context),
                                    ),
                                    Text(
                                      "TMT",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                          color: ThemeServices().theme ==
                                              ThemeMode.dark
                                              ? Colors.white
                                              : select.tabColo),
                                      textAlign: TextAlign.end,
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  ref.watch(PriceState.pricepro)[index]>=49?   Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => OrderProdut(
                                            index: index,
                                            url: url,lan: lan.data!, sellerId: snapshot.data!.notOrderedProducts[index].sellerId==null?"null": snapshot.data!.notOrderedProducts[index].sellerId,
                                          ))):"";
                                },
                                child: Container(
                                  height: 30,
                                  width: MediaQuery.of(context).size.width / 2 - 10,
                                  decoration: BoxDecoration(
                                      color:   ref.watch(PriceState.pricepro)[index]>=50?select.mainColo:Colors.black12,
                                      boxShadow: [
                                        BoxShadow(
                                            color: select.shadowCol, blurRadius: 6)
                                      ]),
                                  child: Center(
                                      child: Text(
                                        lan.data!.sarga,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: select.tmcolo),
                                        textAlign: TextAlign.end,
                                      )),
                                ),
                              )
                            ],
                          ),
                        ],
                      )),
                  itemCount: snapshot.data!.notOrderedProducts.length,
                ):Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(ThemeServices().theme != ThemeMode.dark
                          ?"asset/ProfileIcon/2.png":"asset/ProfileIcon/VECTORT.png",fit: BoxFit.fill,width: MediaQuery.of(context).size.width*0.7,),
                      // Padding(
                      //   padding: const EdgeInsets.only(top: 20),
                      //   child: Text("Sebede haryt goşulmady!",style: TextStyle(color: ThemeServices().theme == ThemeMode.dark
                      //       ? Colors.white:Colors.black),),
                      // )
                    ],
                  ),
                );
              }

              else {
                return  Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ));
              }
            },
          ),
        );}
        else{
          return Scaffold(body: Center(child: CircularProgressIndicator()),);
      }
        });








  }

  infiniti() {
    setState(() {});
  }
}
