// import '../provider/car_provider.dart';
// import '../provider/product.dart';
// import '../screens/payment.dart';
// import 'package:auto_animated/auto_animated.dart';
// import 'package:flutter/material.dart';
// import 'package:path/path.dart';
// import 'package:provider/provider.dart';
// import './payment.dart';
// import 'fleet_design.dart';
// import './splash.dart';

// //int driver = 0;
// bool exe = true;
// String carName;
// int carid1;
// String pai;
// bool onlyone = true;

// class DetailPage extends StatefulWidget {
//   static const routeName = '/Details';
//   @override
//   _DetailPageState createState() => _DetailPageState();
// }

// var stt = TextStyle(fontSize: 12);
// int cost = 0;

// class _DetailPageState extends State<DetailPage> {
//   @override
//   void initState() {
//     setState(() {
//       onlyone = true;
//       //  car.temppaiFinal = fData.chc1;
//       exe = true;
//     });

//     super.initState();
//   }

//   Widget build(BuildContext context) {
//     final car = Provider.of<Product>(context);

//     final pid = ModalRoute.of(context).settings.arguments;
//     final fData = Provider.of<CarProvider>(context)
//         .items
//         .firstWhere((prod) => prod.id.toString() == pid.toString());
//     carName = fData.name;
//     carid1 = fData.id;

//     void updates() {
//       setState(() {
//         pai = fData.chc1.toString();
//         car.temppaiFinal = fData.chc1;
//         car.tempcdwFinal = fData.chc2;
//         car.driverCost = fData.driverCost;
//         car.seatCost = fData.seatCost;
//       });

//       // print('data updated');
//       car.costDay = fData.costPerDay.toInt();
//       car.costMonth = fData.costPreMounth.toInt();
//       car.costHour = fData.costPerHour.toInt();
//       if (BookingMode == 'Month') {
//         setState(() {
//           cost = fData.costPreMounth.toInt();
//           car.current1 = fData.costPreMounth.toInt();
//           // car.temp
//         });
//       } else if (BookingMode == 'day') {
//         setState(() {
//           cost = fData.costPerDay.toInt();
//           car.current1 = fData.costPerDay.toInt();
//         });
//       } else if (BookingMode == 'hour') {
//         setState(() {
//           cost = fData.costPerHour.toInt();
//           car.current1 = fData.costPerHour.toInt();
//         });
//       }
//     }

//     if (exe == true) {
//       exe = false;
//       updates();
//       print('exe exicuted');
//     }

//     if (onlyone == true) {
//       car.driver = 0;
//       car.driverTotal = 0;
//       car.cseat = 0;
//       car.cTotel = 0;
//       car.ch2 = false;
//       car.ch1 = true;
//       car.ch3 = true;
//       car.cdwstatus = 0;
//       car.paistatus = 1;
//       car.tempcdwcost = 0;
//       car.temppaicost = fData.chc1;
//       print('totel updated');
//       if (car.ch1 == true && car.ch2 == false) {
//         car.totel = cost + fData.chc1.toInt();
//       } else if (car.ch2 == true && car.ch1 == false) {
//         car.totel = cost + fData.chc2.toInt();
//       } else if (car.ch2 == true && car.ch1 == true) {
//         car.totel = cost + fData.chc2.toInt() + fData.chc1.toInt();
//       }
//       onlyone = false;
//     }

