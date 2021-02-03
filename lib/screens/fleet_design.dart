import '../provider/bookingModel.dart';
import '../provider/product.dart';
import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import '../provider/product.dart';
import 'car_detail.dart';

String BookingMode = 'day';
var cW = Colors.white;
var cB = Colors.black;

class FleetDesign extends StatefulWidget {
  @override
  _FleetDesignState createState() => _FleetDesignState();
}

class _FleetDesignState extends State<FleetDesign> {
  @override
  Widget build(BuildContext context) {
    final car = Provider.of<Product>(context);
    final booking = Provider.of<Booking>(context);
    // print(car.name);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      // color: Colors.white,
      child: InkWell(
        onTap: () {
          // // car.cost = car.costPerDay.toInt();
          // // car.addHireCost();
          // car.location();
          // // Navigator.pop(context);
          // Navigator.of(context).pushNamed(
          //   DetailPage.routeName,
          //   arguments: car.id,
          // );
        },
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              // height: MediaQuery.of(context).size.height,
              height: 165,
              child: Stack(
                children: [
                  // Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  Positioned(
                    top: 0,
                    left: 1,
                    bottom: 1,
                    // bottom: 1,
                    child: Container(
                      // alignment: Alignment(-1, -1),
                      decoration: BoxDecoration(
                        color: Colors.orange[900],
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      // alignment: Alignment.center,
                      // width: (MediaQuery.of(context).size.width) * .45,
                      // height: (MediaQuery.of(context).size.height) * .20,
                      width: 170,
                      height: 165,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15, top: 6, right: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              car.name,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: cW,
                                  fontFamily: 'centurygothic'),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Text(
                              car.carModel.toString(),
                              // 'model',
                              style: TextStyle(
                                  letterSpacing: 1.3,
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal,
                                  color: cW,
                                  fontFamily: 'centurygothic'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image(
                                  image: AssetImage('assets/seat.png'),
                                  height: 15,
                                  width: 15,
                                  color: Colors.grey[900],
                                ),
                                // Text('Seat'),
                                // SizedBox(width: 1),
                                Text(
                                  car.seat,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'centurygothic'),
                                ),
                                SizedBox(
                                  width: 8,
                                ),

                                Image(
                                  image: AssetImage('assets/ac.png'),
                                  height: 15,
                                  width: 15,
                                  color: Colors.grey[900],
                                ),
                                // Text('Seat'),
                                SizedBox(width: 1),
                                Text(
                                  car.ac,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'centurygothic'),
                                ),
                                SizedBox(
                                  width: 8,
                                ),

                                // Image(
                                //   image: AssetImage('assets/lugg.png'),
                                //   height: 15,
                                //   width: 15,
                                // ),
                                // // Text('Seat'),
                                // SizedBox(width: 1),
                                // Text(
                                //   car.luggage,
                                //   style: TextStyle(fontSize: 12),
                                // ),
                                // SizedBox(
                                //   width: 5,
                                // ),
                                Image(
                                  image: AssetImage('assets/gear1.png'),
                                  height: 15,
                                  width: 15,
                                  color: Colors.grey[900],
                                ),
                                // Text('Seat'),
                                // SizedBox(width: 0),
                                Text(
                                  car.gear,
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'centurygothic'),
                                ),
                                SizedBox(
                                  width: 4,
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // ],
                  // ),

                  // ),
                  // Align(
                  //   alignment: Alignment.centerRight,

                  // ),
                  // ],
                  // ),
                  // ),
                  Positioned(
                    top: 20,
                    left: 40,
                    child: Image.network(
                      car.imageurl,
                      // 'https://www.autolease-uae.com/wp-content/uploads/2018/03/sunny-1.png',
                      width: 190,
                      height: 200,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      padding:
                          EdgeInsets.only(right: 2, left: 2, top: 2, bottom: 0),
                      color: Colors.red[200],
                      icon: Icon(car.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border),
                      onPressed: () {
                        print('IconButon Pressed');
                        car.fav();
                      },
                    ),
                  ),
                  Positioned(
                    top: 1,
                    right: 0,
                    child: SizedBox(
                      height: 160,
                      // width: 200,
                      child: Container(
                        // color: Colors.red,
                        // alignment: Alignment.center,
                        // alignment: Alignment.bottomRight,
                        // alignment: AlignmentGeometry(),
                        // height: (MediaQuery.of(context).size.height) * .24,
                        width: (MediaQuery.of(context).size.width) - 200,
                        // width: 170,
                        height: 160,
                        // color: Colors.red,
                        margin: EdgeInsets.only(left: 15, right: 3, top: 1),
                        // color: Colors.yellow,
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 15),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  width: 5,
                                ),
                                SizedBox(
                                    height: 40,
                                    width: (MediaQuery.of(context).size.width -
                                            200 -
                                            14) /
                                        2,
                                    child: FlatButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(13.0),
                                          side: BorderSide(
                                              color: Colors.amber[900])),
                                      // color: Colors.red[900],
                                      onPressed: () {
                                        // print(car.cost);
                                        setState(() {
                                          BookingMode = 'day';
                                        });
                                        Navigator.of(context).pushNamed(
                                          DetailPage.routeName,
                                          arguments: car.id,
                                        );
                                      },
                                      // elevation: 6,
                                      // color: Colors.red[900],
                                      // clipBehavior: Clip.hardEdge,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            'AED: ' + car.costPerDay.toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 9,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'centurygothic'),
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text(
                                            'Per Day',
                                            style: TextStyle(
                                                fontSize: 9,
                                                color: Colors.black,
                                                fontFamily: 'centurygothic'),
                                          )
                                        ],
                                      ),
                                    )),
                                SizedBox(
                                  width: 4,
                                ),
                                SizedBox(
                                  height: 40,
                                  // width: 75,
                                  width: (MediaQuery.of(context).size.width -
                                          200 -
                                          14) /
                                      2,
                                  child: FlatButton(
                                    onPressed: () {
                                      setState(() {
                                        BookingMode = 'hour';
                                      });
                                      Navigator.of(context).pushNamed(
                                        DetailPage.routeName,
                                        arguments: car.id,
                                      );
                                    },
                                    // elevation: 6,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(13.0),
                                        side: BorderSide(
                                            color: Colors.amber[900])),
                                    // color: Colors.red[900],
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          'AED: ' + car.costPerHour.toString(),
                                          style: TextStyle(
                                              fontSize: 9,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'centurygothic'),
                                        ),
                                        Text(
                                          'Per Hour',
                                          style: TextStyle(
                                              fontSize: 9,
                                              color: Colors.black,
                                              fontFamily: 'centurygothic'),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                )
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                // SizedBox(
                                //   width: 50,
                                // ),
                                SizedBox(
                                  height: 40,
                                  // width: 75,
                                  width: (MediaQuery.of(context).size.width -
                                          200 +
                                          20) /
                                      2,
                                  child: FlatButton(
                                    onPressed: () {
                                      setState(() {
                                        BookingMode = 'Month';
                                      });
                                      // print(car.totel);
                                      Navigator.of(context).pushNamed(
                                        DetailPage.routeName,
                                        arguments: car.id,
                                      );
                                    },
                                    // elevation: 6,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(13.0),
                                        side: BorderSide(
                                            color: Colors.amber[900])),
                                    color: Colors.red[900],
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'AED:' +
                                                car.costPreMounth.toString(),
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontWeight: FontWeight.bold,
                                                color: cW,
                                                fontFamily: 'centurygothic'),
                                          ),
                                          Text(
                                            'Per Month',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: cW,
                                                fontFamily: 'centurygothic'),
                                          )
                                        ]),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 6,
                            )
                          ],
                        ),

                        /////////////////////////
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 1,
            )
          ],
        ),
      ),
    );
  }
}
