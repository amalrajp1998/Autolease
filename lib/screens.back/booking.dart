import 'dart:convert';

import 'package:autolease/screens/splash.dart';

import '../main.dart';
import '../provider/bookingModel.dart';
import '../provider/car_provider.dart';
import '../provider/product.dart';
import '../screens/booking_design.dart';
import '../screens/car_detail.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import '../widgets/sidebar.dart';
import '../provider/bookings.dart';
import 'package:http/http.dart' as http;

class MyBooking extends StatefulWidget {
  String url = 'https://admin.autolease-uae.com/autolease/booking/${Number}';
  @override
  _MyBookingState createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBooking> {
  bool isFirst;
  @override
  // void didChangeDependencies() {
  //   if (isFirst) {
  //     Provider.of<Bookings>(context).fetchBooking();
  //     isFirst = false;
  //   }
  //   super.didChangeDependencies();
  //   MyApp.setLocale(context, locale);
  // }

  initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    // final car = Provider.of<Booking>(context);
    // final car = Provider.of<Bookings>(context);

    // final carData = Provider.of<Bookings>(context);
    // print(carData.items);

    // final cars = carData.items;
    // print(cars.length);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[850],
          title: Text('AUTOLEASE'),
        ),
        body: FutureBuilder(
          // future: http.get(url, headers: <String, String>{
          //   'Content-Type': 'application/json; charset=UTF-8',
          //   'Authorization': 'Bearer ' + Token
          // }),
          future: fetchBooking(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // print(DateFormat('yyyy-MM-dd – kk:mm').format(now));
              print(snapshot.data);
              if (snapshot.data != null) {
                if (snapshot.data.length != 0) {
                  return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          elevation: 2,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              ExpansionTile(
                                title: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Text('ID'),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(snapshot.data[index]['id']
                                            .toString())
                                      ],
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Column(
                                      children: [
                                        Text('Car'),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(snapshot.data[index]['name']
                                            .toString())
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text('Total'),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                            'AED:${snapshot.data[index]["total"].toString()}')
                                      ],
                                    )
                                  ],
                                ),
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'DETAILS',
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                '       Start Date :   ${snapshot.data[index]["start_date"].toString()}',
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                  '       End Date  :   ${snapshot.data[index]["end_date"].toString()}'),
                                              SizedBox(
                                                height: 10,
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      });
                } else {
                  return Center(child: Text("No Booking"));
                }
              } else {
                return Center(child: Text("No Booking"));
              }
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Container(
                  height: MediaQuery.of(context).size.height,
                  child: Center(child: Text("Error")));
            }
          },
        ));
  }
}

Future fetchBooking() async {
  print(Token);
  print(Number);
  print("future builder");
  String url = 'https://admin.autolease-uae.com/autolease/booking/${Number}';
  if (Number != null) {
    print("try");
    try {
      // print(url);
      final response = await http.get(url, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + Token
      });
      // final content = jsonDecode(response.body)['content'];
      // List<Booking> loadedProducts = [];
      // if (content.length != 0) {
      //   print('get into ');
      //   content.forEach((element) {
      //     print(element);
      //     loadedProducts.add(Booking(
      //         carName: element['name'],
      //         total: element['total'],
      //         bookinId: element['id'],
      //         date: element['start_date'],
      //         endDate: element['end_date']));

      //     print(element['id']);
      //   });
      // }
      // print(jsonDecode(response.body));
      return jsonDecode(response.body) as List;
    } catch (error) {
      print(error);
      throw (error);
    }
  }
}
