import 'dart:convert';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

import '../main.dart';
import '../provider/bookingModel.dart';
import '../screens/login.dart';
import '../screens/product_overview_screen.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../provider/car_provider.dart';
import '../provider/bookings.dart';
import '../provider/car_provider.dart';
import 'package:http/http.dart' as http;

String Token;
String Number;
String Name;
bool LoginState;
bool IsFirstLogin;
int AutoLeaseMoney;
bool Registered = false;
int userId;
String proofImageUrl;
String referalCode;
String myReferralUrl;
String poients = '0';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  double topv = 620;
  var _isInit = true;
  var _isLoading = false;
  var cr = Curves.bounceOut;
  int t = 2;
  @override
  initState() {
    getReferalCode();
    getLoginStatus();
    getName();
    getNumber();
    getToken();
    print('hello');
    super.initState();
    print(Token);
    getprefIsFirst();
    getPrefLogin();
    setPref('isFirstLogin', true);
    if (IsFirstLogin == true) {
      setPrefInt('autoLeaseMoney', 100);
    }
    getPrefInt('autoLeaseMoney');
    print(LoginState);
    Future.delayed(const Duration(milliseconds: 50), () {
      print('test');
      setState(() {
        topv = 250;
      });
    });
  }

  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      // Provider.of<Bookings>(context).fetchBooking().then((_) {
      Provider.of<CarProvider>(context).fetchProduct().then((_) {
        setState(() {
          _isLoading = false;
        });
        // Provider.of<Bookings>(context).fetchBooking();
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  getReg() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      Registered = pref.getBool('reg');
      return Registered;
    });
  }

  getToken() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      Token = preferences.getString('token');
      print(Token);
      return Token;
    });
  }

  getReferalCode() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      refrealCodeRefered = preferences.getString('refrealCodeRefered');
      print(refrealCodeRefered);
      return refrealCodeRefered;
    });
  }

  getLoginStatus() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      if (preferences.getBool('isUserLogin') == true) {
        isuserLogin = true;
      } else {
        isuserLogin = false;
      }

      print(Token);
      return Token;
    });
  }

  getName() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      Name = preferences.getString('name');
      print(Name);
      userId = preferences.getInt('userid');
      print(userId);
      return Name;
    });
  }

  getNumber() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      Number = preferences.getString('number');
      if (Number != null) {
        getUser();
      }
      print(Number);
      return Number;
    });
  }

  setToken(String arg, String val) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(arg, val);
  }

  Future<bool> getPrefLogin() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      LoginState = pref.getBool('LoginState');
    });
    LoginState = pref.getBool('LoginState');
    return pref.getBool('LoginState');
  }

  getprefIsFirst() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      IsFirstLogin = pref.getBool('isFirstLogin');
    });
    IsFirstLogin = pref.getBool('isFirstLogin');
  }

  setPref(String arg, bool val) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(arg, val);
  }

  setPrefInt(String arg, int val) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt(arg, val);
  }

  getPrefInt(String arg) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      AutoLeaseMoney = pref.getInt(arg);
    });
    AutoLeaseMoney = pref.getInt(arg);
  }

  void boun() {
    setState(() {
      cr = Curves.bounceOut;
      topv = 220;
    });
  }

  setUserid(int id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('userid', id);
  }

  Future<http.Response> getUser() async {
    print('--------Get user--------');
    final http.Response response2 = await http.get(
      'https://backend.autolease-uae.com/users/user?mobile=$Number',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + Token
      },
    );
    var decodemsg = json.decode(response2.body);
    var img = decodemsg['imageDetails'];
    print(img);
    print(decodemsg);
    print(response2.statusCode);
    // if (decodemsg['statusCode'] == '200') {
    setState(() {
      userId = decodemsg['id'];
      Name = decodemsg['firstName'];
      // setUserid(userId);
    });
    return response2;
  }

  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.grey[850],
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
        AnimatedPositioned(
          curve: cr,
          duration: Duration(seconds: t),
          left: (MediaQuery.of(context).size.width) * .32,
          bottom: topv,
          // top: 0,
          child: Image.asset(
            'assets/logo_e.png',
            height: 150,
            width: 150,
          ),
          onEnd: () {
            // if (token != '1') {
            //   Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) => ProductOverViewScreen()));
            //   // Navigator.push(
            //   //   context,
            //   //   MaterialPageRoute(builder: (context) => MapSample()),
            //   // );
            // } else {
            //   Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => Login()),
            //   );
            //   // Navigator.push(
            //   //   context,
            //   //   MaterialPageRoute(builder: (context) => MapSample()),
            //   // );
            // }
            // print('on end');

            // // boun();
            Navigator.push(
              context,
              // MaterialPageRoute(builder: (context) => Login()),
              // MaterialPageRoute(builder: (context) => Login()),
              MaterialPageRoute(builder: (context) => ProductOverViewScreen()),
            );
          },
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Material(
                  type: MaterialType.transparency,
                  child: Text('Powered By',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'centurygothic',
                          fontSize: 10,
                          letterSpacing: .5))),
              Material(
                  type: MaterialType.transparency,
                  child: Text('AutoLease Rent a Car',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'centurygothic',
                          fontSize: 15,
                          letterSpacing: .5)))
            ],
          ),
        )
      ],
    );
  }
}
