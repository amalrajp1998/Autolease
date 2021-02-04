import 'dart:convert';
import 'dart:io';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

import '../localization/constants.dart';
import '../provider/bookings.dart';
import '../provider/language_list.dart';
import '../screens/fleet_design.dart';
import '../screens/splash.dart';
import '../widgets/language.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/sidebar.dart';
import 'package:provider/provider.dart';
import '../provider/car_provider.dart';
import '../main.dart';
import 'package:http/http.dart' as http;

String tokeng;
String myReferralCode;
DateTime currentBackPressTime;
String id;
enum Filter {
  Fav,
  All,
}

class ProductOverViewScreen extends StatefulWidget {
  @override
  _ProductOverViewScreenState createState() => _ProductOverViewScreenState();
}

class _ProductOverViewScreenState extends State<ProductOverViewScreen> {
  void _changeLanguage(Language language) {
    print(language.languageCode);
    Locale _temp;
    switch (language.languageCode) {
      case 'en':
        _temp = Locale(language.languageCode, 'US');
        break;
      case 'ar':
        _temp = Locale(language.languageCode, 'SA');
        break;
    }
    MyApp.setLocale(context, _temp);
  }

  // var _isInit = true;
  // var _isLoading = false;
  bool fleet = false;
  bool animation = true;
  bool text1 = true;
  bool text = false;

  @override
  void initState() {
    if (Number != null) {
      getUser()
          .then((value) => _createDynamicLink().then((value) => getPoients()));
    }

    if (fleetAnimation == true) {
      fleetAnimation = false;
      // didChangeDependencies();
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          text = true;
        });
      });
      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          fleet = true;
          text1 = false;
        });
      });
      Future.delayed(const Duration(milliseconds: 3800), () {
        setState(() {
          text = false;
        });
      });
      getNumber();
    } else {
      setState(() {
        fleet = true;
        text = false;
        animation = false;
        text1 = false;
      });
    }

    super.initState();
  }

