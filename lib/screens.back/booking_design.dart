import '../provider/bookingModel.dart';
import '../provider/bookings.dart';
import '../provider/product.dart';
import '../screens/car_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookingDesign extends StatefulWidget {
  @override
  _BookingDesignState createState() => _BookingDesignState();
}

class _BookingDesignState extends State<BookingDesign> {
  @override
  Widget build(BuildContext context) {
    final car = Provider.of<Bookings>(context);
    // final cars = car.items;
    // print();
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
                    Text('Order ID'),
                    Text(car.items[0].carName.toString())
                  ],
                ),
                Column(
                  children: [Text('Placed on'), Text('12/07/2020')],
                ),
                Column(
                  children: [Text('Total'), Text('AED:128')],
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
                    'CAR DETAILS',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Card(
                        elevation: 6,
                        child: Image.network(
                          '',
                          height: 150,
                          width: 150,
                        ),
                      ),
                      Column(
                        children: [],
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
  }
}
