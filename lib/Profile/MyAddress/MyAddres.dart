import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:serpay/Profile/MyAddress/AddressModel/AddressGet.dart';
import 'package:serpay/Profile/MyAddress/AddressModel/deleteAdress.dart';
import 'package:serpay/Profile/MyAddress/setAdres.dart';

import '../../Language/Language.dart';
import '../../Model/TextColor.dart';
import '../../darkMode/theme_services.dart';
import 'address.dart';
import 'edit.dart';

class MyAddress extends StatelessWidget {
  List<Address> addres;
  ProfileDetails profi;
  String url;
  MyAddress({required this.addres,required this.url,required this.profi});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 180,
              child: ListView.builder(
                  itemCount: addres.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, proindex) {
                    return Container(
                      height: MediaQuery.of(context).size.height / 5,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(bottom: 15),
                      decoration: BoxDecoration(
                          borderRadius:
                          const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(
                              color: const Color.fromRGBO(174, 174, 174, 1),
                              width: 1)

                        //color: Color.fromRGBO(174, 174, 174, 1)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    addres[proindex].welayat,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color:ThemeServices().theme==ThemeMode.dark?Colors.white38: Color.fromRGBO(71, 71, 71, 1),
                                        fontSize: 18),
                                  ),
                                  DropdownButton(
                                    borderRadius: BorderRadius.circular(10),
                                    icon: Icon(Icons.dehaze_sharp),
                                    underline: DropdownButtonHideUnderline(
                                      child: Container(),
                                    ),
                                    items: [
                                      DropdownMenuItem(
                                          value: 'Edit',
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          EditAdress( addres: addres[proindex].address, id: addres[proindex].addressId, welayat:addres[proindex].welayat, url: url, profi: profi,)));
                                            },
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    right: 10,
                                                  ),
                                                  child: Icon(
                                                    Icons.edit,
                                                    size: 18,
                                                    color: Colors.black45,
                                                  ),
                                                ),
                                                Text(
                                                  profi.uytget,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.w400,
                                                      color:
                                                      Colors.black45),
                                                )
                                              ],
                                            ),
                                          )),
                                      DropdownMenuItem(
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                              deleteAdress(context,addres[proindex].addressId);
                                            },
                                            child: Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    right: 10,
                                                  ),
                                                  child: Icon(
                                                    Icons.delete,
                                                    size: 18,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                                Text(
                                                  profi.poz,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                      FontWeight.w400,
                                                      color: Colors.red),
                                                )
                                              ],
                                            ),
                                          ),
                                          value: 'Delete'),
                                    ],
                                    onChanged: (String? value) {},
                                    // onChanged: (val) {
                                    //   setState(() {
                                    //     _saylananTertip = val.toString();
                                    //
                                    //     // _refrest();
                                    //   });
                                    // },
                                    // value: _saylananTertip,
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              addres[proindex].address,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color:ThemeServices().theme==ThemeMode.dark?Color.fromRGBO(174, 174, 174, 1): Color.fromRGBO(71, 71, 71, 1)),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),

            ///button
            Container(
              margin: EdgeInsets.only(top: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: select.mainColo),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => AddAdress(url: url, profi: profi,)));
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:  [
                        Icon(Icons.add),
                        SizedBox(width: 10),
                        Text(
                          profi.addressAdd,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  /// su metody barla islanok
deleteAdress(BuildContext context,String Id,) {
    return showDialog(
        context: context,
        builder: (context)
     {
       return   AlertDialog(
         title: Text(url=="tm"?"Siz salgyňyzy oçürmekçimi?":"Вы хотите удалить свой адрес?"),

         // content: Text("Cykmak"),
actionsAlignment: MainAxisAlignment.center,
         actions: [
           Row(
             mainAxisAlignment: MainAxisAlignment.end,
             children: [
               TextButton(

                 style: TextButton.styleFrom(
                   primary: Colors.black,
                 ),
                 onPressed: () {
                   DeleteAddress().deleteAlbum(Id);
                   Navigator.pop(context);
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyAdressClass(url: url, profi: profi,)));
                 },

                 child: Text(
                   url=="tm"?"Hawa":"Да",
                   style: TextStyle(color: Colors.red, fontSize: 12),
                 ),
               ),
               Container(
                 child: TextButton(
                   onPressed: () {
                     Navigator.pop(context);
                     // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => Sceen()),
                     //       (Route<dynamic> route) => false,
                     // );
                   },
                   style: TextButton.styleFrom(
                     primary: Colors.black,
                   ),
                   child: Text(
                     url=="tm"?"Ýok":"нет",
                     style: TextStyle(color: Colors.red, fontSize: 12),
                   ),
                 ),
               ),
             ],
           )
         ],
       );
     }
    );
  }
}
