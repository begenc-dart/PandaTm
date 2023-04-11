
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:serpay/Model/Colors.dart';
import 'package:serpay/Model/TextColor.dart';
import 'package:serpay/darkMode/theme_services.dart';

import '../../Language/Language.dart';
import '../../Profile/Profile/Help.dart';
import '../../Providers.dart';
import '../../Ui/toast.dart';
import '../NotOrderedProduct/AddOrder.dart';

class OrderProdut extends ConsumerStatefulWidget {
  String phone;
  String name;
String adress;
String sellerId;
String url;
  LanguageModel lan;
  int index;
  OrderProdut({required this.name, required this.phone,required this.adress,required this.sellerId,required this.lan,required this.url,required this.index});

  @override
  ConsumerState<OrderProdut> createState() {
    return _OrderProdutState();
  }
}

class _OrderProdutState extends ConsumerState<OrderProdut> {
  final _formkey = GlobalKey<FormState>();

  Colrs select = Colrs();
  bool check = false;
  late String _name, _phone, note;
  String? paymentType;
  int grvalue = 1;
int paymant=0;

  @override
  Widget build(BuildContext context) {
    debugPrint(widget.name);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ThemeServices().theme == ThemeMode.dark
            ? const Color.fromRGBO(39, 39, 39, 1)
            : const Color.fromRGBO(250, 250, 250, 1),
        title: Text(
          widget.lan.sargyt,
          style: CustomTextStyle.carAppBar(context),
        ),
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height-150,
            child: ListView(
              children: [
                Form(
                  key: _formkey,
                  autovalidateMode: AutovalidateMode.always,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 5),
                        child: Text(
                          widget.lan.ady,
                          style: CustomTextStyle.drowDown(context),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.top,
                          initialValue: widget.name,
                          // cursorColor: Color.fromRGBO(104, 109, 118, 1),

                          style: TextStyle(
                              fontSize: 18,
                              color: ThemeServices().theme == ThemeMode.dark
                                  ? Colors.white
                                  : const Color.fromRGBO(55, 55, 55, 1)),
                          decoration: InputDecoration(
                            fillColor: ThemeServices().theme == ThemeMode.dark
                                ? const Color.fromRGBO(55, 55, 55, 1)
                                : Colors.white,

                            // hintStyle:CustomTextStyle.fieldmax(context),
                            errorStyle: CustomTextStyle.error(context),
                            // hintText: "min",
                          ),
                          validator: (jog) {
                            if (jog!.length == 0) {
                              return "Adynyzy girizmani hayys edyarin";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (deger) => _name = deger!,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 5),
                        child: Text(
                          widget.lan.telef,
                          style: CustomTextStyle.drowDown(context),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 15),
                        child: TextFormField(
                          initialValue: widget.phone,
                          style: TextStyle(
                              fontSize: 18,
                              color: ThemeServices().theme == ThemeMode.dark
                                  ? Colors.white
                                  : const Color.fromRGBO(55, 55, 55, 1)),
                          textAlign: TextAlign.left,
                          textAlignVertical: TextAlignVertical.center,

                          // cursorColor: Color.fromRGBO(104, 109, 118, 1),
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            fillColor: ThemeServices().theme == ThemeMode.dark
                                ? const Color.fromRGBO(55, 55, 55, 1)
                                : Colors.white,

                            // hintStyle: CustomTextStyle.fieldmax(context),
                            errorStyle: CustomTextStyle.error(context),
                            // hintText: "max",
                          ),
                          validator: (jog) {
                            if (jog!.length == 0) {
                              return "Telefon belginizi girizmani hayys edyarin";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (deger) => _phone = deger!,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 5),
                        child: Text(
                          widget.lan.note,
                          style: CustomTextStyle.drowDown(context),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 15, right: 15, top: 15),
                        child: TextFormField(
                          minLines: 1,
                          maxLines: null,
                          style: TextStyle(
                              fontSize: 18,
                              color: ThemeServices().theme == ThemeMode.dark
                                  ? Colors.white
                                  : const Color.fromRGBO(55, 55, 55, 1)),
                          textAlign: TextAlign.left,
                          textAlignVertical: TextAlignVertical.center,

                          // cursorColor: Color.fromRGBO(104, 109, 118, 1),
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                            fillColor: ThemeServices().theme == ThemeMode.dark
                                ? const Color.fromRGBO(55, 55, 55, 1)
                                : Colors.white,

                            // hintStyle: CustomTextStyle.fieldmax(context),
                            errorStyle: CustomTextStyle.error(context),
                            // hintText: "max",
                          ),
                          // validator: (jog) {
                          //   if (jog!.length == 0) {
                          //     return "full";
                          //   } else {
                          //     return null;
                          //   }
                          // },
                          onSaved: (deger) => note = deger!,
                        ),
                      ),
                    ],
                  ),
                ),
                CheckboxListTile(
                  value: check,
                  activeColor: Colors.red,
                  onChanged: (value) {
                    check = value!;

                    setState(() {});
                  },
                  title: InkWell(
                    onTap: (){
                      Navigator.push(
                          context,MaterialPageRoute(
                          builder: (context) => Help(
                              appbartitle: widget.lan.profileDetails.barad,
                              contexttitle:  widget.url=="tm"?"""1.Eltip bermek hyzmaty Aşgabat şäher içinde amala aşyrylýar.
2. Sargyt 150 manatdan geçse ähli nokatlara mugt eltilýär, emma Sargyt 150 manada ýetmese, eltip beriş hyzmaty 15 manat bolýar. 
3.Sargytlar operator tarapyndan size jaň edip tassyklanylandan soňra kabul edilýär.
4.Sagat 19.00-dan edilen sargytlary ertesi 09.00-dan soňra tassyklanylýar.
5.Öz maglumatlaryňyzy doly we dürs girizmegiňiz harytlaryň öz wagtynda islän ýeriňize eltilmegi üçin möhümdir.
6.Haryt eltilmezinden öňürti size operator tarapyndan harydyň sargyt nomeri, umumy mukdary we tassyklaýyş kod ugradylar.
7.Tassyklaýyş kodyny isleg bildiren harydyňyzy eliňize alanyňyzdan soňra kurýerimize aýtmaly.
8.Ýalan söz,  ýalňyş berilen maglumatlar üçin jogapkärçilige çekilip bilersiňiz.
9.Operator bilen gürleşeniňizde ähli maglumatlar ýazdyrylyp saklanylýandyr.
10.Tölegi geçirilip eliňize alynan harytlaryňyz yzyna alynmaýar.
11.Harytlaryň kepilligini diňe harydy alan dükanyňyz geçýär.
12.Daşynda görkezilen düwmä basmagyňyz ýokarda agzalan ähli maglumatlar we şertler bilen tanyşandygyňyzy aňladýar.

Pandatm.delivery@gmail.com
""":"""1. Услуга доставки осуществляется в пределах города Ашхабада.
2. Если заказ превышает 150 манатов, доставка во все точки бесплатная, а если заказ меньше 150 манатов, то услуга доставки 15 манатов.
3. Заказы принимаются после подтверждения оператором по телефону.
4. Заказы, сделанные после 19:00, подтверждаются после 09:00 следующего дня.
5. Важно, чтобы вы ввели свои данные полностью и правильно, чтобы товар был доставлен в пункт назначения своевременно.
6. Перед доставкой товара оператор вышлет вам номер заказа, общую сумму и код подтверждения.
7. Код подтверждения необходимо сообщить нашему курьеру после получения желаемой покупки.
8. На вас могут подать в суд за ложную или вводящую в заблуждение информацию.
9. Вся информация сохраняется при разговоре с оператором.
10. Товар полученный после оплаты возврату не подлежит.
11. Продукты покрываются только вашим магазином покупки.
12. Нажав на кнопку выше, вы соглашаетесь со всеми условиями, упомянутыми выше.

Pandatm.delivery@gmail.com
"""
                          )));
                    },
                    child: Text(widget.lan.tanysdym,style: TextStyle(color: ThemeServices().theme == ThemeMode.dark
                        ?  Colors.red
                        :  Colors.red,decoration: TextDecoration.underline)),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 20),
                  child: Text(
                    widget.lan.eltip,
                    style: CustomTextStyle.drowDown(context),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 12, top: 15),
                      child: CupertinoSlidingSegmentedControl<int>(
                        backgroundColor:  ThemeServices().theme == ThemeMode.dark
                            ? const Color.fromRGBO(55, 55, 55, 1)
                            : Colors.white,
                        thumbColor: ThemeServices().theme == ThemeMode.dark
                            ? Colors.black12
                            : Colors.white,
                        children: {
                          1: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width / 2,
                              height: 36,
                              child: Text(
                                widget.lan.suGun,
                                style: TextStyle(fontSize: 14,color: ThemeServices().theme == ThemeMode.dark
                                    ?  Colors.white
                                    :  Colors.black),
                              )),
                          2: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width / 2,
                              height: 36,
                              child: Text(
                               widget.lan.ertir,
                                style: TextStyle(fontSize: 14,color: ThemeServices().theme == ThemeMode.dark
                                    ?  Colors.white
                                    :  Colors.black),
                              ))
                        },
                        onValueChanged: (int? value) {
                          setState(
                            () {
                              grvalue = value!;
                            },
                          );
                        },
                        groupValue: grvalue,
                      )),
                ),

                grvalue == 1 ? TimeToday() : Time(),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15, bottom: 5),
                  child: Text(
                    widget.lan.tleg,
                    style: CustomTextStyle.drowDown(context),
                  ),
                ),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(

                      onTap: (){
                        paymant=0;
                        setState(() {

                        });
                      },
                      child:type("asset/productIcon/Group 291 (1).svg",
                         widget.lan.nagtDal, 1,paymant == 0 ? Colors.redAccent : Colors.white,ThemeServices().theme == ThemeMode.dark
                              ? const Color.fromRGBO(250, 250, 250, 1)
                              : select.newCol)
                    ),
                    InkWell(onTap: (){
                      paymant=1;
                      setState(() {

                      });
                    },child:  type("asset/productIcon/Group 292.svg", widget.lan.nagt,
                        1,paymant == 1 ? Colors.redAccent : Colors.white,ThemeServices().theme == ThemeMode.dark
                            ? const Color.fromRGBO(250, 250, 250, 1)
                            : select.newCol),),
                   InkWell(
                     onTap: (){
                       // paymant=2;
                       // setState(() {
                       //
                       // });
                     },
                     child: Padding(padding: const EdgeInsets.only(bottom: 10),child:  type("asset/productIcon/Group 291.svg", widget.lan.online,
                         1, Colors.white,Colors.black45),)
                   )

                  ],
                ),

              ],
            ),

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              check==true?  Container(
                  width: MediaQuery.of(context).size.width *0.45,
                  height: 50,
                  //alignment: Alignment.center,

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
    ref
        .watch(PriceState.pricepro)[widget.index]<150?  ref
                            .watch(PriceState.pricepro)[widget.index]
                            .toString()+"+15": ref
        .watch(PriceState.pricepro)[widget.index]
        .toString(),
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87),
                      ),
                      const Text(
                        " TMT",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87),
                      ),
                    ],
                  )):Container(),
              InkWell(
                onTap: () {
                  check == true ?   checkVal():debugPrint("");
                },
                child: Container(
                  width:check==true?MediaQuery.of(context).size.width*0.45: MediaQuery.of(context).size.width*0.9,
                  height: 50,
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  decoration: BoxDecoration(
                      color: check == true &&wagt.isNotEmpty ? select.mainColo : Colors.black12,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    widget.lan.sarga,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: select.tmcolo),
                  ),
                ),
              ),

            ],
          ),
        ],
      ),

    );
  }

  DateTime now = DateTime.now();
  int timeCheck = 0;
  String wagt = '';

  TimeToday() {
    if (now.hour < 10) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 50,
            child: RadioListTile(
              activeColor: Colors.red,
              controlAffinity: ListTileControlAffinity.platform,
              contentPadding: const EdgeInsets.only(left: 5),
              value: "0 10:00-12:00",
              groupValue: wagt,
              onChanged: (deger) {
                setState(() {
                  timeCheck = 11;
                  wagt = deger.toString();
                });
              },
              title: const Text("10:00-12:00"),
            ),
          ),
          Container(
            height: 50,
            child: RadioListTile(activeColor: Colors.red,
              controlAffinity: ListTileControlAffinity.platform,
              contentPadding: const EdgeInsets.only(left: 5),
              value: "0 12:00-14:00",
              groupValue: wagt,
              onChanged: (deger) {
                setState(() {
                  timeCheck = 12;
                  wagt = deger.toString();
                });
              },
              title: const Text("12:00-14:00"),
            ),
          ),
          Container(
            height: 50,
            child: RadioListTile(activeColor: Colors.red,
              controlAffinity: ListTileControlAffinity.platform,
              contentPadding: const EdgeInsets.only(left: 5),
              value: "0 14:00-16:00",
              groupValue: wagt,
              onChanged: (deger) {
                setState(() {
                  timeCheck = 13;
                  wagt = deger.toString();
                });
              },
              title: const Text("14:00-16:00"),
            ),
          ),
          Container(
            height: 50,
            child: RadioListTile(activeColor: Colors.red,
              controlAffinity: ListTileControlAffinity.platform,
              contentPadding: const EdgeInsets.only(left: 5),
              value: "0 16:00-18:00",
              groupValue: wagt,
              onChanged: (deger) {
                setState(() {
                  timeCheck = 13;
                  wagt = deger.toString();
                });
              },
              title: const Text("16:00-18:00"),
            ),
          ),
          Container(
            height: 50,
            child: RadioListTile(activeColor: Colors.red,
              controlAffinity: ListTileControlAffinity.platform,
              contentPadding: const EdgeInsets.only(left: 5),
              value: "0 18:00-20:00",
              groupValue: wagt,
              onChanged: (deger) {
                setState(() {
                  timeCheck = 13;
                  wagt = deger.toString();
                });
              },
              title: const Text("18:00-20:00"),
            ),
          ),
        ],
      );
    } else if (now.hour < 12) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 50,
            child: RadioListTile(activeColor: Colors.red,
              controlAffinity: ListTileControlAffinity.platform,
              contentPadding: const EdgeInsets.only(left: 5),
              value: "0 ex",
              groupValue: wagt,
              onChanged: (deger) {
                setState(() {
                  timeCheck = 12;
                  wagt = deger.toString();
                });
              },
              subtitle: const Text("1 sagadyn dowmynda"),
              title: const Text("Express"),
            ),
          ),
          Container(
            height: 50,
            child: RadioListTile(activeColor: Colors.red,
              controlAffinity: ListTileControlAffinity.platform,
              contentPadding: const EdgeInsets.only(left: 5),
              value: "0 12:00-14:00",
              groupValue: wagt,
              onChanged: (deger) {
                setState(() {
                  timeCheck = 12;
                  wagt = deger.toString();
                });
              },
              title: const Text("12:00-14:00"),
            ),
          ),
          Container(
            height: 50,
            child: RadioListTile(activeColor: Colors.red,
              controlAffinity: ListTileControlAffinity.platform,
              contentPadding: const EdgeInsets.only(left: 5),
              value: "0 14:00-16:00",
              groupValue: wagt,
              onChanged: (deger) {
                setState(() {
                  timeCheck = 13;
                  wagt = deger.toString();
                });
              },
              title: const Text("14:00-16:00"),
            ),
          ),
          Container(
            height: 50,
            child: RadioListTile(activeColor: Colors.red,
              controlAffinity: ListTileControlAffinity.platform,
              contentPadding: const EdgeInsets.only(left: 5),
              value: "0 16:00-18:00",
              groupValue: wagt,
              onChanged: (deger) {
                setState(() {
                  timeCheck = 13;
                  wagt = deger.toString();
                });
              },
              title: const Text("16:00-18:00"),
            ),
          ),
          Container(
            height: 50,
            child: RadioListTile(activeColor: Colors.red,
              controlAffinity: ListTileControlAffinity.platform,
              contentPadding: const EdgeInsets.only(left: 5),
              value: "0 18:00-20:00",
              groupValue: wagt,
              onChanged: (deger) {
                setState(() {
                  timeCheck = 13;
                  wagt = deger.toString();
                });
              },
              title: const Text("18:00-20:00"),
            ),
          ),
        ],
      );
    } else if (now.hour < 14) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 50,
            child: RadioListTile(activeColor: Colors.red,
              controlAffinity: ListTileControlAffinity.platform,
              contentPadding: const EdgeInsets.only(left: 5),
              value: "0 ex",
              groupValue: wagt,
              onChanged: (deger) {
                setState(() {
                  timeCheck = 12;
                  wagt = deger.toString();
                });
              },
              subtitle: const Text("1 sagadyn dowmynda"),
              title: const Text("Express"),
            ),
          ),
          Container(
            height: 50,
            child: RadioListTile(activeColor: Colors.red,
              controlAffinity: ListTileControlAffinity.platform,
              contentPadding: const EdgeInsets.only(left: 5),
              value: "0 14:00-16:00",
              groupValue: wagt,
              onChanged: (deger) {
                setState(() {
                  timeCheck = 13;
                  wagt = deger.toString();
                });
              },
              title: const Text("14:00-16:00"),
            ),
          ),
          Container(
            height: 50,
            child: RadioListTile(activeColor: Colors.red,
              controlAffinity: ListTileControlAffinity.platform,
              contentPadding: const EdgeInsets.only(left: 5),
              value: "0 16:00-18:00",
              groupValue: wagt,
              onChanged: (deger) {
                setState(() {
                  timeCheck = 13;
                  wagt = deger.toString();
                });
              },
              title: const Text("16:00-18:00"),
            ),
          ),
          Container(
            height: 50,
            child: RadioListTile(activeColor: Colors.red,
              controlAffinity: ListTileControlAffinity.platform,
              contentPadding: const EdgeInsets.only(left: 5),
              value: "0 18:00-20:00",
              groupValue: wagt,
              onChanged: (deger) {
                setState(() {
                  timeCheck = 13;
                  wagt = deger.toString();
                });
              },
              title: const Text("18:00-20:00"),
            ),
          ),
        ],
      );
    } else if (now.hour < 16) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 50,
            child: RadioListTile(activeColor: Colors.red,
              controlAffinity: ListTileControlAffinity.platform,
              contentPadding: const EdgeInsets.only(left: 5),
              value: "0 ex",
              groupValue: wagt,
              onChanged: (deger) {
                setState(() {
                  timeCheck = 12;
                  wagt = deger.toString();
                });
              },
              subtitle: const Text("1 sagadyn dowmynda"),
              title: const Text("Express"),
            ),
          ),
          Container(
            height: 50,
            child: RadioListTile(activeColor: Colors.red,
              controlAffinity: ListTileControlAffinity.platform,
              contentPadding: const EdgeInsets.only(left: 5),
              value: "0 16:00-18:00",
              groupValue: wagt,
              onChanged: (deger) {
                setState(() {
                  timeCheck = 13;
                  wagt = deger.toString();
                });
              },
              title: const Text("16:00-18:00"),
            ),
          ),
          Container(
            height: 50,
            child: RadioListTile(activeColor: Colors.red,
              controlAffinity: ListTileControlAffinity.platform,
              contentPadding: const EdgeInsets.only(left: 5),
              value: "0 18:00-20:00",
              groupValue: wagt,
              onChanged: (deger) {
                setState(() {
                  timeCheck = 13;
                  wagt = deger.toString();
                });
              },
              title: const Text("18:00-20:00"),
            ),
          ),
        ],
      );
    } else if (now.hour < 18) {
      return RadioListTile(activeColor: Colors.red,
        contentPadding: const EdgeInsets.only(left: 5),
        value: "0 18:00-20:00",
        groupValue: wagt,
        onChanged: (deger) {
          setState(() {
            timeCheck = 13;
            wagt = deger.toString();
          });
        },
        title: const Text("18:00-20:00"),
      );
    } else if (now.hour >= 18) {
      return Container(
        padding: const EdgeInsets.only(bottom: 20),
      );
    }
  }

  Time() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 50,
          child: RadioListTile(activeColor: Colors.red,
            contentPadding: const EdgeInsets.only(
              left: 5,
            ),
            value: "1 10:00-12:00",
            groupValue: wagt,
            onChanged: (deger) {
              setState(() {
                timeCheck = 21;
                wagt = deger.toString();
              });
            },
            title: const Text("10:00-12:00"),
          ),
        ),
        Container(
          height: 50,
          child: RadioListTile(activeColor: Colors.red,
            contentPadding: const EdgeInsets.only(
              left: 5,
            ),
            value: "1 12:00-14:00",
            groupValue: wagt,
            onChanged: (deger) {
              setState(() {
                timeCheck = 22;
                wagt = deger.toString();
              });
            },
            title: const Text("12:00-14:00"),
          ),
        ),
        Container(
          height: 50,
          child: RadioListTile(activeColor: Colors.red,
            controlAffinity: ListTileControlAffinity.platform,
            contentPadding: const EdgeInsets.only(left: 5),
            value: "1 14:00-16:00",
            groupValue: wagt,
            onChanged: (deger) {
              setState(() {
                timeCheck = 23;
                wagt = deger.toString();
              });
            },
            title: const Text("14:00-16:00"),
          ),
        ),
        Container(
          height: 50,
          child: RadioListTile(activeColor: Colors.red,
            controlAffinity: ListTileControlAffinity.platform,
            contentPadding: const EdgeInsets.only(left: 5),
            value: "1 16:00-18:00",
            groupValue: wagt,
            onChanged: (deger) {
              setState(() {
                timeCheck = 23;
                wagt = deger.toString();
              });
            },
            title: const Text("16:00-18:00"),
          ),
        ),
        Container(
          height: 50,
          child: RadioListTile(activeColor: Colors.red,
            controlAffinity: ListTileControlAffinity.platform,
            contentPadding: const EdgeInsets.only(left: 5),
            value: "1 18:00-20:00",
            groupValue: wagt,
            onChanged: (deger) {
              setState(() {
                timeCheck = 23;
                wagt = deger.toString();
              });
            },
            title: const Text("18:00-20:00"),
          ),
        ),
      ],
    );
  }

  checkVal() {
    if (_formkey.currentState!.validate()) {
      _formkey.currentState!.save();
     wagt.isEmpty?Toast().showToastDelet(context, "Wagty saylamagynyzy sizden haýyş edýärin"): AddOrder()
          .createUser(widget.adress, paymant==0?"Nagt dal":paymant==1?"Nagt":"Online", wagt, context, _phone, note,_name,widget.sellerId,widget.url);
      // Navigator.pop(context, [_name, _phone, note, timeCheck]);
    }
  }

  type(String icon, String text, int check,Color colorl, Color colorText) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      margin: const EdgeInsets.only(left: 15, right: 15, top: 10),
      decoration: BoxDecoration(
          color: ThemeServices().theme == ThemeMode.dark
              ? const Color.fromRGBO(55, 55, 55, 1)
              : const Color.fromRGBO(255, 255, 255, 1),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: colorl),
          boxShadow: [
            BoxShadow(
                blurRadius: 25,
                spreadRadius: -5,
                offset: Offset.fromDirection(0, 16),
                color: const Color.fromRGBO(0, 0, 0, 0.05)),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(icon),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              text,
              style: TextStyle(
                  color: colorText,
                  fontSize: 15,
                  fontWeight: FontWeight.w500
              ),
            ),
          ),
        ],
      ),
    );
  }
}
