import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';


import '../../Language/Language.dart';
import '../../Model/TextColor.dart';
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
            padding: const EdgeInsets.all(15.0),
            child: Text(
             widget.url=="ru"? widget.freeProduct.nameRu:widget.freeProduct.nameTm,
              style:
              CustomTextStyle.carAppBar(context),
            ),
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
                      child: Text("Doly okan",style: TextStyle(fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.red),),
                    )
                  ],
                )
              ],
            ),
          ),

          widget.freeProduct.max!=null?  Padding(
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
