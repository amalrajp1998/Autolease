import '../localization/constants.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

class Privacy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(backgroundColor: Colors.grey[850], title: Text('AUTOLEASE')),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 10, right: 4, top: 5, bottom: 4),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Text(
                getTranslated(
                  context,
                  'ph1',
                ),
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 5,
              ),
              Text(getTranslated(context, 'pp1')),

              ///2//
              SizedBox(
                height: 10,
              ),
              Text(
                getTranslated(
                  context,
                  'ph2',
                ),
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 5,
              ),
              Text(getTranslated(context, 'pp2')),
              //3//
              SizedBox(
                height: 10,
              ),
              Text(
                getTranslated(
                  context,
                  'ph3',
                ),
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 5,
              ),
              Text(getTranslated(context, 'pp3')),
              //4//
              SizedBox(
                height: 10,
              ),
              Text(
                getTranslated(
                  context,
                  'ph4',
                ),
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 5,
              ),
              Text(getTranslated(context, 'pp4')), //5//

              SizedBox(
                height: 10,
              ),
              Text(
                getTranslated(
                  context,
                  'ph5',
                ),
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 5,
              ),
              Text(getTranslated(context, 'pp5')),
              //6//
              SizedBox(
                height: 10,
              ),
              Text(
                getTranslated(
                  context,
                  'ph6',
                ),
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 5,
              ),
              Text(getTranslated(context, 'pp6')),
              //7//
              SizedBox(
                height: 10,
              ),
              Text(
                getTranslated(
                  context,
                  'ph7',
                ),
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 5,
              ),
              Text(getTranslated(context, 'pp7')),
              //8//
              SizedBox(
                height: 10,
              ),
              Text(
                getTranslated(
                  context,
                  'ph8',
                ),
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                getTranslated(context, 'pp8'),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 4,
              ),
              Text(getTranslated(context, 'pp8.1')),
              SizedBox(
                height: 2,
              ),
              Text(getTranslated(context, 'pp8.2')),
              SizedBox(
                height: 2,
              ),
              Text(getTranslated(context, 'pp8.3')),
              SizedBox(
                height: 2,
              ),
              Text(getTranslated(context, 'pp8.4')),
              SizedBox(
                height: 2,
              ),
              Text(getTranslated(context, 'pp8.5')),
              SizedBox(
                height: 2,
              ),
              Text(getTranslated(context, 'pp8.6')),
              SizedBox(
                height: 2,
              ),
              Text(getTranslated(context, 'pp8.7')),
              SizedBox(
                height: 2,
              ),
              Text(getTranslated(context, 'pp8.8')),
              SizedBox(
                height: 2,
              ),
              Text(getTranslated(context, 'pp8.9')),
              SizedBox(
                height: 2,
              ),
              Text(getTranslated(context, 'pp8.10')),
              SizedBox(
                height: 2,
              ),
              Text(getTranslated(context, 'pp8.11')),
              SizedBox(
                height: 2,
              ),
              Text(getTranslated(context, 'pp8.12')),
              SizedBox(
                height: 2,
              ),
              Text(getTranslated(context, 'pp8.13')),
              SizedBox(
                height: 2,
              ),
              Text(getTranslated(context, 'pp8.14')),
              SizedBox(
                height: 2,
              ),
              Text(getTranslated(context, 'pp8.15')),
              SizedBox(
                height: 2,
              ),
              Text(getTranslated(context, 'pp8.16')),
              SizedBox(
                height: 2,
              ),
              Text(getTranslated(context, 'pp8.17')),
              SizedBox(
                height: 2,
              ),
              Text(getTranslated(context, 'pp8.18')),
              SizedBox(
                height: 2,
              ),
              Text(getTranslated(context, 'pp8.19')),
              SizedBox(
                height: 2,
              ),
              Text(getTranslated(context, 'pp8.20')),
              SizedBox(
                height: 2,
              ),
              Text(getTranslated(context, 'pp8.21')),
              SizedBox(
                height: 2,
              ),
              Text(getTranslated(context, 'pp8.22')),
              SizedBox(
                height: 2,
              ),
              Text(getTranslated(context, 'pp8.23')),
              SizedBox(
                height: 2,
              ),
              Text(getTranslated(context, 'pp8.24')),
              SizedBox(
                height: 2,
              ),
              Text(getTranslated(context, 'pp8.25')),
              SizedBox(
                height: 2,
              ),
              Text(getTranslated(context, 'pp8.26')),
              SizedBox(
                height: 2,
              ),
              Text(getTranslated(context, 'pp8.27')),

              //9//
              SizedBox(
                height: 10,
              ),
              Text(
                getTranslated(
                  context,
                  'ph9',
                ),
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 5,
              ),
              Text(getTranslated(context, 'pp9.1')),
              SizedBox(
                height: 4,
              ),
              Text(getTranslated(context, 'pp9.2')),
              //10//
              SizedBox(
                height: 10,
              ),
              Text(
                getTranslated(
                  context,
                  'ph10',
                ),
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 5,
              ),
              Text(getTranslated(context, 'pp10')),

              ///End///
            ],
          ),
        ),
      ),
    );
  }
}
