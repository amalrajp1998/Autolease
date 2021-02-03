import '../provider/product.dart';
import '../screens/car_detail.dart';
import 'package:flutter/material.dart';
import '../screens/car_detail.dart';
import 'package:provider/provider.dart';

class ProductItem2 extends StatefulWidget {
  @override
  _ProductItem2State createState() => _ProductItem2State();
}

class _ProductItem2State extends State<ProductItem2> {
  @override
  Widget build(BuildContext context) {
    final car = Provider.of<Product>(context);
    return Column(
      children: [
        Card(
          elevation: 5,
          margin: EdgeInsets.all(3),
          shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.circular(2.0),
          ),
          child: InkWell(
              onTap: () {
                car.location();
                Navigator.of(context).pushNamed(
                  DetailPage.routeName,
                  arguments: car.id,
                );
              },
              // child: Text(car.name),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /*********************************************Column 1*********************************************************** */
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(7),
                            topRight: Radius.circular(7)),
                        color: Colors.green[100]),
                    // color: Colors.grey,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                            flex: 7,
                            child: Container(
                              margin: EdgeInsets.only(left: 75),
                              child: Text(
                                car.name,
                                style: TextStyle(
                                    color: Color(0xFF527DAA),
                                    letterSpacing: 1.5,
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                            // textAlign: TextAlign.left,
                            // ),
                            ),
                        Expanded(
                          // flex: ,
                          child: IconButton(
                            padding: EdgeInsets.only(
                                right: 2, left: 2, top: 2, bottom: 0),
                            // alignment: Alignment.topRight,
                            color: Colors.red[200],
                            icon: Icon(car.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border),
                            onPressed: () {
                              // print('IconButon Pressed');
                              car.fav();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  /*********************************************Column 2*********************************************************** */
                  Row(
                    children: [
                      Expanded(
                          flex: 6,
                          child: Image(
                            fit: BoxFit.cover,
                            // width: 200,
                            // height: 200,
                            image: AssetImage(car.imageurl),
                          )),
                      Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: 5, right: 5, bottom: 0),
                                // decoration: BoxDecoration(color: Colors.green[200]),
                                child: Text(
                                    'AED' +
                                        car.costPerDay.toString() +
                                        '' +
                                        '/Day',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xFF527DAA),
                                        letterSpacing: 1,
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold)),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    left: 5, right: 5, bottom: 0),
                                // decoration: BoxDecoration(color: Colors.green[200]),
                                child: Text(
                                    'AED: ' +
                                        car.costPreMounth.toString() +
                                        '' +
                                        '/Mon',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Color(0xFF527DAA),
                                        letterSpacing: 1,
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold)),
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                child: RaisedButton(
                                  onPressed: () {
                                    // car.login = true;
                                    // print('Text');
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //       builder: (context) =>
                                    //           ProductOverViewScreen()),
                                    // );
                                  },
                                  padding: EdgeInsets.all(15.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  color: Colors.green[300],
                                  child: Text(
                                    'Book Now',
                                    style: TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 1.5,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                  /*********************************************Column 3*********************************************************** */
                  Container(
                      margin: EdgeInsets.only(left: 10, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(
                            image: AssetImage('assets/seat.png'),
                            height: 15,
                            width: 15,
                          ),
                          // Text('Seat'),
                          SizedBox(width: 1),
                          Text(car.seat),
                          SizedBox(
                            width: 20,
                          ),

                          Image(
                            image: AssetImage('assets/ac.png'),
                            height: 20,
                            width: 20,
                          ),
                          // Text('Seat'),
                          SizedBox(width: 1),
                          Text(car.ac),
                          SizedBox(
                            width: 20,
                          ),

                          Image(
                            image: AssetImage('assets/engine.png'),
                            height: 20,
                            width: 20,
                          ),
                          // Text('Seat'),
                          SizedBox(width: 1),
                          Text(car.engin),
                          SizedBox(
                            width: 20,
                          ),

                          Image(
                            image: AssetImage('assets/gear.png'),
                            height: 15,
                            width: 15,
                          ),
                          // Text('Seat'),
                          SizedBox(width: 1),
                          Text(car.gear),
                          SizedBox(
                            width: 20,
                          ),
                          Image(
                            image: AssetImage('assets/gear.png'),
                            height: 15,
                            width: 15,
                          ),
                          // Text('Seat'),
                          SizedBox(width: 1),
                          Text(car.gear),
                        ],
                      ))
                ],
              )),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );

    // Card(
    //     margin:
    //         new EdgeInsets.only(left: 0.0, right: 0.0, top: 8.0, bottom: 5.0),
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    //     elevation: 4.0,
    //     child: Column(
    //       children: [
    //         InkWell(
    //           splashColor: Colors.blue.withAlpha(30),
    //           onTap: () {
    //             car.location();
    //             Navigator.of(context).pushNamed(
    //               DetailPage.routeName,
    //               arguments: car.id,
    //             );
    //           },
    //           child: Container(
    //             child: Column(
    //               children: [
    //                 ClipRRect(
    //                   borderRadius: BorderRadius.only(
    //                     topLeft: Radius.circular(15),
    //                     topRight: Radius.circular(15),
    //                   ),
    //                 ),
    //                 Row(
    //                   children: [
    //                     Expanded(
    //                       flex: 8,
    //                       child: Container(
    //                           color: Colors.white,
    //                           child: Column(
    //                             children: [
    //                               Image.asset(car.imageurl),
    //                               Row(
    //                                 mainAxisAlignment: MainAxisAlignment.center,
    //                                 children: [
    //                                   Text(
    //                                     car.name,
    //                                     style: TextStyle(
    //                                       fontSize: 15,
    //                                       fontWeight: FontWeight.bold,
    //                                     ),
    //                                     overflow: TextOverflow.ellipsis,
    //                                   ),
    //                                   SizedBox(width: 10),
    //                                 ],
    //                               )
    //                             ],
    //                           )),
    //                     ),
    //                     /////////////////////////////////////////////////////////////////////////////////////////////////////////
    //                     SizedBox(
    //                       width: 0,
    //                       height: 5,
    //                     ),
    //                     Expanded(
    //                         flex: 2,
    //                         child: SingleChildScrollView(
    //                           child: Container(
    //                               height: 200,
    //                               child: SingleChildScrollView(
    //                                 child: Column(
    //                                   children: [
    //                                     Image(
    //                                       image: AssetImage('assets/seat.png'),
    //                                       height: 15,
    //                                       width: 15,
    //                                     ),
    //                                     Text('Seat'),
    //                                     Text(car.seat),
    //                                     SizedBox(height: 10),
    //                                     Image(
    //                                       image:
    //                                           AssetImage('assets/engine.png'),
    //                                       height: 15,
    //                                       width: 15,
    //                                     ),
    //                                     Text('Engin'),
    //                                     Text(car.engin),
    //                                     SizedBox(height: 10),
    //                                     Image(
    //                                       image: AssetImage('assets/door.png'),
    //                                       height: 15,
    //                                       width: 15,
    //                                     ),
    //                                     Text('Door'),
    //                                     Text(car.door),
    //                                     SizedBox(height: 10),
    //                                     Image(
    //                                       image: AssetImage('assets/ac.png'),
    //                                       height: 15,
    //                                       width: 15,
    //                                     ),
    //                                     Text('AC'),
    //                                     Text(car.ac),
    //                                     SizedBox(height: 10),
    //                                     Image(
    //                                       image: AssetImage('assets/lug.png'),
    //                                       height: 15,
    //                                       width: 15,
    //                                     ),
    //                                     Text('Lug'),
    //                                     Text(car.luggage),
    //                                     SizedBox(height: 10),
    //                                     Image(
    //                                       image: AssetImage('assets/gear.png'),
    //                                       height: 15,
    //                                       width: 15,
    //                                     ),
    //                                     Text('gear'),
    //                                     Text(car.gear),
    //                                     SizedBox(height: 10),
    //                                   ],
    //                                 ),
    //                               )),
    //                         )),

    //                     //////////////////////////////////////////////////////////////////////////////////////////////////
    //                   ],
    //                 )
    //               ],
    //             ),
    //           ),
    //         ),
    //         SizedBox(height: 20),
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           children: [
    //             Expanded(
    //                 flex: 6,
    //                 child: Container(
    //                     child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.center,
    //                   children: [
    //                     Padding(padding: EdgeInsets.all(5.0)),
    //                     Expanded(
    //                         flex: 2,
    //                         child: Column(
    //                           children: [
    //                             Container(

    //                                 //margin: ,
    //                                 child: IconButton(
    //                               color: Colors.red[200],
    //                               icon: Icon(car.isFavorite
    //                                   ? Icons.favorite
    //                                   : Icons.favorite_border),
    //                               onPressed: () {
    //                                 print('IconButon Pressed');
    //                                 car.fav();
    //                               },
    //                             )),
    //                             Text('')
    //                           ],
    //                         )),
    //                     Expanded(
    //                       flex: 4,
    //                       child: Column(
    //                         children: [
    //                           FlatButton(
    //                               color: Colors.green[400],
    //                               textColor: Colors.white,
    //                               disabledColor: Colors.grey,
    //                               disabledTextColor: Colors.black,
    //                               padding: EdgeInsets.all(8.0),
    //                               splashColor: Colors.green[200],
    //                               onPressed: (() {
    //                                 print('Book Now Pressed');
    //                                 Navigator.of(context).pushNamed(
    //                                   DetailPage.routeName,
    //                                   arguments: car.id,
    //                                 );
    //                               }),
    //                               child:
    //                                   Text('AED ' + car.costPerDay.toString())),
    //                           Text('Per Day')
    //                         ],
    //                       ),
    //                     ),
    //                     SizedBox(width: 50),
    //                     Expanded(
    //                       flex: 4,
    //                       child: Column(
    //                         children: [
    //                           FlatButton(
    //                               color: Colors.green[400],
    //                               textColor: Colors.white,
    //                               disabledColor: Colors.grey,
    //                               disabledTextColor: Colors.black,
    //                               padding: EdgeInsets.all(4.0),
    //                               splashColor: Colors.green[200],
    //                               onPressed: (() {
    //                                 print('Book Now Pressed');
    //                                 Navigator.of(context).pushNamed(
    //                                   DetailPage.routeName,
    //                                   arguments: car.id,
    //                                 );
    //                               }),
    //                               child: Text(
    //                                   'AED ' + car.costPreMounth.toString())),
    //                           Text('Per Mounth')
    //                         ],
    //                       ),
    //                     ),
    //                     SizedBox(width: 10),
    //                   ],
    //                 )))
    //           ],
    //         ),
    //         SizedBox(height: 10)
    //       ],
    //     )
    //     );
  }
}
