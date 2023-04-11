import 'package:flutter/material.dart';
import 'package:serpay/MainPage/Model/Product.dart';

import '../../../Language/Language.dart';
import '../../../Model/TextColor.dart';

class ProductText extends StatelessWidget {
  OneProduct oneProductElement;
  String url;
  LanguageModel lan;
  ProductText({required this.oneProductElement,required this.url,required this.lan});
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [

          Padding(
            padding: const EdgeInsets.only(left: 15,top: 10),
            child: Text(
              url=="ru"?oneProductElement.nameRu: oneProductElement.nameTm,
              style: CustomTextStyle.price(context),

            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 15),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
            oneProductElement.price!=null? oneProductElement.price.toStringAsFixed(1):"0",
                  style: CustomTextStyle.despro(context),
                ),
                Container(
                  margin: EdgeInsets.only(left: 5, right: 25),
                  width: 30,
                  height: 15,
                  decoration: BoxDecoration(
                      color: select.disCol,
                      borderRadius: BorderRadius.circular(2)),
                  child: Center(
                      child: Text(
                        "TMT",
                        style: CustomTextStyle.tmtpro(context),
                      )),
                ),
                oneProductElement.priceOld != null ?
                Text(
                  "${oneProductElement.priceOld} TMT",
                  style: CustomTextStyle.dispro(context),
                ) : Container(),
                oneProductElement.discount != 0&&oneProductElement.discount != null ?
                Container(
                  margin: EdgeInsets.only(left: 20),
                  width: 31,
                  height: 15,
                  decoration: BoxDecoration(
                    color: select.mainColo,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Center(
                      child: Text(
                        "-${oneProductElement.discount}%",
                        style: CustomTextStyle.disprod(context),
                      )),
                ) : Container()
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15,top: 5,right: 10),
            child: Text(
             url=="ru"?oneProductElement.bodyRu: oneProductElement.bodyTm,
              style: CustomTextStyle.productdes(context),
            ),
          ),
          oneProductElement.details!.length!=0? Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              lan.detallar,
              style: CustomTextStyle.detpro(context),
            ),
          ):Container(),
        ],
      ),
    );
  }

  realated(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(lan.menzes, style: CustomTextStyle.detpro(context)),
          )
        ],
      ),
    );
  }
}
