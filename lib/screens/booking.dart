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

class MyBooking extends StatefulWidget {
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
    final car = Provider.of<Bookings>(context);

    final carData = Provider.of<Bookings>(context);
    // print(carData.items);

    final cars = carData.items;
    // print(cars.length);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        title: Text('AUTOLEASE'),
      ),
      body: cars.length == 0
          ? Center(
              child: Text(
              'No record found',
              style: TextStyle(fontSize: 25),
            ))
          : ListView.builder(
              itemCount: cars.length,
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text('ID'),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(car.items[index].bookinId.toString())
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
                                Text(car.items[index].carName.toString())
                              ],
                            ),
                            Column(
                              children: [
                                Text('Total'),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('AED:${car.items[index].total.toString()}')
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
                                        '       Start Date :   ${car.items[index].date.toString()}',
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                          '       End Date  :   ${car.items[index].endDate.toString()}'),
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
              }),
      // drawer: Sidebar(),
    );
  }
}