////////////get user details////////
  Future<http.Response> getUser() async {
    print('--------Get user--------');
    final http.Response response2 = await http.get(
      'https://autolease.em2.in/autolease/users/user?mobile=$Number',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + Token
      },
    );
    var decodemsg = json.decode(response2.body);
    print(decodemsg);
    print(response2.statusCode);
    // if (decodemsg['statusCode'] == '200') {
    print('----success-----');
    userId = decodemsg['id'];
    myReferralCode = decodemsg['referralCode'];
    print(myReferralCode);
    setState(() {
      Name = decodemsg['firstName'];
    });
    print(decodemsg['firstName']);
    print(decodemsg['lastName']);
    print(decodemsg['userEmail']);
    return response2;
    // } else {}
    // return response2;
  }

  //get poients//
  Future<http.Response> getPoients() async {
    final http.Response resp = await http.get(
        'https://admin.autolease-uae.com/userPoints/{customerId}?customerId=$userId',
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + Token
        });
    var decodemsg = json.decode(resp.body);
    poients = decodemsg.toString();
    print(decodemsg);
    return resp;
  }

  bool isFirst = true;

  @override
  void didChangeDependencies() {
    if (isFirst) {
      Provider.of<Bookings>(context).fetchBooking();
      isFirst = false;
    }
    super.didChangeDependencies();
  }

  String number;
  getNumber() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    number = preferences.getString('number') ?? 'Phone number';
  }

  final options = LiveOptions(
    delay: Duration(microseconds: 90),
    showItemInterval: Duration(milliseconds: 100),
    showItemDuration: Duration(seconds: 1),
    visibleFraction: 0.05,
    reAnimateOnVisibility: true,
  );
  Widget build(BuildContext context) {
    final productFilter = Provider.of<CarProvider>(context, listen: false);
    final carData = Provider.of<CarProvider>(context);
    final cars = carData.items;

    Future<bool> onWillPop() {
      DateTime now = DateTime.now();
      if (currentBackPressTime == null ||
          now.difference(currentBackPressTime) > Duration(seconds: 2)) {
        currentBackPressTime = now;
        Fluttertoast.showToast(msg: 'Press Again to Exit');
        return Future.value(false);
      }
      exit(0);
      return Future.value(true);
    }

    Widget buildAnimatedItem(
      ctx,
      i,
      Animation<double> animation,
    ) =>
        ChangeNotifierProvider.value(
            value: cars[i],
            child: FadeTransition(
              opacity: Tween<double>(
                begin: 0,
                end: 1,
              ).animate(animation),
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: Offset(0, -0.1),
                  end: Offset.zero,
                ).animate(animation),
                child: FleetDesign(),
              ),
            ));

    return Stack(children: [
      Visibility(
        visible: fleet,
        child: WillPopScope(
          onWillPop: onWillPop,
          child: Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
              flexibleSpace: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        stops: [0.5, 1],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: <Color>[Color(0xFF9BC5C3), Color(0xFF616161)])),
              ),
              title: Text(
                getTranslated(context, 'fleet_title'),
                style: TextStyle(fontSize: 18, fontFamily: 'centurygothic'),
              ),
              actions: <Widget>[
                Lng(),
                PopupMenuButton(
                  onSelected: (Filter selectedValue) {
                    print(selectedValue);
                    if (selectedValue == Filter.Fav) {
                      productFilter.showfav();
                    } else {
                      productFilter.showall();
                    }
                  },
                  icon: Icon(Icons.more_vert),
                  itemBuilder: (_) => [
                    PopupMenuItem(
                        child: Text('favourite Only'), value: Filter.Fav),
                    PopupMenuItem(child: Text('Show All'), value: Filter.All)
                  ],
                )
              ],
              backgroundColor: Colors.grey[700],
            ),
            drawer: Sidebar(),
            body: LiveList.options(
              separatorBuilder: (BuildContext context, int index) => Divider(
                indent: 0,
                thickness: 0,
                color: Colors.grey[300],
              ),
              padding: EdgeInsets.all(10),
              options: options,
              itemBuilder: buildAnimatedItem,
              scrollDirection: Axis.vertical,
              itemCount: cars.length,
            ),
          ),
        ),
      ),
      Visibility(
        visible: !fleet,
        child: Container(
          color: Colors.grey[850],
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
      ),
      Visibility(
        visible: animation,
        child: FlareActor(
          "assets/animation1.flr",
          alignment: Alignment.center,
          fit: BoxFit.fill,
          animation: "animation1",
          callback: (_) {
            print('animation over');
            setState(() {
              animation = false;
            });
          },
        ),
      ),
      Visibility(
        visible: text,
        child: Visibility(
          visible: text1,
          child: Padding(
            padding: EdgeInsets.all(55),
            child: Material(
              type: MaterialType.transparency,
              child: Text(
                getTranslated(context, 'splash'),
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'centurygothic',
                    fontSize: 45),
              ),
            ),
          ),
          replacement: Padding(
            padding: EdgeInsets.all(55),
            child: Material(
              type: MaterialType.transparency,
              child: Text(
                getTranslated(context, 'quot'),
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'centurygothic',
                    fontSize: 35),
              ),
            ),
          ),
        ),
      ),
      Visibility(
          visible: text,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Material(
                type: MaterialType.transparency,
                child: Text(
                  'AutoLease Rent A Car',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'centurygothic',
                      fontSize: 15,
                      letterSpacing: .5),
                )),
          ))
    ]);
  }
}

Future<void> _createDynamicLink() async {
  final DynamicLinkParameters parameters = DynamicLinkParameters(
    uriPrefix: 'https://autoleasetest.page.link',
    link: Uri.parse('https://autoleasetest.page.link/$myReferralCode'),
    // link: Uri.parse('https://autoleasetest.page.link'),
    androidParameters: AndroidParameters(
      packageName: 'com.autoleaseuae.AutoLease',
      minimumVersion: 0,
    ),
    iosParameters: IosParameters(
      bundleId: 'com.autoleaseuaeios.AutoLease',
      minimumVersion: '1.0.0',
      appStoreId: '962194608',
    ),
    dynamicLinkParametersOptions: DynamicLinkParametersOptions(
      shortDynamicLinkPathLength: ShortDynamicLinkPathLength.short,
    ),
  );
  final ShortDynamicLink shortLink = await parameters.buildShortLink();
  myUrl = shortLink.shortUrl;
  myReferralUrl = myUrl.toString();
  print(myUrl);
}
