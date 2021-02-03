import '../provider/product.dart';
import '../screens/car_detail.dart';
import 'package:flutter/material.dart';
import '../screens/car_detail.dart';
import 'package:provider/provider.dart';

class ProductItem1 extends StatefulWidget {
  @override
  _ProductItem1State createState() => _ProductItem1State();
}

class _ProductItem1State extends State<ProductItem1> {
  @override
  Widget build(BuildContext context) {
    final car = Provider.of<Product>(context);
    return Card(
        margin:
            new EdgeInsets.only(left: 0.0, right: 0.0, top: 8.0, bottom: 5.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        elevation: 4.0,
        child: Column(
          children: [
            InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {
                car.location();
                Navigator.of(context).pushNamed(
                  DetailPage.routeName,
                  arguments: car.id,
                );
              },
              child: Container(
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 8,
                          child: Container(
                              color: Colors.white,
                              child: Column(
                                children: [
                                  Image.asset(car.imageurl),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        car.name,
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      SizedBox(width: 10),
                                    ],
                                  )
                                ],
                              )),
                        ),
                        /////////////////////////////////////////////////////////////////////////////////////////////////////////
                        SizedBox(
                          width: 0,
                          height: 5,
                        ),
                        Expanded(
                            flex: 2,
                            child: SingleChildScrollView(
                              child: Container(
                                  height: 200,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        Image(
                                          image: AssetImage('assets/seat.png'),
                                          height: 15,
                                          width: 15,
                                        ),
                                        Text('Seat'),
                                        Text(car.seat),
                                        SizedBox(height: 10),
                                        Image(
                                          image:
                                              AssetImage('assets/engine.png'),
                                          height: 15,
                                          width: 15,
                                        ),
                                        Text('Engin'),
                                        Text(car.engin),
                                        SizedBox(height: 10),
                                        Image(
                                          image: AssetImage('assets/door.png'),
                                          height: 15,
                                          width: 15,
                                        ),
                                        Text('Door'),
                                        Text(car.door),
                                        SizedBox(height: 10),
                                        Image(
                                          image: AssetImage('assets/ac.png'),
                                          height: 15,
                                          width: 15,
                                        ),
                                        Text('AC'),
                                        Text(car.ac),
                                        SizedBox(height: 10),
                                        Image(
                                          image: AssetImage('assets/lug.png'),
                                          height: 15,
                                          width: 15,
                                        ),
                                        Text('Lug'),
                                        Text(car.luggage),
                                        SizedBox(height: 10),
                                        Image(
                                          image: AssetImage('assets/gear1.png'),
                                          height: 15,
                                          width: 15,
                                        ),
                                        Text('gear'),
                                        Text(car.gear),
                                        SizedBox(height: 10),
                                      ],
                                    ),
                                  )),
                            )),

                        //////////////////////////////////////////////////////////////////////////////////////////////////
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    flex: 6,
                    child: Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.all(5.0)),
                        Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                Container(

                                    //margin: ,
                                    child: IconButton(
                                  color: Colors.red[200],
                                  icon: Icon(car.isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border),
                                  onPressed: () {
                                    print('IconButon Pressed');
                                    car.fav();
                                  },
                                )),
                                Text('')
                              ],
                            )),
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              FlatButton(
                                  color: Colors.green[400],
                                  textColor: Colors.white,
                                  disabledColor: Colors.grey,
                                  disabledTextColor: Colors.black,
                                  padding: EdgeInsets.all(8.0),
                                  splashColor: Colors.green[200],
                                  onPressed: (() {
                                    print('Book Now Pressed');
                                    Navigator.of(context).pushNamed(
                                      DetailPage.routeName,
                                      arguments: car.id,
                                    );
                                  }),
                                  child:
                                      Text('AED ' + car.costPerDay.toString())),
                              Text('Per Day')
                            ],
                          ),
                        ),
                        SizedBox(width: 50),
                        Expanded(
                          flex: 4,
                          child: Column(
                            children: [
                              FlatButton(
                                  color: Colors.green[400],
                                  textColor: Colors.white,
                                  disabledColor: Colors.grey,
                                  disabledTextColor: Colors.black,
                                  padding: EdgeInsets.all(4.0),
                                  splashColor: Colors.green[200],
                                  onPressed: (() {
                                    print('Book Now Pressed');
                                    Navigator.of(context).pushNamed(
                                      DetailPage.routeName,
                                      arguments: car.id,
                                    );
                                  }),
                                  child: Text(
                                      'AED ' + car.costPreMounth.toString())),
                              Text('Per Mounth')
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                      ],
                    )))
              ],
            ),
            SizedBox(height: 10)
          ],
        ));
  }
}
