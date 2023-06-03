
import 'dart:io';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';


import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:serpay/Categorya/Categoriya.dart';

import 'package:serpay/LogIn/LogIn/LogIn.dart';
import 'package:serpay/Database/checkSignUp.dart';
import 'package:serpay/MainPage/Product/Product.dart';


import 'package:serpay/Model/Colors.dart';
import 'package:serpay/Services/PostGetMe.dart';
import 'package:serpay/Profile/Profile/Profile.dart';
import 'package:serpay/Providers.dart';

import 'package:serpay/Sebet/Sebet/Sebet.dart';
import 'package:serpay/Servers/Servers.dart';
import 'package:serpay/darkMode/theme_services.dart';
import 'package:uni_links/uni_links.dart';


import 'Model/Language.dart';

import 'Model/RandomProduct.dart';

import 'Model/TextColor.dart';
import 'Ui/MainPage/MainPage.dart';

import 'Ui/MainPage/SkidkaProduct/Discount/DiscountProduct.dart';
import 'darkMode/theme_provider.dart';

import 'package:upgrader/upgrader.dart';
import 'language.dart';

setupHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(RandomProductAdapter());
  Hive.registerAdapter(ImagesAdapter());
  Hive.registerAdapter(ProductSizeAdapter());
  await Hive.openBox("tasks");
  await Hive.openBox("search");
  await Hive.openBox("carusel");
  // for (var element in taskbox.values) {
  //   // ignore: unrelated_type_equality_checks
  //   if(element.createAt!=DateTime.now().day){
  //     taskbox.delete(element.id);
  //   };
  // }
}

void main() async {
  HttpOverrides.global = MyHttpOverrids();
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await setupHive();


  runApp(
   ProviderScope(child: MaterialPageMain()),
  );
}

class MaterialPageMain extends ConsumerStatefulWidget {
  @override
  ConsumerState<MaterialPageMain> createState() => _MaterialPageMainState();
}

class _MaterialPageMainState extends ConsumerState<MaterialPageMain> {
  @override
  void initState() {


    // TODO: implement initState
    super.initState();
  }
  Widget build(BuildContext context) {




    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PandaTM',
      theme: MyThemes.lightTheme,

      darkTheme: MyThemes.darkTheme,
      themeMode: ThemeServices().theme,
      //themeMode: ThemeMode.system,

      home: UpgradeAlert(
        child: MyApp(

        ),
      ),
    );
  }
}

class MyApp extends ConsumerStatefulWidget {


  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  List hemmeSah = [];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _streamSubscription?.cancel();
  }
String url="";
  language()async{
    await LanguageFileRead().then((value) {
      url = value;
    });
  }
  Uri? _initialURI;
   Uri? _currentURI;
   Object? _err;
  bool _initialURILinkHandled = false;
  quit(String free,BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: ThemeServices().theme == ThemeMode.dark
                ? Color.fromRGBO(55, 55, 55, 1)
                : Color.fromRGBO(250, 250, 250, 1),
            title: Center(
                child: Text(
                  "Siz dostynyň uçin gatnasjakmy",
                  style: CustomTextStyle.quit(context),
                )),
            actions: [
              ButtonBar(
                buttonHeight: 40,
                buttonMinWidth: 115,
                alignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    // color: select.mainColo,
                    onPressed: () {
                      FreePro().fetchAlbum(free, context);
                      // FreeProductOwn().fetchAlbum(free,context);
                    },
                    child: Text("Hawa",style: TextStyle(color: Colors.red),),
                  ),
                  TextButton(
                    // color: select.mainColo,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Ýok",style: TextStyle(color: Colors.red),),
                  )
                ],
              )
            ],
          );
        });
  }
  late StreamSubscription _streamSubscription;
  Future<void> _initURIHandler() async {
    // 1
    if (!_initialURILinkHandled) {
      _initialURILinkHandled = true;
      // 2

      try {
        // 3
        final initialURI = await getInitialUri();
        // 4
        if (initialURI != null) {
          debugPrint("Initial URI received $initialURI");
          debugPrint(initialURI.toString().split("/product/").toString()+"sbegenc");

          if(initialURI.toString().split("/product/").length==2){

            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetails(productId: initialURI.toString().split("product")[1])));
          }
        else{
            await  CheckSignUp().dosyaOku().then((value) {

              if (value.toString().length == 4) {
                quit(initialURI.toString().split("sharinguser_id=")[1], context);
              }
              else{
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LogIn()));
              }
            });
          }
          if (!mounted) {
            return;
          }
          setState(() {
            _initialURI = initialURI;
          });
        } else {
          debugPrint("Null Initial URI received");
        }
      } on PlatformException { // 5
        debugPrint("Failed to receive initial uri");
      } on FormatException catch (err) { // 6
        if (!mounted) {
          return;
        }
        debugPrint('Malformed Initial URI received');
        setState(() => _err = err);
      }
    }
  }
  void _incomingLinkHandler() {
    // 1
    if (!kIsWeb) {
      // 2
      _streamSubscription = uriLinkStream.listen((Uri? uri) {
        if (!mounted) {
          return;
        }
        debugPrint('Received URI: $uri');
        setState(() {
          _currentURI = uri!;
          _err = null;
        });
        // 3
      }, onError: (Object err) {
        if (!mounted) {
          return;
        }
        debugPrint('Error occurred: $err');
        setState(() {
          _currentURI = null;
          if (err is FormatException) {
            _err = err;
          } else {
            _err = null;
          }
        });
      });
    }
  }
  // This widget is the root of your application.

