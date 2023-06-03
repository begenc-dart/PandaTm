import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:serpay/Sebet/NotOrderedProduct/NotOrderedProductModel.dart';

import '../../IpAdress.dart';

import '../../MainPage/Product/Product.dart';
import '../../Model/TextColor.dart';
import '../../Providers.dart';
import '../../darkMode/theme_services.dart';
import '../NotOrderedProduct/DeleteCart.dart';
import '../NotOrderedProduct/IsSelect.dart';

import '../NotOrderedProduct/UpdateProduct.dart';

class CardProduct extends ConsumerStatefulWidget {
  Order order;
  List<Order> orders;
  List<NotOrderedProductElement> notOrder;
  int index;
  int proindex;
  Function refres;
  String url;

  CardProduct(this.order, this.refres, this.index, this.proindex, this.orders,
      this.notOrder, this.url);

  @override
  ConsumerState<CardProduct> createState() => _CardProductState();
}

class _CardProductState extends ConsumerState<CardProduct> {
  @override
  List<int> cartProduct = [];
  List<double> cart = [];
  double pricecheck = 0;
  List<List<int>> totalprice = [];

  void initState() {
    // TODO: implement initState

    super.initState();
  }

  int count = 0;

  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Checkbox(
          value: widget.order.isSelected,
          onChanged: (value) {
            widget.orders.length != 0
                ? value == true
                    ? {
                        ref.watch(CounterState.provider)[widget.index]
                            [widget.proindex] = widget.order.quantity,
                        ref.read(PriceState.pricepro.notifier).addindex(
                            widget.index,
                            widget.order.price *
                                ref.watch(CounterState.provider)[widget.index]
                                    [widget.proindex]),

                        // productIndex.addpro(
                        //       widget.index,
                        //       widget.order.price *
                        //           counter.count[widget.index][widget.proindex])
                        // ref.read(CounterState.provider.notifier).remove(widget.index, widget.proindex),
                      }
                    : {
                        widget.order.quantity =
                            ref.watch(CounterState.provider)[widget.index]
                                [widget.proindex],
                        ref.read(PriceState.pricepro.notifier).remove(
                            widget.index,
                            widget.order.price *
                                ref.watch(CounterState.provider)[widget.index]
                                    [widget.proindex]),
                        // productIndex.removePro(
                        //     widget.index,
                        //     widget.order.price *
                        //         counter.count[widget.index][widget.proindex])
                      }
                : "";
            setState(() => widget.order.isSelected = value!);
            IsSelected()
                .createUser(widget.order.orderproductId, value.toString());
          },
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductDetails(
                      productId: widget.order.productId,
                    )));
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        width: 100,
                        fit: BoxFit.fill,
                        height: 80,
                        imageUrl:
                            "${IpAddress().ipAddress}/${widget.order.image}",
                        errorWidget: (context, url, error) =>
                            Image.asset("asset/Img/banner-img.jpg"),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.url == "ru"
                                  ? widget.order.nameRu.toString()
                                  : widget.order.nameTm.toString(),
                              overflow: TextOverflow.ellipsis,
                              // maxLines: 1,
                              style: CustomTextStyle.cartproduct(context),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    // Sized().addcard(context,widget.prod.productsizes);
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(top: 8, bottom: 15),
                                    child: Text(
                                      widget.order.size != null
                                          ? widget.order.productColor == null
                                              ? ""
                                              : widget.order.productColor![0]
                                                      .colorNameTm +
                                                  " " +
                                                  widget.order.size.toString()
                                          : "",
                                      style: CustomTextStyle.cardName(context),
                                    ),
                                  ),
                                ),
                                InkWell(
                                    onTap: () {
                                      // debugPrint(widget.prodList.toString()+"dsfsd");
                                      DeleteCart().deleteCart(
                                          widget.order.orderproductId);
                                      widget.orders
                                          .removeAt(widget.proindex);
                                      widget.order.isSelected == true
                                          ? ref
                                          .read(PriceState
                                          .pricepro.notifier)
                                          .remove(
                                          widget.index,
                                          widget.order.price *
                                              ref.watch(CounterState
                                                  .provider)[
                                              widget
                                                  .index][widget
                                                  .proindex])
                                          : "";

//
                                      widget.orders.length == 0
                                          ? {
                                        widget.notOrder.removeAt(
                                            widget.index),
                                        ref
                                            .read(PriceState
                                            .pricepro
                                            .notifier)
                                            .removeprice(
                                            widget.index)
                                        // productIndex.removeall(widget.index)
                                      }
                                          : "";
                                      ref
                                          .read(CounterState
                                          .provider.notifier)
                                          .removepro(widget.index,
                                          widget.proindex);
                                      widget.refres();
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.delete,
                                        color: Color.fromRGBO(
                                            255, 20, 29, 1),
                                      ),
                                    ))
                              ],
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.order.price.toString() + "TMT",
                                    style: CustomTextStyle.cardPrice(context),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                          height: 20,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                radius: 100,
                                                onTap: ref.watch(CounterState
                                                                    .provider)[
                                                                widget.index]
                                                            [widget.proindex] !=
                                                        1
                                                    ? () async {
                                                        widget.order.isSelected ==
                                                                true
                                                            ? {
                                                                ref
                                                                    .read(CounterState
                                                                        .provider
                                                                        .notifier)
                                                                    .remove(
                                                                        widget
                                                                            .index,
                                                                        widget
                                                                            .proindex),
                                                                ref
                                                                    .read(PriceState
                                                                        .pricepro
                                                                        .notifier)
                                                                    .remove(
                                                                        widget
                                                                            .index,
                                                                        widget
                                                                            .order
                                                                            .price),

                                                                // productIndex
                                                                //     .removePro(
                                                                //         widget.index,
                                                                //         widget.order
                                                                //             .price),
                                                                //
                                                                // productIndex.quantity(widget.order.totalPrice+counter.count,widget.index);
                                                                UpdateProduct().createUser(
                                                                    widget.order
                                                                        .orderproductId,
                                                                    ref.watch(CounterState
                                                                            .provider)[
                                                                        widget
                                                                            .index][widget
                                                                        .proindex])
                                                              }
                                                            : {
                                                                widget.order
                                                                    .quantity--,
                                                                UpdateProduct().createUser(
                                                                    widget.order
                                                                        .orderproductId,
                                                                    widget.order
                                                                        .quantity),
                                                                setState(() {})
                                                              };
                                                      }
                                                    : () {},
                                                child: Container(
                                                  width: 20,
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2),
                                                      border: Border.all(
                                                          color: ThemeServices()
                                                                      .theme ==
                                                                  ThemeMode.dark
                                                              ? Color.fromRGBO(
                                                                  174,
                                                                  174,
                                                                  174,
                                                                  1)
                                                              : Color.fromRGBO(
                                                                  41,
                                                                  41,
                                                                  41,
                                                                  1),
                                                          width: 0.8)),
                                                  margin: EdgeInsets.only(
                                                      right: 10,left: 10),
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: ThemeServices()
                                                                .theme ==
                                                            ThemeMode.dark
                                                        ? Color.fromRGBO(
                                                            250, 250, 250, 1)
                                                        : Colors.black,
                                                    size: 12,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                widget.order.isSelected == true
                                                    ? ref
                                                        .watch(CounterState
                                                            .provider)[widget
                                                                .index]
                                                            [widget.proindex]
                                                        .toString()
                                                    : widget.order.quantity
                                                        .toString(),
                                                style: CustomTextStyle
                                                    .freeProdcuttime(context),
                                              ),
                                              100 >
                                                      ref.watch(CounterState
                                                                  .provider)[
                                                              widget.index]
                                                          [widget.proindex]
                                                  ? InkWell(
                                                      radius: 100,
                                                      onTap: () async {
                                                        widget.order.isSelected ==
                                                                true
                                                            ? {
                                                                ref
                                                                    .read(CounterState
                                                                        .provider
                                                                        .notifier)
                                                                    .addindex(
                                                                        widget
                                                                            .index,
                                                                        widget
                                                                            .proindex),
                                                                ref
                                                                    .read(PriceState
                                                                        .pricepro
                                                                        .notifier)
                                                                    .addindex(
                                                                        widget
                                                                            .index,
                                                                        widget
                                                                            .order
                                                                            .price),

                                                                // productIndex.addpro(
                                                                //     widget
                                                                //         .index,
                                                                //     widget.order
                                                                //         .price),
                                                                //
                                                                // productIndex.quantity(widget.order.totalPrice+counter.count,widget.index);
                                                                UpdateProduct()
                                                                    .createUser(
                                                                  widget.order
                                                                      .orderproductId,
                                                                  ref
                                                                          .watch(CounterState
                                                                              .provider
                                                                              .notifier)
                                                                          .state[
                                                                      widget
                                                                          .index][widget
                                                                      .proindex],
                                                                )
                                                              }
                                                            : {
                                                                widget.order
                                                                    .quantity++,
                                                                UpdateProduct().createUser(
                                                                    widget.order
                                                                        .orderproductId,
                                                                    ref.watch(CounterState.provider.notifier).state[
                                                                        widget
                                                                            .index][widget
                                                                        .proindex]),
                                                                setState(() {})
                                                              };
                                                      },
                                                      child: Container(
                                                        width: 20,
                                                        height: 20,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        2),
                                                            border: Border.all(
                                                                color: ThemeServices()
                                                                            .theme ==
                                                                        ThemeMode
                                                                            .dark
                                                                    ? Color.fromRGBO(
                                                                        174,
                                                                        174,
                                                                        174,
                                                                        1)
                                                                    : Color
                                                                        .fromRGBO(
                                                                            41,
                                                                            41,
                                                                            41,
                                                                            1),
                                                                width: 0.8)),
                                                        margin: EdgeInsets.only(
                                                            left: 10,right: 10),
                                                        child: new Icon(
                                                          Icons.add,
                                                          color: ThemeServices()
                                                                      .theme ==
                                                                  ThemeMode.dark
                                                              ? Color.fromRGBO(
                                                                  250,
                                                                  250,
                                                                  250,
                                                                  1)
                                                              : Colors.black,
                                                          size: 12,
                                                        ),
                                                      ),
                                                    )
                                                  : Container(
                                                      padding: EdgeInsets.only(
                                                          left: 17),
                                                      child: new Icon(
                                                        Icons.add,
                                                        color: Colors.black54,
                                                        size: 14,
                                                      ),
                                                    ),
                                            ],
                                          )),

                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Divider(
                  indent: 5,
                  endIndent: 5,
                  thickness: 1,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
