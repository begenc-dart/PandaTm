import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


import '../../Model/Language.dart';
import '../../Model/TextColor.dart';
import '../../darkMode/theme_services.dart';
import '../Model/OneFreeProduct.dart';
class ProductDesc extends StatefulWidget {
  FreeProduct freeProduct;
  LanguageModel lan;
  String url;
  ProductDesc({required this.freeProduct,required this.url,required this.lan});

  @override
  State<ProductDesc> createState() => _ProductDescState();
}

class _ProductDescState extends State<ProductDesc> {
bool check=true;

  @override
  Widget build(BuildContext context) {
    return  SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
            child: Text(
             widget.url=="ru"? widget.freeProduct.nameRu:widget.freeProduct.nameTm,
              style:
              CustomTextStyle.carAppBar(context),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              InkWell(
                onTap: (){
                  check=!check;
                  setState(() {

                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Text("Doly okan",style: TextStyle(fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.red),),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.url=="ru"?widget.freeProduct.bodyRu: widget.freeProduct.bodyTm,
                  maxLines: check?2:null,
                  style:
                  CustomTextStyle.chatwhite(context),
                ),

              ],
            ),
          ),

          widget.freeProduct.max!=null?  Row(
            children: [
              Padding(
                padding: EdgeInsets.all(15.0),
                child:  LinearPercentIndicator(
                  width: 185,
                  animation: true,
                  lineHeight: 15.0,
                  animationDuration: 2000,
                  percent:(widget.freeProduct.max.toInt()*100/widget.freeProduct.goal.toInt())/100,
                  center: Text(
                    (widget.freeProduct.max.toInt()*100/widget.freeProduct.goal).toStringAsFixed(1),
                    style: CustomTextStyle.productproset(context),
                  ),
                  linearStrokeCap: LinearStrokeCap.roundAll,
                  // progressColor: Colors.greenAccent,
                  linearGradient: LinearGradient(colors: [
                    select.freeProd,
                    select.mainColo,
                  ]),
                ),
              ), Row(
                children: [
                  SvgPicture.asset(
                    "asset/MainPagePhoto/users (1).svg",
                    color: ThemeServices().theme ==
                        ThemeMode.dark
                        ? const Color.fromRGBO(174, 174, 174, 1)
                        : const Color.fromRGBO(97, 97, 97, 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      widget.freeProduct.contestants.toString(),
                      style: CustomTextStyle.topPersonShare(
                          context),
                    ),
                  )
                ],
              ),
            ],
          ):Container(),
          Padding(
            padding:
            const EdgeInsets.only(left: 15,top: 5, bottom: 10),
            child: Row(
              children: [
                SvgPicture.asset("asset/icon/award.svg"),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "Top-5",
                    style: CustomTextStyle.top(context),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
