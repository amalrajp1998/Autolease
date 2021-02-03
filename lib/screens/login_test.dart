import 'dart:io';

import '../provider/product.dart';
import '../screens/product_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class LoginTest extends StatefulWidget {
  @override
  _LoginTestState createState() => _LoginTestState();
}

class _LoginTestState extends State<LoginTest> {
  @override
  Widget build(BuildContext context) {
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

    final car = Provider.of<Product>(context);

    return WillPopScope(
        onWillPop: () => onWillPop(),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/bg2.jpg"), fit: BoxFit.cover)),
              child: Container(
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40,
                    // vertical: 90,
                  ),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 80,
                      ),
                      Image(
                        image: AssetImage('assets/logo.png'),
                        // height: 200,
                        width: 200,
                      ),
                      Text('AUTOLEASE',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              letterSpacing: 1.5)),
                      SizedBox(
                        height: 50.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Text(
                          //   'Phone no.',
                          // ),
                          Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              border:
                                  Border.all(width: 1.0, color: Colors.white),
                            ),
                            height: 50.0,
                            child: TextField(
                              keyboardType: TextInputType.phone,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: EdgeInsets.only(top: 14),
                                  prefixIcon: Icon(
                                    Icons.phone,
                                    color: Colors.white,
                                  ),
                                  hintText: 'Enter Phone Number',
                                  hintStyle: TextStyle(color: Colors.white),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      car.login = true;
                                      // print('Text');
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ProductOverViewScreen()),
                                      );
                                    },
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 300.0,
                          ),
                        ],
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'Get a Sanitized car delivered to your door step. Rent, Reccommend, earn points, rewards every time and redeme it for future retals',
                          // textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              letterSpacing: 1.5),
                        ),
                      )
                    ],
                  ),
                ),
              )),
        ));
  }
}
