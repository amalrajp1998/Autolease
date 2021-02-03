import 'package:shared_preferences/shared_preferences.dart';

import './localization/demo_localization.dart';
import './provider/bookingModel.dart';
import './provider/bookings.dart';
import './provider/product.dart';
import './screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import './screens/car_detail.dart';
import './provider/car_provider.dart';
import 'localization/constants.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

// String referalCode = "My-Code";
Uri myUrl;
bool fleetAnimation = true;
bool isuserLogin = false;
String dataPath;
String dataFull;
String refrealCodeRefered;
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(locale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // _createDynamicLink();
    initDynamicLinks();
  }

  void initDynamicLinks() async {
    FirebaseDynamicLinks.instance.onLink(
        onSuccess: (PendingDynamicLinkData dynamicLink) async {
      final Uri deepLink = dynamicLink?.link;
      if (deepLink != null) {
        // Navigator.pushNamed(context, deepLink.path);
        dataPath = deepLink.path;
        print(deepLink.authority);
        print(deepLink.data);
        print(deepLink.fragment);
        print(deepLink.host);
        print(deepLink.path.substring(1, deepLink.path.length));
        refrealCodeRefered = deepLink.path.substring(1, deepLink.path.length);
        setStrinrg('refrealCodeRefered', refrealCodeRefered);
        print(deepLink.query);
        print(deepLink.userInfo);
        print(deepLink.scheme);
        print(deepLink.queryParametersAll);
        print(deepLink.hasQuery);
      }
    }, onError: (OnLinkErrorException e) async {
      print('onLinkError');
      print(e.message);
    });
    final PendingDynamicLinkData data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri deepLink = data?.link;
    if (deepLink != null) {
      // Navigator.pushNamed(context, deepLink.path);
      dataPath = deepLink.path;
      print(deepLink.path.substring(1, deepLink.path.length));
      refrealCodeRefered = deepLink.path.substring(1, deepLink.path.length);
      setStrinrg('refrealCodeRefered', refrealCodeRefered);
      print(dataPath);
    }
  }

  Locale _locale;
  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  setStrinrg(String arg, String val) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(arg, val);
  }

  String token;
  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (_locale == null) {
      return Container(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    } else {
      return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (ctx) => CarProvider()),
            ChangeNotifierProvider(create: (context) => Product()),
            ChangeNotifierProvider(create: (ctx1) => Booking()),
            ChangeNotifierProvider(create: (ctx2) => Bookings())
          ],
          child: MaterialApp(
            theme: ThemeData(fontFamily: 'centurygothic'),
            locale: _locale,
            localizationsDelegates: [
              DemoLocalization.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              const Locale('en', 'US'),
              const Locale('ar', 'SA'),
            ],
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              for (var locale in supportedLocales) {
                if (locale.languageCode == deviceLocale.languageCode &&
                    locale.countryCode == deviceLocale.countryCode) {
                  return deviceLocale;
                }
              }
              return supportedLocales.first;
            },
            debugShowCheckedModeBanner: false,
            //title: 'AUTOLEASE',
            // theme: ThemeData(primarySwatch: Colors.blue),
            // home: Login(),
            // home: DeepLinking(),
            home: Splash(),
            routes: {
              DetailPage.routeName: (ctx) => DetailPage(),
            },
          ));
    }
  }
}
