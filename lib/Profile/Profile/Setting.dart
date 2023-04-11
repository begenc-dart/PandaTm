import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:serpay/Language/Language.dart';

import 'package:serpay/Profile/MyAddress/MyAddres.dart';
import 'package:serpay/Profile/ContactUs/Contact.dart';
import 'package:serpay/Profile/Profile/Help.dart';
import 'package:serpay/Profile/NewPassword/Security.dart';
import 'package:serpay/darkMode/theme_services.dart';
import 'package:serpay/language.dart';
import 'package:serpay/main.dart';
import 'package:share/share.dart';

import '../MyAddress/address.dart';
import '../NewPassword/NewPassword.dart';

class Setting extends StatefulWidget {
  ProfileDetails profi;
  Gosmaca gosmaca;
  String url;

  Setting({required this.url, required this.profi, required this.gosmaca});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  String url = "";

  language() async {
    await LanguageFileRead().then((value) {
      url = value;
    });
  }

  String radioItem = 'Item 1';

  @override
  void initState() {
    // TODO: implement initState
    language();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(39, 39, 39, 1)
            : Color.fromRGBO(250, 250, 250, 1),
        title: Text(
          widget.profi.setting,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: ThemeServices().theme == ThemeMode.dark
                ? Colors.white
                : Colors.black,
          ),
        ),
      ),
      body: ListView(
        children: [
          InkWell(
            onTap: () {
              newDialog(context);
            },
            child:
                setin(context, "asset/Setting/Language.svg", widget.profi.dil),
          ),
          InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor:
                            ThemeServices().theme == ThemeMode.dark
                                ? Color.fromRGBO(39, 39, 39, 1)
                                : Colors.white,
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        title: Column(
                          children: [
                            RadioListTile(
                              controlAffinity:
                                  ListTileControlAffinity.trailing,
                              groupValue: radioItem,
                              title: Text(
                               url=="tm"? 'Aşgabat':"Ашгабат",
                                style: TextStyle(
                                  color:
                                      ThemeServices().theme == ThemeMode.dark
                                          ? Colors.white
                                          : Colors.black,
                                ),
                              ),
                              value: 'Item 1',
                              onChanged: (val) {
                                setState(() {
                                  radioItem = val.toString();
                                });
                              },
                            ),
                            RadioListTile(
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                groupValue: radioItem,
                                title: Text(
                                 url=="tm" ?'Ahal':"Ахал",
                                  style: TextStyle(
                                    color: ThemeServices().theme ==
                                            ThemeMode.dark
                                        ? Colors.white
                                        : Colors.black26,
                                  ),
                                ),
                                value: 'Item 2',
                                onChanged: null),
                            RadioListTile(
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                groupValue: radioItem,
                                title: Text(
                                  url=="tm"?'Balkan':"Балкан",
                                  style: TextStyle(
                                    color: ThemeServices().theme ==
                                            ThemeMode.dark
                                        ? Colors.white
                                        : Colors.black26,
                                  ),
                                ),
                                value: 'Item 3',
                                onChanged: null),
                            RadioListTile(
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                groupValue: radioItem,
                                title: Text(
                                  url=="tm"?'Daşoguz':"Дашогуз",
                                  style: TextStyle(
                                    color: ThemeServices().theme ==
                                            ThemeMode.dark
                                        ? Colors.white
                                        : Colors.black26,
                                  ),
                                ),
                                value: 'Item 4',
                                onChanged: null),
                            RadioListTile(
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                groupValue: radioItem,
                                title: Text(
                                  url=="tm"?'Lebap':"Лебап",
                                  style: TextStyle(
                                    color: ThemeServices().theme ==
                                            ThemeMode.dark
                                        ? Colors.white
                                        : Colors.black26,
                                  ),
                                ),
                                value: 'Item 5',
                                onChanged: null),
                            RadioListTile(
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                groupValue: radioItem,
                                title: Text(
                                  url=="tm"?'Mary':"Мары",
                                  style: TextStyle(
                                    color: ThemeServices().theme ==
                                            ThemeMode.dark
                                        ? Colors.white
                                        : Colors.black26,
                                  ),
                                ),
                                value: 'Item 5',
                                onChanged: null),
                          ],
                        ),
                      );
                    });
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                padding: EdgeInsets.only(left: 15),
                margin:
                    EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 5),
                decoration: BoxDecoration(
                    color: ThemeServices().theme == ThemeMode.dark
                        ? Color.fromRGBO(55, 55, 55, 1)
                        : Color.fromRGBO(246, 246, 246, 1),
                    borderRadius: BorderRadius.circular(5)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Image.asset("asset/profile/map 3.png",width: 20,height: 20,
                          color: ThemeServices().theme == ThemeMode.dark
                              ? Color.fromRGBO(174, 174, 174, 1)
                              : Color.fromRGBO(41, 41, 41, 1)),
                    ),
                    Text(
                      widget.profi.saher,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: ThemeServices().theme == ThemeMode.dark
                              ? Color.fromRGBO(174, 174, 174, 1)
                              : Color.fromRGBO(41, 41, 41, 1)),
                    )
                  ],
                ),
              )),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Help(
                        appbartitle: widget.profi.komek,
                        contexttitle:
                            url=="tm"?"""Hormatly müşderi siz biziň PandaTm online platformamyzda islendik kategoriýalardaky harytlary tapyp bilersiňiz.
PandaTm online platformamyzda siz gijeki ýagdaýa geçirmek, islegiňize görä dil saýlamak we admin bilen dessine habarlaşmak ýaly mümkinçiliklerden peýdalanyp bilersiňiz.
PandaTm online platformamyzda harydy tapmagyň birnäçe görnüşleri bolup olar gözleg arkaly, ştrih kody arkaly we tötänleýin tapyp bilersiňiz. Siz tapan harydyňyz sargyt etmek üçin ol harydy sebede islän reňkiňize we ölçegiňize görä goşýaňyz. Soňra sebede geçip harytlaryň degişli bolan dükanlarynyň her biri bilen aýratynlykda Sargydy taýýarlaýaňyz hem-de sargyt edýäňiz we operatorymyzyň siziň sargydyňyzy şeýle-de maglumatlaryňyzy deňeşdirmek üçin etjek jaňyna garaşýaňyz! Sargyt tassyklanylandan soňra görkezilen wagtda sargydyňyz kurýerimiz tarapynda siziň bellän salgyňyza öz wagtynda eltip beriler. 
Hormatly Müşderi biziň PandaTm online platformamyzy saýlanyňyz üçin SAG BOLUŇ!!!
""" :"""Уважаемый ПОКУПАТЕЛЬ, на нашей онлайн-платформе PandaTm вы можете найти товары любых категории.
На нашей онлайн-платформе PandaTm вы можете воспользоваться такими опциями, как переключение в ночной режим, выбор языка по и прямую связь с администратором.
Есть несколько способов найти товар на нашей онлайн-платформе PandaTm: поиск, штрих-код и случайный выбор. Чтобы заказать найденный товар, добавьте его в корзину нужного цвета и размера. Затем вы переходите в корзину и оформляете заказ отдельно в каждом из магазинов, где находится товар и ждете пока вам позвонит наш оператор, чтобы сравнить ваш заказ и информацию! После подтверждения заказа ваш заказ будет доставлен по указанному вами адресу вовремя нашим курьером в указанное время.
Уважаемый покупатель, БЛАГОДАРИМ Вас за выбор нашей онлайн-платформы PandaTm!!!
"""   )));
            },
            child: setin(context, "asset/Setting/Help.svg", widget.profi.komek),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NewPassword(
                        url: widget.url,
                      )));
            },
            child: setin(
                context, "asset/Setting/Security.svg", widget.profi.gorag),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Help(
                      appbartitle: widget.profi.sert,
                      contexttitle:url=="tm"? """PandaTm online platformamyzda ähli dükanlaryň harytlaryny halka elektron internet üsti bilen görkezmek isleýäris. PandaTm online platformamyzyň şertleri:
1.Platformany ulanjak islendik müşderi bu ýerde agza bolmagy hökmanydyr.
2.Agza bolan islendik Müşderi ähli şertler bilen tanyşmaly.
3.PandaTm online platformamyzy ulanmak üçin agza bolan müşderi düzgünler bilen tanyşan diýip kabul edilýär.
4.PandaTm online platformamyzyň içinde edilen sargytlar we ýazyşylan hatlar ählisi saklanylýar.
5.Harytlar ähli degişli dükanlarda saklanýar.
6. Sargyt edilen harytlar töleg geçirilip kabul edilenden soňra yzyna alynmaýar.
7. Harytlara abatlygyna, kepillik möhletleriniň dolmadyklygyna dükanlaryň hut özleri kepil geçýär.
8. Saýtyň belli bir ýerinde, umumy düzgünler, şeýle hem degişli bölüme laýyk başga şertler-de bellenip biliner. Agzanyň hukuklary we borçlary  Saýt, ähli adamlaryň ulanmagy üçin açykdyr. Agza, Saýtdan peýdalanan döwründe Türkmenistanyň kanunçylygyna laýyklykda hereket etjekdigine borçlanýar. Agza, beýleki agzalaryň we zyýaratçylaryň saýty ulanmagyna päsgel beriji ýa-da agyrlaşdyryjy hereketlerine baş goşmaly däldir. Baş goşan ýagdaýynda sebäpli ýüze çykjak her bir hukuk we jerime jogapkärçiligini öz üstine kabul edilýär. PandaTm içinde, şeýle hem sosial ulgamlarda operator bilen ýazyşmalaryň göçürmesiniň saklanmagy agzalaryň jogapkärçiligindedir. Bu  PandaTm tarapyndan maslahat berilýär. Ýazyşmalaryň göçürmesi saklanmadyk ýagdaýynda, ýitmeginden ýa-da pozmazlygyndan  PandaTm jogapkär däldir. 
9.Agzalara, PandaTm tarapyndan saýta agza bolmagy bilen berilen ýa-da öz bellän agza ady, açar sözi ýaly maglumatlaryň ulanylmagyny, başga adamlara beren ýagdaýynda, açar sözüniň başga adamlar tarapyndan başga niýete ulanylmagyndan  Agza jogapkärdir. Şeýle-de, Agza, internet äleminde başganyň IP adresini, e-poçta adresini  we ulanyjy adyny ulanyp bilmeýändigi bilen birlikde, Agzalaryň şahsy maglumatlaryny rugsatsyz ulanyp bilmeýär. Ulanylan halatynda, ýüze çykjak ähli hukuk we jerime jogapkärçiliklerini Agza öz üstine alýar. 
10.Alynan maglumatlar we olaryň ulanylyşy  Saýtyň hyzmatlaryndan ulanýan döwrüňizde ýa-da saýtymyzda agza bolan ýagdaýyňyzda, size ýokary hilli hyzmat bermek üçin adyňyz, familiýaňyz, e-poçta adresiňiz, telefon belgiňiz, jynsyňyz, doglan güniňiz, eltip berme adresiňiz ýaly käbir şahsy maglumatlaryňyza zerurlyk ýüze çykýar. Saýtda alynan maglumatlar aşakdaky maksatlar üçin ulanylýar: Siziň hususy hasabyňyzy döretmek. Sargydy ýerine ýetirmek, tamamlamak we müşderimiz bilen aragatnaşyk saklamak. Sargytlar, hyzmatlar we arzanlaşyklar hakynda maglumat bermek. Müşderilermiziň söwda saýlawyny has gowy bilmek we olara teklip hödürlemek. 
 """:"""На нашей онлайн-платформе PandaTm мы хотим представить товары всех магазинов публике через электронную сеть. Условия нашей онлайн-платформы PandaTm:
1. Любой клиент, чтобы использовать платформу, должен быть ее участником.
2. Любой Клиент, который является участником, должен ознакомиться со всеми условиями.
3. Для использования нашей онлайн-платформы PandaTm считается, что клиент, который становится участником, ознакомился с правилами.
4. Все заказы и чаты с Админом на нашей онлайн-платформе PandaTm сохраняются.
5. Товар есть во всех соответствующих магазинах.
6. Заказанный товар не подлежит возврату после получения оплаты.
7. Только сами магазины гарантируют исправность товара и несоблюдение гарантийных условий.
8. В определенной части сайта могут быть указаны общие правила, а также иные условия согласно соответствующему разделу. Права и обязанности участников Сайт открыт для использования всеми. Участник обязуется действовать в соответствии с законодательством Туркменистана при использовании Сайта. Участник не должен участвовать в каком-либо поведении, которое мешает или усугубляет использование сайта другими участниками и паломниками. Любая юридическая и уголовная ответственность, вытекающая из участия, принимается на себя. Участник обязан хранить копию переписки с оператором в PandaTm, а также в социальных сетях. Это рекомендуется PandaTm. PandaTm не несет ответственности за любую потерю или повреждение корреспонденции в случае отсутствия копии.
9. Участник несет ответственность за использование информации, предоставленной PandaTm в качестве участника сайта или предоставленной участником, такой как имя пользователя, пароль и т. д. Кроме того, Участник не может использовать чужой IP-адрес, адрес электронной почты и имя пользователя в Интернете, а также не может использовать личную информацию Участника без разрешения. В случае такого использования Участник принимает на себя всю юридическую и уголовную ответственность, которая может возникнуть.
10. Собранная информация и ее использование Когда вы пользуетесь услугами сайта или становитесь участником нашего сайта, для предоставления вам качественного сервиса нам нужна некоторая личная информация, такая как ваше имя, фамилия, адрес электронной почты , номер телефона, пол, дата рождения и адрес доставки. Информация, собранная на сайте, используется для следующих целей: Создание личного кабинета. Выполнение заказов, выполнение и общение с нашими клиентами. Предоставление информации о заказах, услугах и скидках. Чтобы лучше понять покупательские предпочтения наших клиентов и предоставить им предложения.
""")));
            },
            child: setin(context, "asset/Setting/terms.svg", widget.profi.sert),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Help(
                      appbartitle: widget.profi.barad,
                      contexttitle: url=="tm"?""""Sizi PandaTm online platformasynda hoş gördük!!! 
Biz size uzakda bolan dükanlary eliňiziň aýasynda ýaly duýmaklyga kömek  bereris, ýagny islendik islän, halan harytlaryňyzy sargyt edip, islän wagtyňyzda öz gapyňyza çenli getirdip bilersiňiz. Şeýle-de bizde tölegleriň islendik görnüşinden peýdalanmak mümkinçiligiňiz bolar. Biziň esasy aladamyz siziň gymmatly wagtyňyzy tygşytlap, ony öz maşgalaňyz bilen geçirmegiňizdir. 
Siz PandaTm online platformasyny Google play marketda, IOS story-da we internet torunda (panda.com.tm) tapyp bilersiňiz. 
PandaTm siziň islegleriňizi we arzuwlaryňyzy gysga wagtda amala aşyrmak üçin döredilendir!!! 
Habarlaşmak üçin: Pandatm.delivery@gmail.com
""":"""Добро пожаловать на онлайн-платформе PandaTm!!!
Мы поможем вам почувствовать, что маркеты или рестораны вдали от васб находятся у вас под рукой, а это означает, что вы можете заказать любой товар, который вы хотите, и получить его к вашей двери в любое время. У вас также будет возможность использовать любую форму оплаты. Наша главная задача – сэкономить ваше драгоценное время и провести его с семьей.
Вы можете найти онлайн-платформу PandaTm на Google Play, IOS story и в Интернете (panda.com.tm).
PandaTm создана для того, чтобы ваши желания и мечты сбывались в кратчайшие сроки!!!
Контакт: Pandatm.delivery@gmail.com
""")));
            },
            child:
                setin(context, "asset/Setting/about.svg", widget.profi.barad),
          ),
          InkWell(
            onTap: () {
              Share.share('check out my website https://example.com');
            },
            child:
                setin(context, "asset/Setting/share.svg", widget.profi.paylas),
          )
        ],
      ),
    );
  }

  Future<dynamic> newDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) {
        return Container(
          width: 500,
          height: 150,
          child: SimpleDialog(
            backgroundColor: ThemeServices().theme == ThemeMode.dark
                ? Color.fromRGBO(39, 39, 39, 1)
                : Color.fromRGBO(250, 250, 250, 1),
            titlePadding: EdgeInsets.only(left: 17, top: 8, bottom: 8),
            // title: Text(ady),
            contentPadding: EdgeInsets.only(left: 17, top: 16, bottom: 10),
            children: [
              SimpleDialogOption(
                child: Container(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "Turkmençe",
                      style: TextStyle(
                          fontSize: 16,
                          color:url=="tm"?Colors.red: ThemeServices().theme == ThemeMode.dark
                              ? Color.fromRGBO(250, 250, 250, 1)
                              : Color.fromRGBO(41, 41, 41, 1)),
                    )),
                onPressed: () async {
                  await LanguageFileRead().then((value) {
                    if (value == "tm" || value == null) {
                      Navigator.pop(context);
                    } else {
                      url = "tm";
                      LanguageFileWrite('tm');
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MaterialPageMain()),
                        (Route<dynamic> route) => false,
                      );
                    }
                  });
                },
              ),
              SimpleDialogOption(
                child: Text(
                  "Pусский",
                  style: TextStyle(
                      fontSize: 16,
                      color:url=="ru"?Colors.red: ThemeServices().theme == ThemeMode.dark
                          ? Color.fromRGBO(250, 250, 250, 1)
                          : Color.fromRGBO(41, 41, 41, 1)),
                ),
                onPressed: () async {
                  await LanguageFileRead().then((value) {
                    if (value == "ru" || value == null) {
                      Navigator.pop(context);
                    } else {
                      url = "ru";
                      LanguageFileWrite('ru');
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MaterialPageMain()),
                        (Route<dynamic> route) => false,
                      );
                    }
                  });
                },
              ),
            ],
          ),
        );
      });

  setin(BuildContext context, String urlIcon, String textset) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      padding: EdgeInsets.only(left: 15),
      margin: EdgeInsets.only(top: 5, left: 15, right: 15, bottom: 5),
      decoration: BoxDecoration(
          color: ThemeServices().theme == ThemeMode.dark
              ? Color.fromRGBO(55, 55, 55, 1)
              : Color.fromRGBO(246, 246, 246, 1),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SvgPicture.asset(urlIcon,
                color: ThemeServices().theme == ThemeMode.dark
                    ? Color.fromRGBO(174, 174, 174, 1)
                    : Color.fromRGBO(41, 41, 41, 1)),
          ),
          Text(
            textset,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: ThemeServices().theme == ThemeMode.dark
                    ? Color.fromRGBO(174, 174, 174, 1)
                    : Color.fromRGBO(41, 41, 41, 1)),
          )
        ],
      ),
    );
  }
}
