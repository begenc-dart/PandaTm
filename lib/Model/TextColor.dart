import 'package:flutter/material.dart';
import 'package:serpay/darkMode/theme_services.dart';

import 'Colors.dart';

Colrs select = Colrs();
BColrs bColrs = BColrs();

class CustomTextStyle {
  static TextStyle CardType(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        color: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(250, 250, 250, 1)
            : select.newCol,
        fontSize: 15,
        fontWeight: FontWeight.w500);
  }

  static TextStyle priceColor(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        color: select.textCol, fontSize: 15, fontWeight: FontWeight.w700);
  }

  static TextStyle productfotterPrice(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        color: select.tmcolo, fontSize: 16, fontWeight: FontWeight.w700);
  }

  static TextStyle cardDes(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        color: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(250, 250, 250, 1)
            : select.recColor,
        fontSize: 12,
        fontWeight: FontWeight.w400);
  }
  static TextStyle cartproduct(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        color: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(250, 250, 250, 1)
            : select.recColor,
        fontSize: 16,
        fontWeight: FontWeight.w600);
  }
  static TextStyle cardName(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        color: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(174, 174, 174, 1)
            : select.recColor,
        fontSize: 10,
        fontWeight: FontWeight.w400);
  }

  static TextStyle discount(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        color: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(250, 250, 250, 1)
            : select.tabColo,
        fontSize: 10,
        fontWeight: FontWeight.w400);
  }

  static TextStyle cateprostyle(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: MediaQuery.of(context).size.width*0.027,
        color: ThemeServices().theme == ThemeMode.dark
            ? select.scaf
            : select.cateproCol);
  }

  static TextStyle cateStyle(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontSize: MediaQuery.of(context).size.width*0.03,
        fontWeight: FontWeight.w700,
        color: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(250, 250, 250, 1)
            : select.recColor);
  }

  static TextStyle freeProdcuttime(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(250, 250, 250, 1)
            : select.recColor);
  }

  static TextStyle topPerson(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontWeight: FontWeight.w700, fontSize: 16, color: select.mainColo);
  }

  static TextStyle cardPrice(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontWeight: FontWeight.w700, fontSize: 14, color: select.mainColo);
  }

  static TextStyle topPersonName(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(250, 250, 250, 1)
            : select.recColor);
  }

  static TextStyle topPersonShare(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontSize: 15,
        color: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(174, 174, 174, 1)
            : select.shareCol,
        fontWeight: FontWeight.w400);
  }

  static TextStyle top(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(250, 250, 250, 1)
            : select.tabColo);
  }

  static TextStyle priceRange(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: ThemeServices().theme == ThemeMode.dark
            ? Colors.white
            : select.tabColo);
  }

  static TextStyle fieldmax(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontSize: 14, fontWeight: FontWeight.w400, color: select.mincol);
  }

  static TextStyle error(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontSize: 14, fontWeight: FontWeight.w400, color: select.mainColo);
  }

  static TextStyle filterTop(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: ThemeServices().theme == ThemeMode.dark
            ? Colors.white
            : select.tabColo);
  }

  static TextStyle filterClear(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        color: select.clear, fontWeight: FontWeight.w400, fontSize: 14);
  }

  static TextStyle productfotterBasket(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        color: select.tmcolo, fontSize: 14, fontWeight: FontWeight.w700);
  }

  static TextStyle despro(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w900,
        color: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(250, 250, 250, 1)
            : select.recColor);
  }

  static TextStyle productdes(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(250, 250, 250, 1)
            : select.recColor);
  }

  static TextStyle detpro(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(250, 250, 250, 1)
            : select.tabColo);
  }

  static TextStyle carAppBar(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(250, 250, 250, 1)
            : select.tabColo);
  }

  static TextStyle drowDown(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(174, 174, 174, 1)
            : select.shareCol);
  }

  static TextStyle quit(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: ThemeServices().theme == ThemeMode.dark
            ? Colors.white
            : select.shareCol);
  }

  static TextStyle LogIn(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontWeight: FontWeight.w500, fontSize: 16, color: select.tmcolo);
  }

  static TextStyle signUp(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontWeight: FontWeight.w500, fontSize: 16, color: select.filCol);
  }

  static TextStyle yok(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .headline1!
        .copyWith(fontWeight: FontWeight.w500, fontSize: 16, color: select.yok);
  }

  static TextStyle profiledettails(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: ThemeServices().theme == ThemeMode.dark
            ? Colors.white
            : select.tabColo);
  }

  static TextStyle changePhoto(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(174, 174, 174, 1)
            : select.disCol,
        decoration: TextDecoration.underline,
        decorationColor: select.disCol);
  }

  static TextStyle carAppBarClear(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontWeight: FontWeight.w400, fontSize: 14, color: select.clear);
  }

  static TextStyle disprod(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontSize: 12, fontWeight: FontWeight.w600, color: select.tmcolo);
  }

  static TextStyle tmtpro(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontWeight: FontWeight.w600, fontSize: 10, color: select.tmcolo);
  }

  static TextStyle proother(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 10,
        color: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(174, 174, 174, 1)
            : select.filCol);
  }

  static TextStyle DiscoutDot(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontWeight: FontWeight.w400, fontSize: 20, color: select.tmcolo);
  }

  static TextStyle proset(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontWeight: FontWeight.w400, fontSize: 8, color: select.newCol);
  }

  static TextStyle productproset(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontWeight: FontWeight.w500, fontSize: 10, color: select.newCol);
  }

  static TextStyle showres(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontWeight: FontWeight.w500, fontSize: 14, color: select.tmcolo);
  }

  static TextStyle sellpro(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 12,
        color: ThemeServices().theme == ThemeMode.dark
            ? bColrs.login
            : select.tmcolo);
  }

  static TextStyle selldes(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: ThemeServices().theme == ThemeMode.dark
            ? select.scaf
            : select.despro);
  }

  static TextStyle size(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: ThemeServices().theme == ThemeMode.dark
            ? select.scaf
            : select.tabColo);
  }

  static TextStyle sizepro(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontWeight: FontWeight.w300,
        fontSize: 12,
        color: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(250, 250, 250, 1)
            : select.sizeColo);
  }

  static TextStyle photodesstyle(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontWeight: FontWeight.w300, fontSize: 12, color: select.tmcolo);
  }

  static TextStyle sellproprice(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontWeight: FontWeight.w700, fontSize: 20, color: select.mainColo);
  }

  static TextStyle pricecard(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 20,
        color: ThemeServices().theme == ThemeMode.dark
            ? Colors.white
            : select.tabColo);
  }

  static TextStyle dispro(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: select.disCol,
        decorationColor: select.lincol,
        decorationThickness: 1.5,
        decoration: TextDecoration.lineThrough);
  }

  static TextStyle TmCol(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        color: select.tmcolo, fontSize: 8, fontWeight: FontWeight.w500);
  }

  static TextStyle server(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: ThemeServices().theme == ThemeMode.dark
            ? Colors.white
            : select.serverColor);
  }

  static TextStyle disprice(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: select.disCol,
        decoration: TextDecoration.lineThrough,
        decorationColor: select.lincol);
  }

  static TextStyle TmCollist(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        color: select.tmcolo, fontSize: 10, fontWeight: FontWeight.w600);
  }

  static TextStyle desStyle(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(250, 250, 250, 1)
            : select.desColor);
  }

  static TextStyle nameTm(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontWeight: FontWeight.w700,
        fontSize: 14,
        color: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(250, 250, 250, 1)
            : Colors.black);
  }

  static TextStyle searchHintStyle(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontWeight: FontWeight.w400, fontSize: 14, color: select.searchResCol);
  }

  static TextStyle searchres(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(220, 220, 220, 1)
            : select.searchResCol);
  }

  static TextStyle price(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(255, 20, 29, 1)
            : select.tabColo);
  }

  static TextStyle searchHintStyletext(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(174, 174, 174, 1)
            : select.searchResCol);
  }

  static TextStyle history(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(250, 250, 250, 1)
            : select.recColor);
  }

  static TextStyle newStle(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontSize: 8, fontWeight: FontWeight.w700, color: select.newCol);
  }

  static TextStyle disColor(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontSize: 10, fontWeight: FontWeight.w700, color: Colors.white);
  }

  static TextStyle Skidka(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(250, 250, 250, 1)
            : Color.fromRGBO(47, 47, 47, 1));
  }

  static TextStyle Skidkapro(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontSize: 13,
        fontWeight: FontWeight.w300,
        color: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(250, 250, 250, 1)
            : Color.fromRGBO(41, 41, 41, 1));
  }

  static TextStyle newSty(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        color: Color.fromRGBO(47, 47, 47, 1));
  }

  static TextStyle searchStyle(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(174, 174, 174, 1)
            : select.searchResCol);
  }

  static TextStyle chatred(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontSize: 15, fontWeight: FontWeight.w400, color: select.searh);
  }

  static TextStyle chatwhite(BuildContext context) {
    return Theme.of(context).textTheme.headline1!.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: ThemeServices().theme == ThemeMode.dark
            ? Colors.white
            : select.recColor);
  }
}
