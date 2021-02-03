import 'package:autolease/deepLinking.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import '../localization/constants.dart';
import '../main.dart';
import '../provider/product.dart';
import '../screens/booking.dart';
import '../screens/money.dart';
import '../screens/privacy.dart';
import '../screens/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/account.dart';
import 'package:share/share.dart';

String referalCode = 'My_Code';

removeToken(String arg) async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.remove(arg);
}

class Sidebar extends StatelessWidget {
  // final String number;
  // const Sidebar({Key key, this.number}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final car = Provider.of<Product>(context);
    // car.custId = 'number';
    Future<bool> msg() {
      return Fluttertoast.showToast(msg: 'the page is under construction');
    }

    Future<bool> _onBackPressed() {
      return showDialog(
            context: context,
            builder: (context) => new AlertDialog(
              title: new Text(getTranslated(context, 'are_you_sure')),
              content: new Text(getTranslated(context, 'do_you_want')),
              actions: <Widget>[
                new GestureDetector(
                  onTap: () => Navigator.of(context).pop(false),
                  child: Text(getTranslated(context, 'no')),
                ),
                SizedBox(height: 16),
                new GestureDetector(
                  onTap: () {},
                  child: Text(getTranslated(context, 'yes')),
                ),
              ],
            ),
          ) ??
          false;
    }