//     // int display = car.totel + cost;
//     return Scaffold(
//         // appBar: AppBar(
//         //   title: Text(fData.name),
//         //   // backgroundColor: Colors.black87,
//         //   backgroundColor: Colors.grey[700],
//         // ),
//         backgroundColor: Colors.grey[300],
//         body: AnimateIfVisibleWrapper(
//             showItemInterval: Duration(milliseconds: 50),
//             child: NestedScrollView(
//               body: ListView(
//                 children: <Widget>[
//                   // SliverAppBar(
//                   //   title: Text('Floating app bar'),
//                   //   expandedHeight: 200,
//                   // ),
//                   AnimateIfVisible(
//                     key: Key('item.1'),
//                     duration: Duration(milliseconds: 200),
//                     builder: (
//                       context,
//                       Animation<double> animation,
//                     ) =>
//                         FadeTransition(
//                       opacity: Tween<double>(
//                         begin: 0,
//                         end: 1,
//                       ).animate(animation),
//                       child: Padding(
//                         padding: EdgeInsets.all(4),
//                         child: Card(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(4.0),
//                           ),
//                           elevation: 6,
//                           margin: EdgeInsets.all(5),
//                           child: Column(
//                             // crossAxisAlignment: CrossAxisAlignment.center,
//                             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               Image.network(
//                                 fData.imageurl,
//                                 fit: BoxFit.cover,
//                               ),
//                               Text(
//                                 fData.name,
//                                 style: TextStyle(
//                                     fontSize: 16, fontWeight: FontWeight.bold),
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   Expanded(
//                                     flex: 1,
//                                     child: Column(children: [
//                                       Image(
//                                         image: AssetImage('assets/seat.png'),
//                                         height: 25,
//                                         width: 25,
//                                       ),
//                                       Text('Seat'),
//                                       SizedBox(height: 10),
//                                       Text(fData.seat),
//                                     ]),
//                                   ),
//                                   Expanded(
//                                     flex: 1,
//                                     child: Column(children: [
//                                       Image(
//                                         image: AssetImage('assets/lugg.png'),
//                                         height: 25,
//                                         width: 25,
//                                       ),
//                                       Text('Lugg'),
//                                       SizedBox(height: 10),
//                                       Text(fData.luggage),
//                                     ]),
//                                   ),
//                                   Expanded(
//                                     flex: 1,
//                                     child: Column(children: [
//                                       Image(
//                                         image: AssetImage('assets/engine.png'),
//                                         height: 25,
//                                         width: 25,
//                                       ),
//                                       Text('Engine'),
//                                       SizedBox(height: 10),
//                                       Text(fData.engin),
//                                     ]),
//                                   ),
//                                   // Expanded(
//                                   //   flex: 1,
//                                   //   child: Column(children: [
//                                   //     Image(
//                                   //       image: AssetImage('assets/ac.png'),
//                                   //       height: 25,
//                                   //       width: 25,
//                                   //     ),
//                                   //     Text('AC'),
//                                   //     SizedBox(height: 10),
//                                   //     Text(fData.ac),
//                                   //   ]),
//                                   // ),
//                                   Expanded(
//                                     flex: 1,
//                                     child: Column(children: [
//                                       Image(
//                                         image: AssetImage('assets/gear1.png'),
//                                         height: 25,
//                                         width: 25,
//                                       ),
//                                       Text('Gear'),
//                                       SizedBox(height: 10),
//                                       Text(fData.gear),
//                                     ]),
//                                   ),
//                                   Expanded(
//                                     flex: 1,
//                                     child: Column(children: [
//                                       Image(
//                                         image: AssetImage('assets/door.png'),
//                                         height: 25,
//                                         width: 25,
//                                       ),
//                                       Text('Door'),
//                                       SizedBox(height: 10),
//                                       Text(fData.door),
//                                     ]),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 5,
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
// ////////////Column 2 end/////////////////////////////
// ///////////////Column 3 Start/////////////////////////////
//                   AnimateIfVisible(
//                     key: Key('item.2'),
//                     duration: Duration(milliseconds: 200),
//                     builder: (
//                       context,
//                       Animation<double> animation,
//                     ) =>
//                         FadeTransition(
//                       opacity: Tween<double>(
//                         begin: 0,
//                         end: 1,
//                       ).animate(animation),
//                       child: Padding(
//                         padding: EdgeInsets.all(5),
//                         child: Card(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(7.0),
//                           ),
//                           elevation: 6,
//                           margin: EdgeInsets.all(5),
//                           child: ExpansionTile(
//                             initiallyExpanded: true,
//                             // childrenPadding: EdgeInsets.all(4),
//                             title: Text(
//                               "Extras",
//                               style: TextStyle(
//                                 fontSize: 18.0,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                             children: <Widget>[
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     flex: 2,
//                                     child: Image(
//                                       image: AssetImage('assets/driver.png'),
//                                       height: 25,
//                                       width: 25,
//                                     ),
//                                   ),
//                                   Expanded(
//                                     flex: 4,
//                                     child: Column(
//                                       children: [
//                                         Text(
//                                           'Additional Driver',
//                                           style: TextStyle(fontSize: 14),
//                                         ),
//                                         Text(
//                                           'AED : ' + car.driverTotal.toString(),
//                                           style: stt,
//                                           //textAlign: TextAlign.right,
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                   // Padding(padding: EdgeInsets.all(2)),
//                                   Expanded(
//                                     flex: 1,
//                                     child: InkWell(
//                                       onTap: () {
//                                         car.subDriiver();
//                                         // print('no Of Driver ' +
//                                         //     car.driver.toString());
//                                       },
//                                       child: Visibility(
//                                         visible: car.driver == 0 ? false : true,
//                                         child: Image(
//                                           image: AssetImage('assets/sub.png'),
//                                           height: 25,
//                                           width: 25,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   Expanded(
//                                       flex: 2,
//                                       child: Text(
//                                         car.driver.toString(),
//                                         textAlign: TextAlign.center,
//                                       )),
//                                   // Padding(padding: EdgeInsets.all(2)),
//                                   Expanded(
//                                     flex: 2,
//                                     child: InkWell(
//                                       onTap: () {
//                                         car.addDriver();
//                                         // print(car.driver.toString());
//                                       },
//                                       child: Visibility(
//                                         visible: car.driver > 1 ? false : true,
//                                         child: Image(
//                                           image: AssetImage('assets/add.png'),
//                                           height: 25,
//                                           width: 25,
//                                         ),
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                               SizedBox(height: 15),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     flex: 2,
//                                     child: Image(
//                                       image: AssetImage('assets/child.png'),
//                                       height: 25,
//                                       width: 25,
//                                     ),
//                                   ),
//                                   // Padding(padding: EdgeInsets.all(2)),
//                                   Expanded(
//                                     flex: 4,
//                                     child: Column(
//                                       //mainAxisAlignment: MainAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           'Child Infant Seat ',
//                                           style: TextStyle(fontSize: 13),
//                                         ),
//                                         Text(
//                                           'AED : ' + car.cTotel.toString(),
//                                           style: stt,
//                                           //textAlign: TextAlign.right,
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                   // Padding(padding: EdgeInsets.all(2)),
//                                   Expanded(
//                                     flex: 1,
//                                     child: InkWell(
//                                       onTap: () {
//                                         // print('sub');
//                                         car.subCseat();
//                                         // print('no Of Driver ' +
//                                         //     car.cseat.toString());
//                                       },
//                                       child: Visibility(
//                                         visible: car.cseat == 0 ? false : true,
//                                         child: Image(
//                                           image: AssetImage('assets/sub.png'),
//                                           height: 25,
//                                           width: 25,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                   // Padding(padding: EdgeInsets.all(2)),
//                                   Expanded(
//                                       flex: 2,
//                                       child: Text(
//                                         car.cseat.toString(),
//                                         textAlign: TextAlign.center,
//                                       )),
//                                   // Padding(padding: EdgeInsets.all(2)),
//                                   Expanded(
//                                     flex: 2,
//                                     child: InkWell(
//                                       onTap: () {
//                                         // print('add');
//                                         car.addCseat();
//                                         // print(car.driver.toString());
//                                       },
//                                       child: Visibility(
//                                         visible: car.cseat > 2 ? false : true,
//                                         child: Image(
//                                           image: AssetImage('assets/add.png'),
//                                           height: 25,
//                                           width: 25,
//                                         ),
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 10,
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
// ////////////Column 3 end/////////////////////////////
// ////////////Column 4 Start/////////////////////////////
//                   AnimateIfVisible(
//                     key: Key('item.3'),
//                     duration: Duration(milliseconds: 200),
//                     builder: (
//                       context,
//                       Animation<double> animation,
//                     ) =>
//                         FadeTransition(
//                       opacity: Tween<double>(
//                         begin: 0,
//                         end: 1,
//                       ).animate(animation),
//                       child: Padding(
//                         padding: EdgeInsets.all(5),
//                         child: Card(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(4.0),
//                           ),
//                           elevation: 6,
//                           margin: EdgeInsets.all(5),
//                           child: ExpansionTile(
//                             initiallyExpanded: true,
//                             title: Text(
//                               "Protections",
//                               style: TextStyle(
//                                 fontSize: 18.0,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                               textAlign: TextAlign.center,
//                             ),
//                             children: <Widget>[
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     flex: 2,
//                                     child: Image(
//                                       image: AssetImage('assets/broke.png'),
//                                       height: 25,
//                                       width: 25,
//                                     ),
//                                   ),
//                                   // Padding(padding: EdgeInsets.all(2)),
//                                   Expanded(
//                                     flex: 7,
//                                     child: Column(
//                                       //mainAxisAlignment: MainAxisAlignment.start,
//                                       children: [
//                                         Text('Personal Accidental Insurance'),
//                                         Text(
//                                           'AED : ' +
//                                               fData.chc1.toString() +
//                                               ' per Day',
//                                           style: stt,
//                                           //textAlign: TextAlign.right,
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                   // Padding(padding: EdgeInsets.all(2)),
//                                   Expanded(
//                                       flex: 2,
//                                       child: Checkbox(
//                                           value: car.ch1,
//                                           onChanged: (bool newValue) {
//                                             car.fch1();
//                                             // print(car.ch1.toString());
//                                           }))
//                                 ],
//                               ),
//                               SizedBox(height: 15),

//                               // SizedBox(height: 15),
//                               Row(
//                                 children: [
//                                   Expanded(
//                                     flex: 2,
//                                     child: Image(
//                                       image: AssetImage('assets/shield.png'),
//                                       height: 25,
//                                       width: 25,
//                                     ),
//                                   ),
//                                   // Padding(padding: EdgeInsets.all(2)),
//                                   Expanded(
//                                     flex: 7,
//                                     child: Column(
//                                       //mainAxisAlignment: MainAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           'Basic Insurance with AED 1500 Excess',
//                                           textAlign: TextAlign.center,
//                                         ),
//                                         Text(
//                                           'AED : 0 per Day', style: stt,
//                                           //textAlign: TextAlign.right,
//                                         )
//                                       ],
//                                     ),
//                                   ),
//                                   // Padding(padding: EdgeInsets.all(2)),
//                                   Expanded(
//                                       flex: 2,
//                                       child: Checkbox(
//                                           value: car.ch3,
//                                           onChanged: (bool newValue) {
//                                             car.fch3();
//                                             // print(car.ch3.toString());
//                                           }))
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 15,
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),

