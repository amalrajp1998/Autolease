import 'package:flutter/material.dart';
import 'splash.dart';

class Money extends StatefulWidget {
  @override
  _MoneyState createState() => _MoneyState();
}

class _MoneyState extends State<Money> {
  int money;
  @override
  initState() {
    super.initState();
    money = AutoLeaseMoney;
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('My Rewards'),
          backgroundColor: Colors.grey[700],
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Card(
                margin: EdgeInsets.only(top: 10),
                elevation: .8,
                child: SizedBox(
                  width: (MediaQuery.of(context).size.width) * .95,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 10),

                      CircleAvatar(
                        backgroundImage: AssetImage('assets/money1.png'),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Welcome pack voucher',
                        style: TextStyle(fontSize: 17),
                      ),

                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        // 'Points: ' + AutoLeaseMoney.toString(),
                        'Points: $poients',
                        style: TextStyle(fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // Text('Max Allowed per Day : 30'),
                      SizedBox(
                        height: 10,
                      ),
                      // Text('Max Allowed per month : 550'),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              // Card(
              //   margin: EdgeInsets.only(top: 10),
              //   elevation: .8,
              //   child: SizedBox(
              //     width: (MediaQuery.of(context).size.width) * .95,
              //     child: Column(
              //       children: <Widget>[
              //         SizedBox(height: 10),

              //         CircleAvatar(
              //           backgroundImage: AssetImage('assets/money1.png'),
              //         ),
              //         SizedBox(height: 10),
              //         Text(
              //           'Rental spend reward',
              //           style: TextStyle(fontSize: 17),
              //         ),

              //         SizedBox(
              //           height: 10,
              //         ),
              //         Text(
              //           // 'Points: ' + AutoLeaseMoney.toString(),
              //           'Points: 0',
              //           style: TextStyle(fontSize: 17),
              //         ),
              //         SizedBox(
              //           height: 10,
              //         ),
              //         // Text('Max Allowed per Day : 30'),
              //         SizedBox(
              //           height: 10,
              //         ),
              //         // Text('Max Allowed per month : 550'),
              //         SizedBox(
              //           height: 10,
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              // SizedBox(height: 15),
              // Card(
              //   margin: EdgeInsets.only(top: 10),
              //   elevation: .8,
              //   child: SizedBox(
              //     width: (MediaQuery.of(context).size.width) * .95,
              //     child: Column(
              //       children: <Widget>[
              //         SizedBox(height: 10),

              //         CircleAvatar(
              //           backgroundImage: AssetImage('assets/money1.png'),
              //         ),
              //         Text(
              //           'Referral reward',
              //           style: TextStyle(fontSize: 17),
              //         ),

              //         SizedBox(
              //           height: 10,
              //         ),
              //         Text(
              //           // 'Points: ' + AutoLeaseMoney.toString(),
              //           'Points: 0',
              //           style: TextStyle(fontSize: 17),
              //         ),
              //         SizedBox(
              //           height: 10,
              //         ),
              //         // Text('Max Allowed per Day : 30'),
              //         SizedBox(
              //           height: 10,
              //         ),
              //         // Text('Max Allowed per month : 550'),
              //         SizedBox(
              //           height: 10,
              //         )
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        ));
  }
}
