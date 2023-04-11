//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:serpay/Sebet/NotOrderedProduct/DeleteCart.dart';
// import 'package:serpay/Sebet/NotOrderedProduct/NotOrderedProductModel.dart';
//
// import '../IpAdress.dart';
// import '../MainPage/Product/FotterProduct/Sized.dart';
// import '../Model/TextColor.dart';
// import '../darkMode/theme_services.dart';
// import 'NotOrderedProduct/IsSelect.dart';
// import 'NotOrderedProduct/UpdateProduct.dart';
//
// class OrderProduct extends StatefulWidget {
//   bool check;
//   int count;
//   List<NotOrderedProduct> prodList;
//   NotOrderedProduct prod;
//   int index;
//   Function setState;
//   OrderProduct({required this.check, required this.count, required this.prod,required this.prodList,required this.index,required this.setState});
//
//   @override
//   _OrderProductState createState() => _OrderProductState();
// }
//
// class _OrderProductState extends State<OrderProduct> {
//   @override
//   Widget build(BuildContext context) {
//     return CheckboxListTile(
//       value: widget.check,
//       controlAffinity: ListTileControlAffinity.leading,
//       onChanged: (value) {
//         setState(() => widget.check = value!);
//         IsSelected()
//             .createUser(widget.prod.orderproductId, widget.check.toString());
//       },
//       subtitle: Row(
//         children: [
//           Expanded(
//               child: CachedNetworkImage(
//                 width: 50,
//                 height: 50,
//                 imageUrl: "${IpAddress().ipAddress}/${widget.prod.image}",
//               )),
//           Padding(
//             padding: const EdgeInsets.only(left: 10),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   widget.prod.nameTm,
//                   style: CustomTextStyle.cardDes(context),
//                 ),
//                 InkWell(
//             onTap: (){
//               // Sized().addcard(context,widget.prod.productsizes);
//             },
//                   child: Padding(
//                     padding: const EdgeInsets.only(top: 8, bottom: 15),
//                     child: Text(
//                       "Size " + widget.prod.size.toString(),
//                       style: CustomTextStyle.cardName(context),
//                     ),
//                   ),
//                 ),
//                 Container(
//                   alignment: Alignment.centerLeft,
//                   width: MediaQuery.of(context).size.width / 2 - 20,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         widget.prod.price.toString() + "TMT",
//                         style: CustomTextStyle.cardPrice(context),
//                       ),
//                       Container(
//                         height: 20,
//                         child: widget.count != 0
//                             ? Row(
//                           mainAxisAlignment:
//                           MainAxisAlignment.spaceBetween,
//                           children: [
//                             InkWell(
//                               onTap: () async {
//                                 setState(() {
//                                   widget.count--;
//                                 });
//                                 UpdateProduct().createUser(
//                                     widget.prod.orderproductId,
//                                     widget.count);
//                               },
//                               child: Container(
//                                 width: 20,
//                                 height: 20,
//                                 decoration: BoxDecoration(
//                                     borderRadius:
//                                     BorderRadius.circular(2),
//                                     border: Border.all(
//                                         color: ThemeServices().theme ==
//                                             ThemeMode.dark
//                                             ? Color.fromRGBO(
//                                             174, 174, 174, 1)
//                                             : Color.fromRGBO(
//                                             41, 41, 41, 1),
//                                         width: 0.8)),
//                                 margin: EdgeInsets.only(right: 10),
//                                 child: Icon(
//                                   Icons.remove,
//                                   color: ThemeServices().theme ==
//                                       ThemeMode.dark
//                                       ? Color.fromRGBO(250, 250, 250, 1)
//                                       : Colors.black,
//                                   size: 12,
//                                 ),
//                               ),
//                             ),
//                             new Text(
//                               widget.count.toString(),
//                               style: CustomTextStyle.freeProdcuttime(
//                                   context),
//                             ),
//                             10 > widget.count
//                                 ? InkWell(
//                               onTap: () async {
//                                 setState(() {
//                                   widget.count++;
//                                 });
//                                 UpdateProduct().createUser(
//                                     widget.prod.orderproductId,
//                                     widget.count);
//                               },
//                               child: new Container(
//                                 width: 20,
//                                 height: 20,
//                                 decoration: BoxDecoration(
//                                     borderRadius:
//                                     BorderRadius.circular(2),
//                                     border: Border.all(
//                                         color: ThemeServices()
//                                             .theme ==
//                                             ThemeMode.dark
//                                             ? Color.fromRGBO(
//                                             174, 174, 174, 1)
//                                             : Color.fromRGBO(
//                                             41, 41, 41, 1),
//                                         width: 0.8)),
//                                 margin: EdgeInsets.only(left: 10),
//                                 child: new Icon(
//                                   Icons.add,
//                                   color: ThemeServices().theme ==
//                                       ThemeMode.dark
//                                       ? Color.fromRGBO(
//                                       250, 250, 250, 1)
//                                       : Colors.black,
//                                   size: 12,
//                                 ),
//                               ),
//                             )
//                                 : Container(
//                               padding: EdgeInsets.only(left: 17),
//                               child: new Icon(
//                                 Icons.add,
//                                 color: Colors.black54,
//                                 size: 14,
//                               ),
//                             ),
//                           ],
//                         )
//                             : InkWell(
//                             onTap: () async {
//                               setState(() {
//                                 widget.count = 1;
//                               });
//                             },
//                             child: Container(
//                               width: 25,
//                               height: 20,
//                               decoration: BoxDecoration(
//                                   border: Border.all(
//                                     color: Color.fromRGBO(41, 41, 41, 1),
//                                     width: 0.8,
//                                   ),
//                                   borderRadius: BorderRadius.circular(2)),
//                               child: Text(
//                                 "x1",
//                                 textAlign: TextAlign.center,
//                               ),
//                             )),
//                       ),
//                       InkWell(
//                           onTap: () {
//                             debugPrint(widget.prodList.toString()+"dsfsd");
//                             DeleteCart().deleteCart(widget.prodList[widget.index].productId);
//                             widget.prodList.removeAt(widget.index);
//
//                             widget.setState();
//
//                           },
//                           child: Icon(
//                             Icons.delete,
//                             color: Color.fromRGBO(255, 20, 29, 1),
//                           ))
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//     ;
//   }
// }