// ////////////Column 4 end/////////////////////////////
// /////////////Column 5 Start/////////////////////////////
//                   AnimateIfVisible(
//                     key: Key('item.8'),
//                     duration: Duration(milliseconds: 200),
//                     builder: (
//                       context,
//                       Animation<double> animation,
//                     ) =>
//                         FadeTransition(
//                       opacity: Tween<double>(
//                         begin: 0,
//                         end: 1,
//                       ).animate(animation),
//                       child: Card(
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(4.0),
//                         ),
//                         elevation: 6,
//                         margin: EdgeInsets.all(10),
//                         child: Row(
//                           children: [
//                             Expanded(
//                               flex: 2,
//                               child: Image(
//                                 image: AssetImage('assets/money1.png'),
//                                 height: 25,
//                                 width: 25,
//                               ),
//                             ),
//                             // Padding(padding: EdgeInsets.all(2)),
//                             Expanded(
//                               flex: 7,
//                               child: Column(
//                                 //mainAxisAlignment: MainAxisAlignment.start,
//                                 children: [
//                                   Text('Collision Damage Waiver Cover'),
//                                   Text(
//                                     'AED :' +
//                                         fData.chc2.toString() +
//                                         '  Per Day',
//                                     style: stt,
//                                     //textAlign: TextAlign.right,
//                                   )
//                                 ],
//                               ),
//                             ),
//                             // Padding(padding: EdgeInsets.all(2)),
//                             Expanded(
//                               flex: 2,
//                               child: Checkbox(
//                                   value: car.ch2,
//                                   onChanged: (bool) {
//                                     car.fch2();
//                                     // print(car.ch2.toString());
//                                   }),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
// ////////////Column 5 end/////////////////////////////
// ////////////Column 6 Start/////////////////////////////
//                   // AnimateIfVisible(
//                   //   key: Key('item.9'),
//                   //   duration: Duration(milliseconds: 500),
//                   //   builder: (
//                   //     context,
//                   //     Animation<double> animation,
//                   //   ) =>
//                   //       FadeTransition(
//                   //     opacity: Tween<double>(
//                   //       begin: 0,
//                   //       end: 1,
//                   //     ).animate(animation),
//                   //     child: Card(
//                   //       shape: RoundedRectangleBorder(
//                   //         borderRadius: BorderRadius.circular(4.0),
//                   //       ),
//                   //       elevation: 6,
//                   //       margin: EdgeInsets.all(10),
//                   //       child: Row(
//                   //         children: [
//                   //           Expanded(
//                   //             flex: 2,
//                   //             child: Image(
//                   //               image: AssetImage('assets/money1.png'),
//                   //               height: 25,
//                   //               width: 25,
//                   //             ),
//                   //           ),
//                   //           // Padding(padding: EdgeInsets.all(2)),
//                   //           Expanded(
//                   //             flex: 7,
//                   //             child: Column(
//                   //               //mainAxisAlignment: MainAxisAlignment.start,
//                   //               children: [
//                   //                 Text('Redeem Autolease Money Point'),
//                   //                 Text(
//                   //                   'Totel :' + AutoLeaseMoney.toString(),
//                   //                   style: stt,
//                   //                   //textAlign: TextAlign.right,
//                   //                 )
//                   //               ],
//                   //             ),
//                   //           ),
//                   //           // Padding(padding: EdgeInsets.all(2)),
//                   //           Expanded(
//                   //             flex: 2,
//                   //             child: Checkbox(
//                   //                 value: car.chM,
//                   //                 onChanged: (bool) {
//                   //                   car.fchM();
//                   //                 }),
//                   //           )
//                   //         ],
//                   //       ),
//                   //     ),
//                   //   ),
//                   // ),
// ////////////Column 6 end///////////////////////////
// ////////////Column 7 Start/////////////////////////////
//                   // AnimateIfVisible(
//                   //   key: Key('item.4'),
//                   //   duration: Duration(milliseconds: 500),
//                   //   builder: (
//                   //     context,
//                   //     Animation<double> animation,
//                   //   ) =>
//                   //       FadeTransition(
//                   //     opacity: Tween<double>(
//                   //       begin: 0,
//                   //       end: 1,
//                   //     ).animate(animation),
//                   //     child: Padding(
//                   //       padding: EdgeInsets.all(5),
//                   //       child: Card(
//                   //         shape: RoundedRectangleBorder(
//                   //           borderRadius: BorderRadius.circular(4.0),
//                   //         ),
//                   //         elevation: 6,
//                   //         margin: EdgeInsets.all(5),
//                   //         child: ExpansionTile(
//                   //           initiallyExpanded: false,
//                   //           title: Row(
//                   //             children: [
//                   //               Expanded(
//                   //                 flex: 10,
//                   //                 child: Text(
//                   //                   "Total : " +
//                   //                       car.totel.toString() +
//                   //                       ' AED /' +
//                   //                       BookingMode,
//                   //                   style: TextStyle(
//                   //                     fontSize: 20.0,
//                   //                     fontWeight: FontWeight.bold,
//                   //                   ),
//                   //                   textAlign: TextAlign.center,
//                   //                 ),
//                   //               ),
//                   //               SizedBox(
//                   //                 width: 2,
//                   //               )
//                   //             ],
//                   //           ),
//                   //           children: <Widget>[
//                   //             Column(
//                   //               children: [
//                   //                 Text('Price Summary'),
//                   //                 SizedBox(
//                   //                   height: 6,
//                   //                 ),
//                   //                 Row(
//                   //                   mainAxisAlignment: MainAxisAlignment.center,
//                   //                   children: [
//                   //                     SizedBox(
//                   //                       width: 30,
//                   //                     ),
//                   //                     Expanded(
//                   //                         flex: 6,
//                   //                         child: Text('Car hire fee for a  ' +
//                   //                             BookingMode)),
//                   //                     Expanded(flex: 2, child: Text('AED')),
//                   //                     Expanded(
//                   //                         flex: 2,
//                   //                         child: Text(car.current1.toString()))
//                   //                   ],
//                   //                 ),
//                   //                 SizedBox(
//                   //                   height: 2,
//                   //                 ),
//                   //                 Row(
//                   //                   children: [
//                   //                     SizedBox(
//                   //                       width: 30,
//                   //                     ),
//                   //                     Expanded(
//                   //                         flex: 6,
//                   //                         child: Text('Additional Driver x ' +
//                   //                             car.driver.toString())),
//                   //                     Expanded(flex: 2, child: Text('AED')),
//                   //                     Expanded(
//                   //                         flex: 2,
//                   //                         child:
//                   //                             Text(car.driverTotal.toString()))
//                   //                   ],
//                   //                 ),
//                   //                 SizedBox(
//                   //                   height: 2,
//                   //                 ),
//                   //                 Row(
//                   //                   children: [
//                   //                     SizedBox(
//                   //                       width: 30,
//                   //                     ),
//                   //                     Expanded(
//                   //                         flex: 6,
//                   //                         child: Text('Child Infant Seat X' +
//                   //                             car.cseat.toString())),
//                   //                     Expanded(flex: 2, child: Text('AED')),
//                   //                     Expanded(
//                   //                         flex: 2,
//                   //                         child: Text(car.cTotel.toString()))
//                   //                   ],
//                   //                 ),
//                   //                 SizedBox(
//                   //                   height: 2,
//                   //                 ),
//                   //                 Row(
//                   //                   children: [
//                   //                     SizedBox(
//                   //                       width: 30,
//                   //                     ),
//                   //                     Expanded(flex: 6, child: Text('PAI')),
//                   //                     Expanded(flex: 2, child: Text('AED')),
//                   //                     Expanded(
//                   //                         flex: 2,
//                   //                         child: Text(
//                   //                             car.temppaicost.toString() ==
//                   //                                     'null'
//                   //                                 ? pai
//                   //                                 : car.temppaicost.toString()))
//                   //                   ],
//                   //                 ),
//                   //                 SizedBox(
//                   //                   height: 2,
//                   //                 ),
//                   //                 Row(
//                   //                   children: [
//                   //                     SizedBox(
//                   //                       width: 30,
//                   //                     ),
//                   //                     Expanded(flex: 6, child: Text('CDW ')),
//                   //                     Expanded(flex: 2, child: Text('AED')),
//                   //                     Expanded(
//                   //                         flex: 2,
//                   //                         child:
//                   //                             Text(car.tempcdwcost.toString()))
//                   //                   ],
//                   //                 ),
//                   //                 SizedBox(
//                   //                   height: 5,
//                   //                 ),
//                   //                 Row(
//                   //                   children: [
//                   //                     SizedBox(
//                   //                       width: 30,
//                   //                     ),
//                   //                     Expanded(
//                   //                         flex: 6,
//                   //                         child: Text(
//                   //                           'Total ',
//                   //                           style: TextStyle(
//                   //                             fontSize: 15.0,
//                   //                             fontWeight: FontWeight.bold,
//                   //                           ),
//                   //                           textAlign: TextAlign.center,
//                   //                         )),
//                   //                     Expanded(flex: 2, child: Text('AED')),
//                   //                     Expanded(
//                   //                         flex: 2,
//                   //                         child: Text(car.totel.toString()))
//                   //                   ],
//                   //                 ),
//                   //                 SizedBox(
//                   //                   height: 8,
//                   //                 ),
//                   //               ],
//                   //             )
//                   //           ],
//                   //         ),
//                   //       ),
//                   //     ),
//                   //   ),
//                   // ),
// ////////////Column 7 end/////////////////////////////
// ///////////////Column 8 Start////////////////////////
//                   AnimateIfVisible(
//                     key: Key('item.5'),
//                     duration: Duration(milliseconds: 200),
//                     builder: (
//                       context,
//                       Animation<double> animation,
//                     ) =>
//                         FadeTransition(
//                       opacity: Tween<double>(
//                         begin: 0,
//                         end: 1,
//                       ).animate(animation),
//                       child: Padding(
//                         padding: EdgeInsets.all(5),
//                         child: Card(
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(4.0),
//                           ),
//                           elevation: 6,
//                           margin: EdgeInsets.all(5),
//                           child: Column(
//                             children: <Widget>[
//                               Container(
//                                   padding: EdgeInsets.all(20),
//                                   margin: EdgeInsets.all(4),
//                                   child: Text(
//                                     'All extras are paid for at pick-up availability is not always guaranteed and prices are subject to change. child seats are mandatory for children under 12 years old or 135cm in height',
//                                     textAlign: TextAlign.center,
//                                   )),
//                               FlatButton(
//                                 color: Colors.orange[900],
//                                 textColor: Colors.white,
//                                 disabledColor: Colors.grey,
//                                 disabledTextColor: Colors.black,
//                                 padding: EdgeInsets.all(8.0),
//                                 splashColor: Colors.orange[400],
//                                 onPressed: (() {
//                                   print('Book Now Pressed');
//                                   car.location();
//                                   car.carid = fData.id1;
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                         builder: (context) => MapSample()),
//                                   );
//                                   // Navigator.pop(context);
//                                 }),
//                                 child: Text('CONTINUE'),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
// ////////////Column 8 end/////////////////////////////
//                 ],
//               ),
//               headerSliverBuilder:
//                   (BuildContext context, bool innerBoxIsScrolled) {
//                 return <Widget>[
//                   SliverOverlapAbsorber(
//                     handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
//                         context),
//                     sliver: SliverAppBar(
//                       title: Text(fData.name),
//                       backgroundColor: Colors.grey[700],
//                       pinned: false,
//                       floating: false,
//                       // forceElevated: innerBoxIsScrolled,
//                     ),
//                   ),
//                 ];
//               },
//             )));