late Future<LanguageModel> languageModel;
  @override
  void initState() {
    ref.read(CategoriyaPro.catPor.notifier).add();
    languageModel=Language().fetchAlbum(context);
    ref.read(CategoriyaPro.catPor.notifier).add();
    language();
    super.initState();
    _initURIHandler();
    _incomingLinkHandler();
    // _initialURI=null;

    checekpage();


  }
checekpage()async{
  Profile profile = Profile();
  MainPage sayfa1 = MainPage();
  Servers servers =  const Servers();
  Categoriya categoriya = const Categoriya();
  Cart sebet =  const Cart();
  LogIn logIn = const LogIn();
  hemmeSah = [sayfa1, servers, categoriya, sebet, logIn];
 await CheckSignUp().dosyaOku().then((value) {
    if (value.toString().length == 4) {
      debugPrint(value.toString());
      hemmeSah = [sayfa1, servers, categoriya, sebet, profile];
    } else {
      debugPrint(value.toString());
      hemmeSah = [sayfa1, servers, categoriya, logIn, logIn];
    }
  });
}
  int saylanan = 0;
  bool check = false;

  List iconBottomNavBar = [
    "asset/bottom_nav_icon/home_off.svg",
    "asset/bottom_nav_icon/serves_off.svg",
    "asset/bottom_nav_icon/categor_off.svg",
    "asset/bottom_nav_icon/cart_off.svg",
    "asset/bottom_nav_icon/profile_off.svg"
  ];
  List activeIconBottomNavBar = [
    "asset/Setting/logo.png",
    "asset/bottom_nav_icon/serves_on.svg",
    'asset/bottom_nav_icon/categor_on.svg',
    'asset/bottom_nav_icon/cart-icon.svg',
    'asset/bottom_nav_icon/profile_on.svg',
  ];

  @override
  Widget build(BuildContext context) {
debugPrint('${_currentURI?.host}'+"dsfdsfsdf");

    return FutureBuilder(
        future: languageModel,
        builder: (BuildContext context, AsyncSnapshot<LanguageModel> snapshot) {
          // debugPrint(snapshot.data.profile.toString());
          if(snapshot.hasData){
            return
              Scaffold(
                  resizeToAvoidBottomInset: true,
                  body: hemmeSah[saylanan]
                  ,
                  bottomNavigationBar: BottomNavigationBar(

                    selectedLabelStyle: TextStyle(
                        fontWeight: FontWeight.w800, fontSize: 12,color: ThemeServices().theme == ThemeMode.dark
                        ? Colors.white:Colors.black),
                    unselectedLabelStyle: TextStyle(color: ThemeServices().theme == ThemeMode.dark
                        ? Colors.white:Colors.black),
                    // showSelectedLabels: saylanan != 0 ? true : false,
                    showUnselectedLabels: true,
                    items: [
                      bottomNavBarMethod(saylanan != 0 ? snapshot.data!.home.toString():"PandaTm", activeIconBottomNavBar[0],
                          iconBottomNavBar[0], false),
                      bottomNavBarMethod(snapshot.data!.hyzmat.toString(), activeIconBottomNavBar[1],
                          iconBottomNavBar[1], true),
                      bottomNavBarMethod(snapshot.data!.kategoriya.toString(), activeIconBottomNavBar[2],
                          iconBottomNavBar[2], true),
                      bottomNavBarMethod(snapshot.data!.sebet.toString(), activeIconBottomNavBar[3],
                          iconBottomNavBar[3], true),
                      bottomNavBarMethod(snapshot.data!.profile.toString(), activeIconBottomNavBar[4],
                          iconBottomNavBar[4], true)
                    ],
                    fixedColor: ThemeServices().theme == ThemeMode.dark
                      ? Colors.red: Color.fromRGBO(55, 58, 64, 1),
                    type: BottomNavigationBarType.fixed,
                    currentIndex: saylanan,
                    onTap: ((index) {
                      setState(() {

                        saylanan = index;
                      });

                    }),
                  ));
          }
          else{
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          }
        });



  }

  BottomNavigationBarItem bottomNavBarMethod(
      String label, String activeicon, String iconBottom, bool chekc) {
    return BottomNavigationBarItem(

        activeIcon: chekc == true
            ? SvgPicture.asset(
                activeicon,
                width: 24,
                height: 24,
              )
            : Image.asset(
                activeicon,
                width: 30,
                height: 30,
              ),
        icon: SvgPicture.asset(
          iconBottom,
          width: 18,
          height: 18,
        ),
        label: label);
  }
}
