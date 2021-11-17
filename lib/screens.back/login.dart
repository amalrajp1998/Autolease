import '../provider/product.dart';
import '../screens/product_overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flare_flutter/flare_actor.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  @override
  initState() {
    // print('hello');
    Future.delayed(const Duration(microseconds: 3500), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => ProductOverViewScreen()));
      // print('test');
    });
    super.initState();
  }

  String phone;
  bool otpvald = false;
  bool chechc = false;
  @override
  Widget build(BuildContext context) {
    final car = Provider.of<Product>(context);
    return Scaffold(
      backgroundColor: Colors.grey[850],
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          FlareActor(
            "assets/animation.flr",
            alignment: Alignment.center,
            fit: BoxFit.cover,
            animation: "animation1",
          ),
        ],
      ),
    );
  }
}