//     // return Scaffold(
//     //     appBar: AppBar(
//     //       title: Text(fData.name),
//     //       backgroundColor: Colors.black87,
//     //     ),
//     //     body: SingleChildScrollView(
//     //         child: Column(
//     //       children: [
//     //         Container(
//     //             // margin: new EdgeInsets.only(
//     //             //     left: 20.0, right: 20.0, top: 8.0, bottom: 5.0),
//     //             // shape: RoundedRectangleBorder(
//     //             //     borderRadius: BorderRadius.circular(10.0)),
//     //             // elevation: 4.0,
//     //             // margin: EdgeInsets.all(10),

//     //             color: Colors.white,
//     //             child: Column(
//     //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//     //               crossAxisAlignment: CrossAxisAlignment.center,
//     //               children: [
//     //                 // Card(margin: EdgeInsets.all(1)),
//     //                 Column(
//     //                   children: [
//     //                     Image.asset(
//     //                       fData.imageurl,
//     //                       fit: BoxFit.cover,
//     //                     ),
//     //                     Text(
//     //                       fData.name,
//     //                       style: TextStyle(
//     //                           fontSize: 16, fontWeight: FontWeight.bold),
//     //                     )
//     //                   ],
//     //                 ),
//     //                 SizedBox(
//     //                   height: 10,
//     //                 ),
//     //                 Row(
//     //                   mainAxisAlignment: MainAxisAlignment.center,
//     //                   crossAxisAlignment: CrossAxisAlignment.center,
//     //                   children: [
//     //                     Expanded(
//     //                       flex: 1,
//     //                       child: Column(children: [
//     //                         Image(
//     //                           image: AssetImage('assets/seat.png'),
//     //                           height: 25,
//     //                           width: 25,
//     //                         ),
//     //                         Text('Seat'),
//     //                         SizedBox(height: 10),
//     //                         Text(fData.seat),
//     //                       ]),
//     //                     ),
//     //                     Expanded(
//     //                       flex: 1,
//     //                       child: Column(children: [
//     //                         Image(
//     //                           image: AssetImage('assets/lugg.png'),
//     //                           height: 25,
//     //                           width: 25,
//     //                         ),
//     //                         Text('Lugg'),
//     //                         SizedBox(height: 10),
//     //                         Text(fData.luggage),
//     //                       ]),
//     //                     ),
//     //                     Expanded(
//     //                       flex: 1,
//     //                       child: Column(children: [
//     //                         Image(
//     //                           image: AssetImage('assets/engine.png'),
//     //                           height: 25,
//     //                           width: 25,
//     //                         ),
//     //                         Text('Engin'),
//     //                         SizedBox(height: 10),
//     //                         Text(fData.engin),
//     //                       ]),
//     //                     ),
//     //                     Expanded(
//     //                       flex: 1,
//     //                       child: Column(children: [
//     //                         Image(
//     //                           image: AssetImage('assets/ac.png'),
//     //                           height: 25,
//     //                           width: 25,
//     //                         ),
//     //                         Text('AC'),
//     //                         SizedBox(height: 10),
//     //                         Text(fData.ac),
//     //                       ]),
//     //                     ),
//     //                     Expanded(
//     //                       flex: 1,
//     //                       child: Column(children: [
//     //                         Image(
//     //                           image: AssetImage('assets/gear1.png'),
//     //                           height: 25,
//     //                           width: 25,
//     //                         ),
//     //                         Text('Gear'),
//     //                         SizedBox(height: 10),
//     //                         Text(fData.gear),
//     //                       ]),
//     //                     ),
//     //                     Expanded(
//     //                       flex: 1,
//     //                       child: Column(children: [
//     //                         Image(
//     //                           image: AssetImage('assets/door.png'),
//     //                           height: 25,
//     //                           width: 25,
//     //                         ),
//     //                         Text('Door'),
//     //                         SizedBox(height: 10),
//     //                         Text(fData.door),
//     //                       ]),
//     //                     ),
//     //                   ],
//     //                 ),
//     //                 SizedBox(height: 5),
//     //                 ExpansionTile(
//     //                   initiallyExpanded: true,
//     //                   // childrenPadding: EdgeInsets.all(4),
//     //                   title: Text(
//     //                     "Extras",
//     //                     style: TextStyle(
//     //                       fontSize: 18.0,
//     //                       fontWeight: FontWeight.bold,
//     //                     ),
//     //                     textAlign: TextAlign.center,
//     //                   ),
//     //                   children: <Widget>[
//     //                     Row(
//     //                       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     //                       // crossAxisAlignment: CrossAxisAlignment.center,
//     //                       children: [
//     //                         Expanded(
//     //                           flex: 2,
//     //                           child: Image(
//     //                             image: AssetImage('assets/driver.png'),
//     //                             height: 25,
//     //                             width: 25,
//     //                           ),
//     //                         ),
//     //                         // Padding(padding: EdgeInsets.all(2)),
//     //                         Expanded(
//     //                           flex: 4,
//     //                           child: Column(
//     //                             //mainAxisAlignment: MainAxisAlignment.start,
//     //                             children: [
//     //                               Text(
//     //                                 'Additional Driver',
//     //                                 style: TextStyle(fontSize: 14),
//     //                               ),
//     //                               Text(
//     //                                 'ADE :' + car.driverTotal.toString(),
//     //                                 style: stt,
//     //                                 //textAlign: TextAlign.right,
//     //                               )
//     //                             ],
//     //                           ),
//     //                         ),
//     //                         // Padding(padding: EdgeInsets.all(2)),
//     //                         Expanded(
//     //                           flex: 1,
//     //                           child: InkWell(
//     //                             onTap: () {
//     //                               car.subDriiver();
//     //                               print(
//     //                                   'no Of Driver ' + car.driver.toString());
//     //                             },
//     //                             child: Image(
//     //                               image: AssetImage('assets/sub.png'),
//     //                               height: 25,
//     //                               width: 25,
//     //                             ),
//     //                           ),
//     //                         ),
//     //                         // Padding(padding: EdgeInsets.all(2)),
//     //                         Expanded(
//     //                             flex: 2,
//     //                             child: Text(
//     //                               car.driver.toString(),
//     //                               textAlign: TextAlign.center,
//     //                             )),
//     //                         Padding(padding: EdgeInsets.all(2)),
//     //                         Expanded(
//     //                           flex: 2,
//     //                           child: InkWell(
//     //                             onTap: () {
//     //                               car.addDriver();
//     //                               print(car.driver.toString());
//     //                             },
//     //                             child: Image(
//     //                               image: AssetImage('assets/add.png'),
//     //                               height: 25,
//     //                               width: 25,
//     //                             ),
//     //                           ),
//     //                         )
//     //                       ],
//     //                     ),
//     //                     SizedBox(height: 15),
//     //                     Row(
//     //                       children: [
//     //                         Expanded(
//     //                           flex: 2,
//     //                           child: Image(
//     //                             image: AssetImage('assets/gps.png'),
//     //                             height: 25,
//     //                             width: 25,
//     //                           ),
//     //                         ),
//     //                         // Padding(padding: EdgeInsets.all(2)),
//     //                         Expanded(
//     //                           flex: 4,
//     //                           child: Column(
//     //                             //mainAxisAlignment: MainAxisAlignment.start,
//     //                             children: [
//     //                               Text('GPS', style: TextStyle(fontSize: 14)),
//     //                               Text(
//     //                                 'ADE : ' + car.gpsTotel.toString(),
//     //                                 style: stt,
//     //                                 //textAlign: TextAlign.right,
//     //                               ),
//     //                             ],
//     //                           ),
//     //                         ),
//     //                         // Padding(padding: EdgeInsets.all(2)),
//     //                         Expanded(
//     //                           flex: 1,
//     //                           child: InkWell(
//     //                             onTap: () {
//     //                               print('sub');
//     //                               car.subgps();
//     //                               print('no Of gps ' + car.gps.toString());
//     //                             },
//     //                             child: Image(
//     //                               image: AssetImage('assets/sub.png'),
//     //                               height: 25,
//     //                               width: 25,
//     //                             ),
//     //                           ),
//     //                         ),
//     //                         // Padding(padding: EdgeInsets.all(2)),
//     //                         Expanded(
//     //                             flex: 2,
//     //                             child: Text(
//     //                               car.gps.toString(),
//     //                               textAlign: TextAlign.center,
//     //                             )),
//     //                         // Padding(padding: EdgeInsets.all(2)),
//     //                         Expanded(
//     //                           flex: 2,
//     //                           child: InkWell(
//     //                             onTap: () {
//     //                               print('add');
//     //                               car.addgps();
//     //                               print(car.driver.toString());
//     //                             },
//     //                             child: Image(
//     //                               image: AssetImage('assets/add.png'),
//     //                               height: 25,
//     //                               width: 25,
//     //                             ),
//     //                           ),
//     //                         )
//     //                       ],
//     //                     ),
//     //                     SizedBox(height: 15),
//     //                     Row(
//     //                       children: [
//     //                         Expanded(
//     //                           flex: 2,
//     //                           child: Image(
//     //                             image: AssetImage('assets/child.png'),
//     //                             height: 25,
//     //                             width: 25,
//     //                           ),
//     //                         ),
//     //                         // Padding(padding: EdgeInsets.all(2)),
//     //                         Expanded(
//     //                           flex: 4,
//     //                           child: Column(
//     //                             //mainAxisAlignment: MainAxisAlignment.start,
//     //                             children: [
//     //                               Text(
//     //                                 'Chaild Infant Seat ',
//     //                                 style: TextStyle(fontSize: 13),
//     //                               ),
//     //                               Text(
//     //                                 'ADE : ' + car.cTotel.toString(),
//     //                                 style: stt,
//     //                                 //textAlign: TextAlign.right,
//     //                               )
//     //                             ],
//     //                           ),
//     //                         ),
//     //                         // Padding(padding: EdgeInsets.all(2)),
//     //                         Expanded(
//     //                           flex: 1,
//     //                           child: InkWell(
//     //                             onTap: () {
//     //                               print('sub');
//     //                               car.subCseat();
//     //                               print('no Of Driver ' + car.cseat.toString());
//     //                             },
//     //                             child: Image(
//     //                               image: AssetImage('assets/sub.png'),
//     //                               height: 25,
//     //                               width: 25,
//     //                             ),
//     //                           ),
//     //                         ),
//     //                         // Padding(padding: EdgeInsets.all(2)),
//     //                         Expanded(
//     //                             flex: 2,
//     //                             child: Text(
//     //                               car.cseat.toString(),
//     //                               textAlign: TextAlign.center,
//     //                             )),
//     //                         // Padding(padding: EdgeInsets.all(2)),
//     //                         Expanded(
//     //                           flex: 2,
//     //                           child: InkWell(
//     //                             onTap: () {
//     //                               print('add');
//     //                               car.addCseat();
//     //                               print(car.driver.toString());
//     //                             },
//     //                             child: Image(
//     //                               image: AssetImage('assets/add.png'),
//     //                               height: 25,
//     //                               width: 25,
//     //                             ),
//     //                           ),
//     //                         )
//     //                       ],
//     //                     ),
//     //                     SizedBox(
//     //                       height: 10,
//     //                     )
//     //                   ],
//     //                 ),
//     //                 //end of extras/////////////////////////////////////////////////////////////////////////////////

