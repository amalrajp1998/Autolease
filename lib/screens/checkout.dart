import 'package:flutter/material.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: Text('Chechout'), backgroundColor: Colors.black87),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Container(
          //     color: Colors.green[100],
          //     alignment: Alignment(0, 5),
          //     margin: EdgeInsets.only(left: 20, right: 20, top: 10),
          //     child: Text(
          //       'CHECKOUT',
          //       style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          //     )),
          // SizedBox(
          //   height: 15,
          // ),
          // Text('DETAILS- RESERVATION -CONFIRMATION'),
          SizedBox(
            height: 4,
          ),
          Card(
              color: Colors.green[100],
              margin: EdgeInsets.only(left: 15, top: 5, right: 15),
              elevation: 6,
              child: Column(
                children: [
                  Text(
                    'THANKYOU',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'YOUR ORDER HAS BEEN PLACED',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    'Your order number is ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'xxxxxxxxxx098',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'You will recieve an email shortly we hope you enjoy the cars ',
                    textAlign: TextAlign.center,
                  ),
                  Text('you have chosen'),
                  SizedBox(
                    height: 20,
                  ),
                  Image(
                    image: AssetImage('assets/confirm.png'),
                    height: 50,
                    width: 50,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              )),
          RaisedButton(
            color: Colors.orange[900],
            onPressed: () {
              // Navigator.pop(context);
              // Navigator.pop(context);
            },
            child: Text('Print'),
          ),
        ],
      ),
    );
  }
}