    Future<void> _showMyDialog() async {
      return showDialog<void>(
        context: context,
        // barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            // title: Text(' Title'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Do you want to logout'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                  onPressed: () {
                    removeToken('number');
                    removeToken('name');
                    removeToken('token');
                    removeToken('isUserLogin');
                    isuserLogin = false;
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Splash()));
                    // Navigator.pop(context);
                  },
                  child: Text('Yes'))
            ],
          );
        },
      );
    }

    // final car = Provider.of<Product>(context);
    final sidebar = Container(
      // color: Colors.white,
      // color: Colors.black87,
      decoration: BoxDecoration(
          color: Colors.green,
          image: DecorationImage(image: AssetImage('assets/background.png'))),
      child: Drawer(
        child: Container(
          // decoration: BoxDecoration(
          //   // color: Color(0xFF616161),

          //   // image: DecorationImage(
          //   //     image: AssetImage('assets/background.png'),
          //   //     fit: BoxFit.fill)
          // ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  stops: [0.5, 1],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Color(0xFF9BC5C3), Color(0xFF616161)])),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                // decoration: BoxDecoration(color: Colors.green[300]),
                // decoration: BoxDecoration(
                //     image: DecorationImage(
                //         image: AssetImage('assets/background.png'),
                //         fit: BoxFit.cover)),
                decoration: BoxDecoration(color: Color(0xFF616161)),
                // decoration: BoxDecoration(
                //     gradient: LinearGradient(
                //         stops: [0.5, 1],
                //         begin: Alignment.topLeft,
                //         end: Alignment.bottomRight,
                //         colors: <Color>[Color(0xFF9BC5C3), Color(0xFF616161)])),
                currentAccountPicture: Image.asset('assets/profile.png'),
                accountName: Text(Name ?? ''),
                accountEmail: Text(Number ?? ''),
              ),
              ListTile(
                tileColor: Colors.transparent,
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/fleet.png'),
                ),
                title: Text(getTranslated(context, 'fleet')),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => ProductOverViewScreen()),
                  // );
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/mybooking.png'),
                ),
                title: Text(getTranslated(context, 'my_booking')),
                onTap: () {
                  // msg();
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyBooking()),
                  );
                },
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/login.png'),
                ),
                title: Text(getTranslated(context, 'my_account')),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyAccount()),
                  );
                  // msg();
                },
              ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/money.png'),
                ),
                title: Text(getTranslated(context, 'money')),
                onTap: () {
                  // msg();
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Money()),
                  );
                },
              ),
              // ListTile(
              //   leading: CircleAvatar(
              //     backgroundColor: Colors.white,
              //     backgroundImage: AssetImage('assets/share.png'),
              //   ),
              //   title: Text(getTranslated(context, 'share')),
              //   onTap: () {
              //     msg();
              //     // Navigator.pop(context);
              //     // Navigator.push(
              //     //   context,
              //     //   MaterialPageRoute(builder: (context) => Share()),
              //     // );
              //   },
              // ),
              // ListTile(
              //   leading: CircleAvatar(
              //     backgroundColor: Colors.white,
              //     backgroundImage: AssetImage('assets/about.png'),
              //   ),
              //   title: Text(getTranslated(context, 'about')),
              //   onTap: () {
              //     msg();
              //     // Navigator.pop(context);
              //     // Navigator.push(
              //     //   context,
              //     //   MaterialPageRoute(builder: (context) => About()),
              //     // );
              //   },
              // ),
              // ListTile(
              //   leading: CircleAvatar(
              //     backgroundColor: Colors.white,
              //     backgroundImage: AssetImage('assets/terms.png'),
              //   ),
              //   title: Text(getTranslated(context, 'terms')),
              //   onTap: () {
              //     msg();
              //     // Navigator.pop(context);
              //     // Navigator.push(
              //     //   context,
              //     //   MaterialPageRoute(builder: (context) => Terms()),
              //     // );
              //   },
              // ),
              ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/privacy.png'),
                ),
                title: Text(getTranslated(context, 'privacy')),
                onTap: () {
                  // msg();
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Privacy()),
                  );
                },
              ),

              Visibility(
                visible: isuserLogin,
                child: Builder(builder: (BuildContext context) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      // backgroundImage: AssetImage('assets/privacy.png'),

                      child: Icon(
                        Icons.share,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
                    title: Text('Share'),
                    onTap: () {
                      // // msg();
                      // // Navigator.pop(context);
                      // // Share.share(
                      // //     'check out https://autoleasetest.page.link/aF8A');
                      // await Share.share(
                      //   'check out https://autoleasetest.page.link/aF8A',
                      //   subject: 'subject',
                      // );

                      Navigator.pop(context);
                      _onShare(context);
                    },
                  );
                }),
              ),

              // ListTile(
              //   leading: CircleAvatar(
              //     backgroundImage: AssetImage('assets/language.png'),
              //   ),
              //   title: Text('Language'),
              //   onTap: () {
              //     // Navigator.pop(context);
              //     // Navigator.push(
              //     //   context,
              //     //   MaterialPageRoute(builder: (context) => Language()),
              //     // );
              //   },
              // ),
              Visibility(
                visible: isuserLogin,
                child: ListTile(
                  leading: Icon(Icons.power_settings_new),
                  title: Text('Logout'),
                  onTap: () {
                    _showMyDialog();
                    // removeToken('number');
                    // removeToken('name');
                    // removeToken('token');
                    // removeToken('isUserLogin');
                    // isuserLogin = false;
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => Splash()));
                    // MaterialPageRoute(builder: (context) => MyApp());
                  },
                ),
              ),
              // ListTile(
              //   leading: Icon(Icons.power_settings_new),
              //   title: Text(getTranslated(context, 'logout')),
              //   onTap: () => _onBackPressed(),
              // ),
            ],
          ),
        ),
      ),
    );
    return sidebar;
  }
}

_onShare(BuildContext context) async {
  final RenderBox box = context.findRenderObject();
  await Share.share(myReferralUrl.toString(),
      subject: 'Share and earn',
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
}

Future<void> _createDynamicLink() async {
  final DynamicLinkParameters parameters = DynamicLinkParameters(
    uriPrefix: 'https://autoleasetest.page.link',
    link: Uri.parse('https://autoleasetest.page.link/$referalCode'),
    androidParameters: AndroidParameters(
      packageName: 'com.autoleaseuae.AutoLease',
      minimumVersion: 0,
    ),
    iosParameters: IosParameters(
      bundleId: 'com.autoleaseuaeios.AutoLease',
      minimumVersion: '1.0.0',
      // appStoreId: '123456789',
    ),
    dynamicLinkParametersOptions: DynamicLinkParametersOptions(
      shortDynamicLinkPathLength: ShortDynamicLinkPathLength.short,
    ),
  );
  final ShortDynamicLink shortLink = await parameters.buildShortLink();
  url = shortLink.shortUrl;
  print(url);
}
