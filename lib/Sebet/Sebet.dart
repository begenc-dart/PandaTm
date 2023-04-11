//
// import 'package:flutter/material.dart';
//
// import 'package:serpay/Model/TextColor.dart';
//
// import 'package:serpay/Sebet/NotOrderedProduct/NotOrderProduct.dart';
//
// import 'package:serpay/Sebet/Order.dart';
// import 'package:serpay/darkMode/theme_services.dart';
//
// import '../Model/Colors.dart';
//
//
// import 'NotOrderedProduct/NotOrderedProductModel.dart';
// import 'OrderProduct.dart';
//
// class Sebet extends StatefulWidget {
//   const Sebet({Key? key}) : super(key: key);
//
//   @override
//   _SebetState createState() => _SebetState();
// }
//
// class _SebetState extends State<Sebet> {
//
//   Colrs select = Colrs();
//   bool check = false;
//
// late Future<NotOrderedProductElement> _notOrderedProduct;
// @override
//   void initState() {
//     // TODO: implement initState
//   _notOrderedProduct=NoteOrderProductHttp().fetchAlbum();
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               "Sebet",
//               style: CustomTextStyle.carAppBar(context),
//             ),
//             Text(
//               "Clear",
//               style: CustomTextStyle.carAppBarClear(context),
//             )
//           ],
//         ),
//         backgroundColor: ThemeServices().theme == ThemeMode.dark
//             ? Color.fromRGBO(39, 39, 39, 1)
//             : Color.fromRGBO(250, 250, 250, 1),
//         elevation: 0,
//       ),
//       body: FutureBuilder(
//         future: _notOrderedProduct,
//         builder: (BuildContext context, AsyncSnapshot<NotOrderedProductElement> snapshot) {
//           debugPrint(snapshot.toString());
//           if(snapshot.hasData){
//           return snapshot.data!.notOrderedProducts.isNotEmpty? Column(
//               children: [
//                 Container(
//                   height: MediaQuery.of(context).size.height - 202,
//                   width: MediaQuery.of(context).size.width,
//                   child: ListView.builder(
//                     itemBuilder: (context, index) {
//                       return OrderProduct(
//                         check: snapshot.data!.notOrderedProducts[index].orders,
//                         count: snapshot.data!.notOrderedProducts[index].quantity,
//                         prod: snapshot.data!.notOrderedProducts![index], prodList: snapshot.data!.notOrderedProducts!, index: index, setState: infiniti,
//                       );
//                     },
//                     itemCount: snapshot.data!.notOrderedProducts!.length,
//                   ),
//                 ),
//                 Row(
//                   children: [
//                     Container(
//                       height: 60,
//                       width: MediaQuery.of(context).size.width / 2,
//                       decoration: BoxDecoration(
//                           color: ThemeServices().theme == ThemeMode.dark
//                               ? Color.fromRGBO(39, 39, 39, 1)
//                               : select.tmcolo,
//                           border: Border.all(
//                               color: ThemeServices().theme == ThemeMode.dark
//                                   ? Color.fromRGBO(97, 97, 97, 1)
//                                   : select.bannerOffColor,
//                               width: 1)),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             snapshot.data!.notOrderedProducts[0].totalPrice.toString(),
//                             style: CustomTextStyle.pricecard(context),
//                           ),
//                           Text(
//                             "TMT",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w500,
//                                 fontSize: 12,
//                                 color: ThemeServices().theme == ThemeMode.dark
//                                     ? Colors.white
//                                     : select.tabColo),
//                             textAlign: TextAlign.end,
//                           )
//                         ],
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(context,
//                             MaterialPageRoute(builder: (context) => Order()));
//                       },
//                       child: Container(
//                         height: 60,
//                         width: MediaQuery.of(context).size.width / 2,
//                         decoration: BoxDecoration(
//                             color: select.mainColo,
//                             boxShadow: [
//                               BoxShadow(color: select.shadowCol, blurRadius: 6)
//                             ]),
//                         child: Center(
//                             child: Text(
//                               "Order",
//                               style: TextStyle(
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: 16,
//                                   color: select.tmcolo),
//                               textAlign: TextAlign.end,
//                             )),
//                       ),
//                     )
//                   ],
//                 ),
//               ],
//             ):Container();
//           }
//           else{
//             return Center(child: CircularProgressIndicator(color: Colors.red,),);
//           }
//         },
//
//       ),
//     );
//   }
//   infiniti(){
//     setState(() {
//
//     });
//   }
// }
//
