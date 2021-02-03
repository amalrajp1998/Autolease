import 'dart:io';
import '../localization/constants.dart';
import '../provider/product.dart';
import '../screens/product_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:pinput/pin_put/pin_put.dart';

// final height = size.height;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

final TextEditingController _pinPutController = TextEditingController();
final FocusNode _pinPutFocusNode = FocusNode();
var _color = Colors.white;
bool _incorrectotp = true;

class _LoginState extends State<Login> {
  void changeColor() {
    _color = Colors.red;
    _incorrectotp = false;
    setState(() {
      _color = Colors.red;
      _incorrectotp = false;
    });
  }

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: _color),
      borderRadius: BorderRadius.circular(15),
    );
  }

  bool _otp = false;
  var state = CrossFadeState.showFirst;
  void otpPress() {
    setState(() {
      state = CrossFadeState.showSecond;
    });
  }

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
              // color: Colors.black,
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                  color: Colors.black,
                  image: DecorationImage(
                      image: AssetImage("assets/bg.jpg"), fit: BoxFit.cover)),
              child: Container(
                // width: double.minPositive,
                height: double.infinity,
                // child: SingleChildScrollView(
                //   physics: AlwaysScrollableScrollPhysics(),
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
                        AnimatedCrossFade(
                          secondCurve: Curves.easeIn,
                          crossFadeState: state,
                          duration: Duration(seconds: 1),
                          firstChild: Container(
                            alignment: Alignment.centerLeft,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              border:
                                  Border.all(width: 1.0, color: Colors.white),
                            ),
                            height: 50.0,
                            // child: Visibility(
                            //   visible: _isVisible,
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
                                  hintText:
                                      getTranslated(context, 'enter_phone'),
                                  hintStyle: TextStyle(color: Colors.white),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                    ),
                                    onPressed: () {
                                      otpPress();
                                      // print('test');
                                    },
                                  )),
                            ),
                          ),
                          //OTP Sessions //
                          secondChild: Column(children: [
                            Visibility(
                              visible: _incorrectotp,
                              child: Text(
                                getTranslated(context, 'enter_otp'),
                                // that has been sent on your mobile number
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    letterSpacing: 1.5),
                              ),
                              replacement: Text(
                                getTranslated(context, 'wrong_otp'),
                                // that has been sent on your mobile number
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    letterSpacing: 1.5),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            PinPut(
                              fieldsAlignment: MainAxisAlignment.spaceEvenly,
                              textStyle: TextStyle(color: Colors.white),
                              fieldsCount: 4,
                              onSubmit: (String pin) => {
                                if (pin == "4321")
                                  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ProductOverViewScreen()),
                                    )
                                  }
                                else
                                  {
                                    _pinPutController.text = '',
                                    changeColor(),
                                    // print('noooooo'),
                                    Text('incorrect OTP')
                                  }
                              },
                              focusNode: _pinPutFocusNode,
                              controller: _pinPutController,
                              submittedFieldDecoration:
                                  _pinPutDecoration.copyWith(
                                borderRadius: BorderRadius.circular(
                                  15,
                                ),
                                border: Border.all(color: Colors.white),
                              ),
                              selectedFieldDecoration: _pinPutDecoration,
                              followingFieldDecoration:
                                  _pinPutDecoration.copyWith(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: _color.withOpacity(.5),
                                ),
                              ),
                            ),
                          ]),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Align(
                        alignment: FractionalOffset.bottomCenter,
                        child: MaterialButton(
                          onPressed: () => {},
                          child: Text(
                            getTranslated(context, 'quot1'),
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                letterSpacing: 1.5),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    )
                  ],
                ),
                // ),
              )),
        ));
  }
}
