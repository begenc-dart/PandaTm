import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';

import 'package:serpay/MainPage/MainChangeNoti.dart';

import 'package:serpay/Model/TextColor.dart';

import 'package:serpay/Search/Search/Related/Realted.dart';
import 'package:serpay/Search/Search/SliverGrid/SliverGrid.dart';
import 'package:serpay/Search/Search/Suggestion/Suggestion.dart';
import 'package:serpay/darkMode/theme_services.dart';

import '../../Model/Language.dart';
import '../../Model/Colors.dart';
import '../SearchRelated.dart';
import '../SearchRelatedModel.dart';
import '../Suggestion.dart';


class CustomSearchDelegate extends SearchDelegate {
  String text;
  bool checkBarcode=true;
  BuildContext contexpro;
  LanguageModel data;
  CustomSearchDelegate(
      {required this.checkBarcode,
      required this.text,
      required this.contexpro,required this.data}): super(
    searchFieldLabel: "",
    keyboardType: TextInputType.text,
    textInputAction: TextInputAction.search,
    searchFieldStyle: TextStyle(
        color: Color.fromRGBO(153, 153, 153, 1),
        fontWeight: FontWeight.bold),
  ){
    debugPrint(text.toString()+"dfjfdi");
    query = text; showResults(contexpro);
  }

  Colrs select = Colrs();

  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: ThemeServices().theme == ThemeMode.dark
          ? Color.fromRGBO(39, 39, 39, 1)
          : Color.fromRGBO(250, 250, 250, 1),
      canvasColor: select.tmcolo,
      textTheme: TextTheme(
        // Use this to change the query's text style
        headline6: CustomTextStyle.searchHintStyle(context),
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        iconTheme: IconThemeData(
            color: ThemeServices().theme == ThemeMode.dark
                ? Color.fromRGBO(174, 174, 174, 1)
                : select.searchResCol),
        backgroundColor: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(39, 39, 39, 1)
            : select.tmcolo,
      ),
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: EdgeInsets.all(15),
        focusColor: Color.fromRGBO(153, 153, 153, 1),

        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        filled: true,
        fillColor: ThemeServices().theme == ThemeMode.dark
            ? Color.fromRGBO(55, 55, 55, 1)
            : select.searh,

        // Use this change the placeholder's text style
        hintStyle: CustomTextStyle.searchHintStyle(context),
      ),
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.red),
    );
  }

  bool check = false;

  // Demo list to show quering

  // first overrite to clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.close),
      )
    ];
  }

  // second overrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {


    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(
        Icons.arrow_back,
        color: ThemeServices().theme == ThemeMode.dark
            ? select.searh
            : select.recColor,
      ),
    );
  }
int a=0;
  // third overrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    a+=1;
    check = true;
    a==1?Hive.box("search").length<9?
    Hive.box("search").add(query):{Hive.box("search").add(query),Hive.box("search").deleteAt(0)}:"";
    return ProductGrid(
      keys: query,
      sort: 0, data: data,
    );
  }

  // last overrite to show the
  // quering process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {

    check = false;

    return query.length == 0
        ?
    StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return FutureBuilder(
              future: Search_related().fetchAlbum(),
              builder:
                  (context, AsyncSnapshot<List<SearchReatedModel>> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 15, top: 15, ),
                            child: Text(data.taryhyn,
                                style: CustomTextStyle.history(context)),
                          ),
                          GestureDetector(
                            onTap: () {
                              Hive.box("search").clear();
setState((){});
                            },
                            child:  Padding(
                              padding:
                              EdgeInsets.only(right: 15, top: 15, bottom: 20),
                              child: Text(data.arassa.toString(),
                                  style:
                                  TextStyle(color: Colors.red, fontSize: 16)),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height*0.18,
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 180, childAspectRatio: 3),
                          itemBuilder: (BuildContext context, index) {
                            return InkWell(
                              onTap: () {
                                query = Hive.box("search").getAt(index);
                                showResults(context);
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: 15, right: 15, bottom: 10,top: 10),
                                decoration: BoxDecoration(
                                    color: ThemeServices().theme == ThemeMode.dark
                                        ? Color.fromRGBO(55, 55, 55, 1)
                                        : select.searh,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                        "asset/icon/history-icon.svg"),
                                    Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Text(Hive.box("search").getAt(index),
                                            style: CustomTextStyle
                                                .searchHintStyletext(context))),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: Hive.box("search").length,
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 15, top: 15, bottom: 20),
                        child: Text(data.teklipleri,
                            style: CustomTextStyle.history(context)),
                      ),
                      Container(
                        height: snapshot.data!.length * 20,
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 150, childAspectRatio: 3),
                          itemBuilder: (BuildContext context, index) {
                            // var result = matchQuery[index];
                            return InkWell(
                              onTap: () {
                                query = snapshot.data![index].name.toString();
                                showResults(context);
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: 15, right: 15, bottom: 18),
                                decoration: BoxDecoration(
                                    color: ThemeServices().theme == ThemeMode.dark
                                        ? Color.fromRGBO(55, 55, 55, 1)
                                        : select.searh,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        snapshot.data![index].name.toString(),
                                        style:
                                        CustomTextStyle.searchHintStyletext(
                                            context),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: snapshot.data!.length,
                        ),
                      ),
                    ],
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              });
        })


        : FutureBuilder(
            future: SuggestionGet().fetchAlbum(query),
            builder: (context, AsyncSnapshot<List<String>> data) {
              if (data.hasData) {
                return ListView.builder(
                  itemBuilder: (BuildContext, index) {
                    return InkWell(
                      onTap: () {
                        query = data.data![index];
                        showResults(context);
                      },
                      child: ListTile(
                        leading: Icon(Icons.search,
                            color: ThemeServices().theme == ThemeMode.dark
                                ? Color.fromRGBO(220, 220, 220, 1)
                                : select.searchResCol),
                        title: Text(data.data![index],
                            style: CustomTextStyle.searchres(context)),
                      ),
                    );
                  },
                  itemCount: data.data!.length,
                  padding: EdgeInsets.all(5),
                );
              } else {
                return Center(child: const CircularProgressIndicator());
              }
            });
    // return Related();
  }
}
