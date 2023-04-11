import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


import '../../Language/Language.dart';
import '../../Model/TextColor.dart';
import '../Model/OneFreeProduct.dart';
class ProductDesc extends StatelessWidget {
  FreeProduct freeProduct;
  LanguageModel lan;
  String url;
  ProductDesc({required this.freeProduct,required this.url,required this.lan});

  @override
  Widget build(BuildContext context) {
    return  SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
             url=="ru"? freeProduct.nameRu:freeProduct.nameTm,
              style:
              CustomTextStyle.carAppBar(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Text(
              url=="ru"?freeProduct.bodyRu: freeProduct.bodyTm,
              style:
              CustomTextStyle.chatwhite(context),
            ),
          ),

          freeProduct.max!=null?  Padding(
            padding: EdgeInsets.all(15.0),
            child:  LinearPercentIndicator(
              width: 185,
              animation: true,
              lineHeight: 15.0,
              animationDuration: 2000,
              percent:(freeProduct.max.toInt()*100/freeProduct.goal.toInt())/100,
              center: Text(
                (freeProduct.max.toInt()*100/freeProduct.goal).toStringAsFixed(1),
                style: CustomTextStyle.productproset(context),
              ),
              linearStrokeCap: LinearStrokeCap.roundAll,
              // progressColor: Colors.greenAccent,
              linearGradient: LinearGradient(colors: [
                select.freeProd,
                select.mainColo,
              ]),
            ),
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