//     //                 //protections //////////////////////////////////////////////////////////////////////////////////
//     //                 ExpansionTile(
//     //                   initiallyExpanded: true,
//     //                   title: Text(
//     //                     "Protections",
//     //                     style: TextStyle(
//     //                       fontSize: 18.0,
//     //                       fontWeight: FontWeight.bold,
//     //                     ),
//     //                     textAlign: TextAlign.center,
//     //                   ),
//     //                   children: <Widget>[
//     //                     Row(
//     //                       children: [
//     //                         Expanded(
//     //                           flex: 2,
//     //                           child: Image(
//     //                             image: AssetImage('assets/broke.png'),
//     //                             height: 25,
//     //                             width: 25,
//     //                           ),
//     //                         ),
//     //                         // Padding(padding: EdgeInsets.all(2)),
//     //                         Expanded(
//     //                           flex: 7,
//     //                           child: Column(
//     //                             //mainAxisAlignment: MainAxisAlignment.start,
//     //                             children: [
//     //                               Text('Personal Accidental Insurance'),
//     //                               Text(
//     //                                 'ADE : 5 per Day', style: stt,
//     //                                 //textAlign: TextAlign.right,
//     //                               )
//     //                             ],
//     //                           ),
//     //                         ),
//     //                         // Padding(padding: EdgeInsets.all(2)),
//     //                         Expanded(
//     //                             flex: 2,
//     //                             child: Checkbox(
//     //                                 value: car.ch1,
//     //                                 onChanged: (bool newValue) {
//     //                                   car.fch(1);
//     //                                   print(car.ch1.toString());
//     //                                 }))
//     //                       ],
//     //                     ),
//     //                     SizedBox(height: 15),
//     //                     Row(
//     //                       children: [
//     //                         Expanded(
//     //                           flex: 2,
//     //                           child: Image(
//     //                             image: AssetImage('assets/money1.png'),
//     //                             height: 25,
//     //                             width: 25,
//     //                           ),
//     //                         ),
//     //                         // Padding(padding: EdgeInsets.all(2)),
//     //                         Expanded(
//     //                           flex: 7,
//     //                           child: Column(
//     //                             //mainAxisAlignment: MainAxisAlignment.start,
//     //                             children: [
//     //                               Text('Collision Damage Waiver Cover'),
//     //                               Text(
//     //                                 'ADE : 30.00  Per Day', style: stt,
//     //                                 //textAlign: TextAlign.right,
//     //                               )
//     //                             ],
//     //                           ),
//     //                         ),
//     //                         // Padding(padding: EdgeInsets.all(2)),
//     //                         Expanded(
//     //                           flex: 2,
//     //                           child: Checkbox(
//     //                               value: car.ch2,
//     //                               onChanged: (bool) {
//     //                                 car.fch(2);
//     //                                 print(car.ch2.toString());
//     //                               }),
//     //                         )
//     //                       ],
//     //                     ),
//     //                     SizedBox(height: 15),
//     //                     Row(
//     //                       children: [
//     //                         Expanded(
//     //                           flex: 2,
//     //                           child: Image(
//     //                             image: AssetImage('assets/shield.png'),
//     //                             height: 25,
//     //                             width: 25,
//     //                           ),
//     //                         ),
//     //                         // Padding(padding: EdgeInsets.all(2)),
//     //                         Expanded(
//     //                           flex: 7,
//     //                           child: Column(
//     //                             //mainAxisAlignment: MainAxisAlignment.start,
//     //                             children: [
//     //                               Text(
//     //                                 'Basic Insurance with AED 1500 Excess',
//     //                                 textAlign: TextAlign.center,
//     //                               ),
//     //                               Text(
//     //                                 'ADE : 00 per Day', style: stt,
//     //                                 //textAlign: TextAlign.right,
//     //                               )
//     //                             ],
//     //                           ),
//     //                         ),
//     //                         // Padding(padding: EdgeInsets.all(2)),
//     //                         Expanded(
//     //                             flex: 2,
//     //                             child: Checkbox(
//     //                                 value: car.ch3,
//     //                                 onChanged: (bool newValue) {
//     //                                   car.fch(3);
//     //                                   print(car.ch3.toString());
//     //                                 }))
//     //                       ],
//     //                     )
//     //                   ],
//     //                 ),
//     //                 ExpansionTile(
//     //                   initiallyExpanded: false,
//     //                   title: Row(
//     //                     children: [
//     //                       Expanded(
//     //                         flex: 4,
//     //                         child: Text(
//     //                           "Total :",
//     //                           style: TextStyle(
//     //                             fontSize: 20.0,
//     //                             fontWeight: FontWeight.bold,
//     //                           ),
//     //                           textAlign: TextAlign.center,
//     //                         ),
//     //                       ),
//     //                       Expanded(
//     //                           flex: 6,
//     //                           child: Text(
//     //                             car.totel.toString() + ' AED',
//     //                             style: TextStyle(
//     //                               fontSize: 20.0,
//     //                               fontWeight: FontWeight.bold,
//     //                             ),
//     //                             textAlign: TextAlign.center,
//     //                           )),
//     //                       SizedBox(
//     //                         width: 2,
//     //                       )
//     //                     ],
//     //                   ),
//     //                   children: <Widget>[
//     //                     Column(
//     //                       children: [
//     //                         Text('Price Summary'),
//     //                         SizedBox(
//     //                           height: 6,
//     //                         ),
//     //                         Row(
//     //                           mainAxisAlignment: MainAxisAlignment.center,
//     //                           children: [
//     //                             SizedBox(
//     //                               width: 30,
//     //                             ),
//     //                             Expanded(
//     //                                 flex: 6,
//     //                                 child: Text('Car hire fee for a day ')),
//     //                             Expanded(flex: 2, child: Text('AED')),
//     //                             Expanded(flex: 2, child: Text('69'))
//     //                           ],
//     //                         ),
//     //                         SizedBox(
//     //                           height: 2,
//     //                         ),
//     //                         Row(
//     //                           children: [
//     //                             SizedBox(
//     //                               width: 30,
//     //                             ),
//     //                             Expanded(
//     //                                 flex: 6,
//     //                                 child: Text('Additional Driver x ' +
//     //                                     car.driver.toString())),
//     //                             Expanded(flex: 2, child: Text('AED')),
//     //                             Expanded(
//     //                                 flex: 2,
//     //                                 child: Text(car.driverTotal.toString()))
//     //                           ],
//     //                         ),
//     //                         SizedBox(
//     //                           height: 2,
//     //                         ),
//     //                         Row(
//     //                           children: [
//     //                             SizedBox(
//     //                               width: 30,
//     //                             ),
//     //                             Expanded(flex: 6, child: Text('GPS  ')),
//     //                             Expanded(flex: 2, child: Text('AED')),
//     //                             Expanded(
//     //                                 flex: 2,
//     //                                 child: Text(car.gpsTotel.toString()))
//     //                           ],
//     //                         ),
//     //                         SizedBox(
//     //                           height: 2,
//     //                         ),
//     //                         Row(
//     //                           children: [
//     //                             SizedBox(
//     //                               width: 30,
//     //                             ),
//     //                             Expanded(flex: 6, child: Text('PAI')),
//     //                             Expanded(flex: 2, child: Text('AED')),
//     //                             Expanded(
//     //                                 flex: 2, child: Text(car.chc1.toString()))
//     //                           ],
//     //                         ),
//     //                         SizedBox(
//     //                           height: 2,
//     //                         ),
//     //                         Row(
//     //                           children: [
//     //                             SizedBox(
//     //                               width: 30,
//     //                             ),
//     //                             Expanded(flex: 6, child: Text('CDW ')),
//     //                             Expanded(flex: 2, child: Text('AED')),
//     //                             Expanded(
//     //                                 flex: 2, child: Text(car.chc2.toString()))
//     //                           ],
//     //                         ),
//     //                         SizedBox(
//     //                           height: 5,
//     //                         ),
//     //                         Row(
//     //                           children: [
//     //                             SizedBox(
//     //                               width: 30,
//     //                             ),
//     //                             Expanded(
//     //                                 flex: 6,
//     //                                 child: Text(
//     //                                   'Total ',
//     //                                   style: TextStyle(
//     //                                     fontSize: 15.0,
//     //                                     fontWeight: FontWeight.bold,
//     //                                   ),
//     //                                   textAlign: TextAlign.center,
//     //                                 )),
//     //                             Expanded(flex: 2, child: Text('AED')),
//     //                             Expanded(
//     //                                 flex: 2, child: Text(car.totel.toString()))
//     //                           ],
//     //                         ),
//     //                         SizedBox(
//     //                           height: 2,
//     //                         ),
//     //                       ],
//     //                     )
//     //                   ],
//     //                 ),
//     //                 Container(
//     //                     padding: EdgeInsets.all(20),
//     //                     margin: EdgeInsets.all(4),
//     //                     child: Text(
//     //                       'All extras are paid for at pick-up availability is not always guranteed and prices are subject to change. child seats are mandatory for children ubder 12 years old or 135cm in height',
//     //                       textAlign: TextAlign.center,
//     //                     )),
//     //                 FlatButton(
//     //                   color: Colors.orange[900],
//     //                   textColor: Colors.white,
//     //                   disabledColor: Colors.grey,
//     //                   disabledTextColor: Colors.black,
//     //                   padding: EdgeInsets.all(8.0),
//     //                   splashColor: Colors.orange[400],
//     //                   onPressed: (() {
//     //                     print('Book Now Pressed');
//     //                     car.location();
//     //                     car.carid = fData.id1;
//     //                     Navigator.push(
//     //                       context,
//     //                       MaterialPageRoute(builder: (context) => Payment()),
//     //                     );
//     //                     // Navigator.pop(context);
//     //                   }),
//     //                   child: Text('CONTINUE'),
//     //                 )
//     //               ],
//     //             )),
//     //       ],
//     //     )));
//   }
// }
