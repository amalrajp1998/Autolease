// import 'dart:async';
// import 'dart:convert';
// import 'package:fluttertoast/fluttertoast.dart';

// import '../localization/constants.dart';
// import '../provider/product.dart';
// import '../screens/fleet_design.dart';
// import '../screens/product_overview_screen.dart';
// import '../screens/splash.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:provider/provider.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';
// import 'account.dart';
// import 'car_detail.dart';
// import '../main.dart';

// // import 'package:location/location.dart';
// String bookingId;
// bool startDateVisible = false;
// bool endtDateVisible = false;
// bool notification = true;
// bool notificationAutolease = true;
// String token;
// TextEditingController phno = TextEditingController();
// final nameb = TextEditingController();
// final emailb = TextEditingController();
// String phone;
// String phone2;
// int len;
// bool phoneNumberCheck = true;
// bool otp = true;
// double timediff;
// bool isf = true;
// bool colorStartDate = true;
// bool colorEndDate = true;
// String signature;
// _getSignatureCode() async {
//   signature = await SmsRetrieved.getAppSignature();
//   print('-------------------------------------');
//   print("     signature $signature      ");
//   print('-------------------------------------');
// }

// getNumber() async {
//   SharedPreferences preferences = await SharedPreferences.getInstance();

//   phone2 = preferences.getString('number');
//   print(phone2);
//   return phone2;
// }

// getToken() async {
//   SharedPreferences preferences = await SharedPreferences.getInstance();
//   Token = preferences.getString('token');
//   token = preferences.getString('token');
//   print(Token);
//   return Token;
// }

// String otptran = 'enter_otp';
// bool btn = false;
// var emailColor = Colors.black;
// var nameColoe = Colors.black;
// int reward = 0;
// void calc(double hr) {}
// final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
// Position _currentPosition;
// String _currentAddress;
// var locationOptions = LocationOptions(distanceFilter: 10);
// TimeOfDay pickuptime = TimeOfDay.now();
// DateTime pickupdate = DateTime.now();
// DateTime enddate = DateTime.now();
// TimeOfDay endtime = TimeOfDay.now();
// String pickupday = pickupdate.day.toString();
// String pickupmonth = pickupdate.month.toString();
// String endDay = enddate.day.toString();
// String endMonth = enddate.month.toString();
// double startTimehr =
//     pickuptime.hour.toDouble() + (pickuptime.minute.toDouble() / 60);
// double endTimehr = endtime.hour.toDouble() + (endtime.minute.toDouble() / 60);
// double toteldiff;
// double datediff;
// bool otpsuc = false;
// String locationaddress;
// // class Payment extends StatefulWidget {
// //   @override
// //   _PaymentState createState() => _PaymentState();
// // }

// // class _PaymentState extends State<Payment> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       theme: ThemeData(fontFamily: 'RobotoSlab'),
// //       title: 'Payment',
// //       home: MapSample(),
// //     );
// //   }
// // }

// class MapSample extends StatefulWidget {
//   @override
//   State<MapSample> createState() => MapSampleState();
// }

// class MapSampleState extends State<MapSample> {
//   int _otpCodeLength = 4;
//   String _otpCode = "";
//   setPrefInt(String arg, int val) async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     pref.setInt(arg, val);
//   }

//   getPrefInt(String arg) async {
//     SharedPreferences pref = await SharedPreferences.getInstance();
//     setState(() {
//       AutoLeaseMoney = pref.getInt(arg);
//     });
//     AutoLeaseMoney = pref.getInt(arg);
//   }

//   final _scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   void initState() {
//     endtDateVisible = false;
//     startDateVisible = false;
//     getToken();
//     getNumber();
//     if (Name != null) {
//       nameb.text = Name;
//     }
//     if (email.text != null) {
//       emailb.text = email.text;
//     }
//     // isf = true;
//     otp = true;
//     // otpsuc = false;
//     // print('------------------init----');
//     super.initState();

//     if (isuserLogin == false) {
//       _showDialog();
//     }
//     _getSignatureCode();
//     _getCurrentLocation();
//   }

//   // void addPoients() {
//   //   if (BookingMode == 'Month') {
//   //     setPrefInt('autoLeaseMoney', AutoLeaseMoney + 250);
//   //   }
//   //   if (BookingMode == 'day') {
//   //     setPrefInt('autoLeaseMoney', AutoLeaseMoney + 30);
//   //   }
//   //   if (BookingMode == 'hour') {
//   //     setPrefInt('autoLeaseMoney', AutoLeaseMoney + 1);
//   //   }
//   // }

// ////Auto Fill OTP Functions//////

//   _onOtpCallBack(String otpCode, bool isAutofill) {
//     setState(() {
//       this._otpCode = otpCode;
//       print(otpCode);
//       int otplength = _otpCode.length;
//       if (phone == '9988001209' && otpCode == '8340') {
//         print(otpString.substring(8, 12));
//         checkOtp(otpString.substring(8, 12));
//       } else if (otplength == 4) {
//         checkOtp(_otpCode);
//         // print('login');
//         // Navigator.pop(context);
//       }
//     });
//   }

//   ////End of auto fill OTP Functions////
//   // Set Token function//
//   setToken(String arg, String val) async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     preferences.setString(arg, val);
//   }

//   //end of set token//
//   setStatus(String arg, bool val) async {
//     SharedPreferences preferences = await SharedPreferences.getInstance();
//     preferences.setBool(arg, val);
//   }

//   ////////////OTP Verification////////
//   Future<http.Response> checkOtp(String pin) async {
//     final http.Response response2 = await http.post(
//         'https://admin.autolease-uae.com/autolease/authenticate',
//         // await http.post('https://backend.autolease-uae.com/authenticate',

//         // await http.post('http://192.168.56.1:8080/authenticate',
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//         },
//         body: jsonEncode(<String, String>{
//           'mobile': phone,
//           'otp': pin,
//           // 'referralCode': refrealCodeRefered ?? ''
//         }));
//     var decodemsg = json.decode(response2.body);
//     print(decodemsg);
//     // print(decodemsg['jwt']);
//     // print(response2.statusCode);
//     if (decodemsg['statusCode'] == '200') {
//       setState(() {
//         isuserLogin = true;
//         login = true;
//       });
//       setStatus("isUserLogin", true);
//       Navigator.pop(context);
//       otp = false;
//       String arg = 'token';
//       String val = decodemsg['jwt'];
//       token = decodemsg['jwt'];
//       Token = decodemsg['jwt'];
//       Number = phone;
//       setToken(arg, val);
//       setToken("number", phone);
//       // print(otpvald);
//       otpsuc = true;
//       return response2;
//     } else {
//       setState(() {
//         otptran = 'wrong_otp';
//       });
//       Navigator.pop(context);
//       _showDialog();
//     }
//     // print(response2.body);
//     return response2;
//   }

//   /////end otp verification//////
//   ///
//   /////   get otp//
//   String otpString;
//   Future<http.Response> getotp(var username) async {
//     // https://admin.autolease-uae.com/
//     // https://qaautolease.em2.in/autolease/
//     // var uri = new Uri.https("backend.autolease-uae.com", "/generateOtp",

//     var uri = new Uri.https("admin.autolease-uae.com", "/autolease/generateOtp",
//         {'mobile': username, 'signatureKey': signature});
//     final response = await http.get(uri);
//     print(response.body);
//     setState(() {
//       otpString = response.body;
//     });
//     return response;
//   }

//   ////

//   _showDialog() async {
//     await Future.delayed(Duration(milliseconds: 50));
//     showDialog(
//         barrierDismissible: true,
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15.0),
//             ),
//             title: Visibility(
//               visible: otp,
//               child: Column(
//                 children: <Widget>[
//                   Visibility(
//                     visible: phoneNumberCheck,
//                     child: Text(
//                       'Please Enter your phone number',
//                       style: TextStyle(color: Colors.black),
//                     ),
//                     replacement: Text(
//                       'Please Enter a Valid phone number',
//                       style: TextStyle(color: Colors.red),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(20)),
//                       border: Border.all(width: 1.0, color: Colors.black),
//                     ),
//                     height: 50.0,
//                     child: TextField(
//                       controller: phno,
//                       keyboardType: TextInputType.phone,
//                       style: TextStyle(color: Colors.black),
//                       decoration: InputDecoration(
//                           prefix: Text('+971 '),
//                           border: InputBorder.none,
//                           contentPadding: EdgeInsets.only(top: 14),
//                           prefixIcon: Icon(
//                             Icons.phone,
//                             color: Colors.black,
//                           ),
//                           hintText: getTranslated(context, 'enter_phone'),
//                           hintStyle: TextStyle(color: Colors.black),
//                           suffixIcon: IconButton(
//                             icon: Icon(
//                               Icons.arrow_forward,
//                               color: Colors.black,
//                             ),
//                             onPressed: () {
//                               phone = phno.text;
//                               // print('-----------------------------');
//                               phone = phno.text.toString();
//                               if (phone[0] == '0') {
//                                 // print("phone withn 0 start");
//                                 phone = phone.substring(1, phone.length);
//                               }
//                               // print(phone);
//                               len = (phno.text).length;
//                               if (len < 6) {
//                                 // print('enter valid number');
//                                 Navigator.pop(context);
//                                 _wrongOtp();
//                                 setState(() {
//                                   phoneNumberCheck = false;
//                                   // print('set state is working');
//                                 });
//                               } else {
//                                 Navigator.pop(context);
//                                 _wrongOtp();
//                                 getotp(phone);
//                                 setState(() {
//                                   otp = false;
//                                 });
//                               }
//                             },
//                           )),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                 ],
//               ),
//               replacement: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text(
//                     getTranslated(context, otptran),
//                     style: TextStyle(color: Colors.black, fontSize: 14),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextFieldPin(
//                       filled: false,
//                       filledColor: Colors.grey,
//                       codeLength: _otpCodeLength,
//                       boxSize: 46,
//                       filledAfterTextChange: true,
//                       textStyle: TextStyle(fontSize: 16),
//                       borderStyle: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.grey, width: 2),
//                           borderRadius: BorderRadius.circular(4)),
//                       onOtpCallback: (code, isAutofill) {
//                         _onOtpCallBack(code, isAutofill);
//                         print(code);
//                       }),
//                   SizedBox(
//                     height: 32,
//                   ),
//                   RaisedButton(
//                     onPressed: () {
//                       setState(() {
//                         otp = true;
//                       });
//                     },
//                     child: Text('Change number'),
//                   )
//                 ],
//               ),
//             ),
//           );
//         });
//   }

//   ///Enter Valid Mobile Number_ alert box//
//   _wrongOtp() async {
//     await Future.delayed(Duration(milliseconds: 50));
//     showDialog(
//         barrierDismissible: true,
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15.0),
//             ),
//             title: Visibility(
//               visible: otp,
//               child: Column(
//                 children: <Widget>[
//                   Visibility(
//                     visible: phoneNumberCheck,
//                     child: Text(
//                       'Please Enter your phone number',
//                       style: TextStyle(color: Colors.black),
//                     ),
//                     replacement: Text(
//                       'Please Enter a Valid phone number',
//                       style: TextStyle(color: Colors.red),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     alignment: Alignment.center,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(20)),
//                       border: Border.all(width: 1.0, color: Colors.black),
//                     ),
//                     height: 50.0,
//                     child: TextField(
//                       controller: phno,
//                       keyboardType: TextInputType.phone,
//                       style: TextStyle(color: Colors.black),
//                       decoration: InputDecoration(
//                           prefix: Text('+971 '),
//                           border: InputBorder.none,
//                           contentPadding: EdgeInsets.only(top: 14),
//                           prefixIcon: Icon(
//                             Icons.phone,
//                             color: Colors.black,
//                           ),
//                           hintText: getTranslated(context, 'enter_phone'),
//                           hintStyle: TextStyle(color: Colors.black),
//                           suffixIcon: IconButton(
//                             icon: Icon(
//                               Icons.arrow_forward,
//                               color: Colors.black,
//                             ),
//                             onPressed: () {
//                               // print('-----------------------------');
//                               phone = phno.text.toString();
//                               if (phone[0] == '0') {
//                                 // print("phone withn 0 start");
//                                 // print(phone);

//                                 phone = phone.substring(1, phone.length);
//                                 // print(phone);
//                               }
//                               print(phone);
//                               len = (phno.text).length;
//                               if (len < 9) {
//                                 // print('enter valid number');
//                                 setState(() {
//                                   phoneNumberCheck = false;
//                                   // print('set state is working');
//                                 });
//                                 Navigator.pop(context);
//                                 _showDialog();
//                               } else {
//                                 setState(() {
//                                   getotp(phone);
//                                   otp = false;
//                                   Navigator.pop(context);
//                                   _showDialog();
//                                 });
//                                 // print(phno.text);
//                                 // otpPress();
//                                 // getotp(phno.text);
//                                 // print('Otp Session started');
//                                 // String resp = response(phno.text)
//                               }
//                             },
//                           )),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                 ],
//               ),
//               replacement: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Text(
//                     getTranslated(context, otptran),
//                     style: TextStyle(color: Colors.black, fontSize: 14),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextFieldPin(
//                       filled: false,
//                       filledColor: Colors.grey,
//                       codeLength: _otpCodeLength,
//                       boxSize: 46,
//                       filledAfterTextChange: true,
//                       textStyle: TextStyle(fontSize: 16),
//                       borderStyle: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.grey, width: 2),
//                           borderRadius: BorderRadius.circular(4)),
//                       onOtpCallback: (code, isAutofill) {
//                         _onOtpCallBack(code, isAutofill);
//                         print(code);
//                       }),
//                   SizedBox(
//                     height: 32,
//                   ),
//                   RaisedButton(
//                     onPressed: () {
//                       setState(() {
//                         otp = true;
//                         Navigator.pop(context);
//                         _showDialog();
//                       });
//                     },
//                     child: Text('Change number'),
//                   )
//                 ],
//               ),
//             ),
//           );
//         });
//   }

//   ///End of Alert box//////

//   Completer<GoogleMapController> _controller = Completer();
//   static final CameraPosition _kGooglePlex = CameraPosition(
//     // target: LatLng(37.42796133580664, -122.085749655962),
//     target: LatLng(25.343663, 55.387084),
//     zoom: 14.4746,
//   );

//   Widget build(BuildContext context) {
//     Future<void> _showMyDialog() async {
//       return showDialog<void>(
//         context: context,
//         barrierDismissible: false, // user must tap button!
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Column(
//               children: [
//                 Text(
//                   'Please try again',
//                   style: TextStyle(fontSize: 23),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   'Something went wrong',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
//                 )
//               ],
//             ),
//             content: SingleChildScrollView(
//               child: ListBody(
//                 children: <Widget>[
//                   Image.asset(
//                     'assets/fail.png',
//                     height: 100,
//                     width: 100,
//                   ),
//                   Text(
//                     'Booking faild we Couldn\'t book your car ',
//                     textAlign: TextAlign.center,
//                   ),
//                   Text(
//                     'Please reload the page and try again !',
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Container(
//                     // margin: EdgeInsets.all(8),
//                     // padding: EdgeInsets.all(6),
//                     child: RaisedButton(
//                       color: Colors.orange[900],
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       child: Text('Go back'),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             // actions: <Widget>[
//             //   FlatButton(
//             //     child: Text('Go back'),
//             //     onPressed: () {
//             //       Navigator.of(context).pop();
//             //     },
//             //   ),
//             // ],
//           );
//         },
//       );
//     }

//     Future<void> _sucess() async {
//       // addPoients();
//       getPrefInt('autoLeaseMoney');
//       return showDialog<void>(
//         context: context,
//         barrierDismissible: false, // user must tap button!
//         builder: (BuildContext context) {
//           return AlertDialog(
//             title: Container(
//               // color: Colors.green[100],
//               child: Column(
//                 children: [
//                   Text(
//                     'THANKYOU',
//                     style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Text(
//                     'YOUR ORDER HAS BEEN PLACED',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 25,
//                   ),
//                   Text(
//                     'Your order number is ',
//                     style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     'xxxxxxxxxx$bookingId',
//                     style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     'You will recieve an email shortly we hope you enjoy the cars ',
//                     style: TextStyle(fontSize: 14),
//                     textAlign: TextAlign.center,
//                   ),
//                   Text(
//                     'you have chosen',
//                     style: TextStyle(fontSize: 14),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Image(
//                     image: AssetImage('assets/confirm.png'),
//                     height: 50,
//                     width: 50,
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   RaisedButton(
//                     color: Colors.orange[900],
//                     onPressed: () {
//                       Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => ProductOverViewScreen()));
//                     },
//                     child: Text('Go back'),
//                   ),
//                 ],
//               ),
//             ),
//             elevation: 6,
//           );
//         },
//       );
//     }

//     // Future<http.Response> bk() async {
//     //   final http.Response response = await http.post(
//     //     'https://qaautolease.em2.in/autolease/booking/new',
//     //     headers: <String, String>{
//     //       'Content-Type': 'application/json; charset=UTF-8',
//     //       'Authorization': 'Bearer $Token'
//     //     },
//     //     body: jsonEncode(<String, dynamic>{
//     //       "bai": 0,
//     //     }),
//     //   );
//     //   if (response.statusCode == 200) {
//     //     _sucess();
//     //   } else {
//     //     print(response.body);
//     //     _showMyDialog();
//     //   }
//     //   return response;
//     // }
//     Future<http.Response> addPoient() async {
//       final http.Response response = await http.post(
//         // 'https://backend.autolease-uae.com/booking/refferalReward',
//         'https://admin.autolease-uae.com/autolease/booking/refferalReward',
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//           'Authorization': 'Bearer $token'
//         },
//         body: jsonEncode(<String, dynamic>{
//           "createdAt": "",
//           "createdBy": userId,
//           "customerId": userId,
//           "isActive": "1",
//           "point": '',
//           "refferalcode": refrealCodeRefered,
//           "type": "",
//           "updatedAt": "",
//           "updatedBy": userId
//         }),
//       );
//     }

//     Future<http.Response> bookNow(
//         String custId,
//         String fleetId,
//         int carid,
//         String type,
//         String startDate,
//         String endDate,
//         double bai,
//         double cdw,
//         double pai,
//         int childSeat,
//         int driver,
//         int total,
//         String email,
//         String name,
//         bool prmoEmail,
//         bool emailNotification,
//         String location,
//         String address,
//         double hireFee) async {
//       print(emailb.text + nameb.text);
//       print(custId.toString() + "idida");
//       print(token);
//       print(custId);
//       print(fleetId);
//       print(carid);
//       print(pickupdate.year.toString() +
//           '-' +
//           pickupdate.month.toString() +
//           '-' +
//           pickupdate.day.toString() +
//           ' ' +
//           pickuptime.hour.toString() +
//           ':' +
//           pickuptime.minute.toString() +
//           ':00');
//       final http.Response response = await http.post(
//         // 'https://backend.autolease-uae.com/booking/new',
//         'https://admin.autolease-uae.com/autolease/booking/new?mail=${emailb.text}&name=${nameb.text}',
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//           'Authorization': 'Bearer $token'
//         },
//         body: jsonEncode(<String, dynamic>{
//           'customerId': custId,
//           // 'productName': carName ?? 'name',
//           'fleet_id': carid ?? 'id',
//           // 'id': 0,
//           'type': type ?? '1',
//           'start_date': startDate ?? 'date',
//           'end_date': endDate ?? 'date',
//           // 'customerEmail': email ?? 'mail',
//           // 'customerName': name ?? 'name',
//           'date': DateTime.now().year.toString() +
//               '-' +
//               DateTime.now().month.toString() +
//               '-' +
//               DateTime.now().day.toString(),
//           'drivers': driver ?? 1,
//           'emailUpdate': emailNotification.toString() ?? 'true',
//           'promotionalEmail': prmoEmail.toString() ?? 'true',
//           'child_seat': childSeat ?? 1,
//           'pai': pai ?? 12,
//           'cdw': cdw ?? 12,
//           'bai': bai ?? 12,
//           'total': total ?? 12,
//           'latitude': location ?? 'string',
//           'longitude': carName ?? 'string',
//           'status': "2",
//           'hireFee': hireFee ?? 'cost',
//           'updatedBy': custId,
//           'createdBy': custId
//         }),
//       );
//       if (response.statusCode == 200) {
//         // bookingId =
//         var res = jsonDecode(response.body);
//         bookingId = res['id'].toString();
//         print(response.body);
//         addPoient();
//         _sucess();
//       } else {
//         print(response.body);
//         _showMyDialog();
//       }
//       return response;
//     }

//     final car = Provider.of<Product>(context);

//     if (isf == true) {
//       // print('-=-=-=-=-=');
//       setState(() {
//         car.temptotal = car.totel.toDouble();
//         isf = false;
//       });
//     }
//     _getCurrentLocation();

//     // print(locationaddress);
//     return new Scaffold(
//         appBar: AppBar(
//           title: Text('Payment'),
//           // backgroundColor: Colors.black87,
//           backgroundColor: Colors.grey[700],
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 6,
//               ),
//               Container(
//                 child: GoogleMap(
//                   myLocationButtonEnabled: true,
//                   myLocationEnabled: true,
//                   mapType: MapType.normal,
//                   initialCameraPosition: _kGooglePlex,
//                   onMapCreated: (GoogleMapController controller) {
//                     _controller.complete(controller);
//                   },
//                 ),
//                 height: 200,
//               ),
//               // if (_currentPosition != null) Text(_currentAddress),
//               SizedBox(
//                 height: 10,
//               ),

//               SizedBox(height: 20),

//               if (_currentPosition != null)
//                 Text(
//                   _currentAddress != null ? _currentAddress : 'Your Location',
//                   style: TextStyle(fontWeight: FontWeight.normal, fontSize: 20),
//                 ),
//               SizedBox(height: 20),
//               Text(
//                 'Let us deliver your car here',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   // Text('Name'),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Column(
//                         children: <Widget>[
//                           Text('Start Date'),
//                           Text(startDateVisible
//                               ? pickupday.toString() +
//                                   "-" +
//                                   pickupmonth.toString() +
//                                   "-" +
//                                   pickupdate.year.toString()
//                               : ''),
//                           Text(startDateVisible
//                               ? pickuptime.format(context).toString()
//                               : ''),
//                           IconButton(
//                               alignment: Alignment.topCenter,
//                               icon: Icon(
//                                 Icons.date_range,
//                                 color:
//                                     colorStartDate ? Colors.black : Colors.red,
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   startDateVisible = true;
//                                   showDatePicker(
//                                     context: context,
//                                     initialDate: DateTime.now(),
//                                     firstDate: DateTime.now(),
//                                     lastDate: DateTime(2050),
//                                   ).then((date) => showTimePicker(
//                                           context: context,
//                                           initialTime: TimeOfDay.now())
//                                       .then((time) => {
//                                             print(date),
//                                             pickupdate = date ?? DateTime.now(),
//                                             pickuptime =
//                                                 time ?? TimeOfDay.now(),
//                                             startTimehr = pickuptime.hour
//                                                     .toDouble() +
//                                                 (pickuptime.minute.toDouble() /
//                                                     60),
//                                             print(startTimehr),
//                                             pickupday =
//                                                 pickupdate.day.toString(),
//                                             pickupmonth =
//                                                 pickupdate.month.toString(),
//                                             endDay = enddate.day.toString(),
//                                             endMonth = enddate.month.toString(),
//                                             pickupday ??=
//                                                 DateTime.now().day.toString(),
//                                             pickupmonth ??=
//                                                 DateTime.now().month.toString(),
//                                             endDay ??=
//                                                 DateTime.now().day.toString(),
//                                             endMonth ??=
//                                                 DateTime.now().month.toString(),
//                                             print(time),
//                                             timediff = endTimehr - startTimehr,
//                                             if (timediff < 0)
//                                               {
//                                                 timediff = timediff * -1,
//                                                 print(timediff)
//                                               },
//                                             datediff = enddate
//                                                 .difference(pickupdate)
//                                                 .inHours
//                                                 .toDouble(),
//                                             print(datediff),
//                                             if (timediff < 0)
//                                               {timediff = timediff * -1},
//                                             if (datediff < 0)
//                                               {datediff = datediff * -1},
//                                             toteldiff = datediff + timediff,
//                                             print(toteldiff),
//                                             if (toteldiff <= 12)
//                                               {car.temphour(toteldiff)}
//                                             else if (toteldiff > 12 &&
//                                                 toteldiff <= 720)
//                                               {car.tempDay(toteldiff)}
//                                             else if (toteldiff > 720)
//                                               {car.tempMonth(toteldiff)}
//                                             // else if (toteldiff < 1)
//                                             //   {car.tempMin()
//                                             //   }
//                                           }));
//                                 });
//                               })
//                         ],
//                       ),
//                       Container(
//                           height: 50,
//                           child: VerticalDivider(color: Colors.orange[900])),
//                       Column(
//                         children: <Widget>[
//                           Text('End Date'),
//                           Text(endtDateVisible
//                               ? endDay.toString() +
//                                   "-" +
//                                   endMonth.toString() +
//                                   '-' +
//                                   enddate.year.toString()
//                               : ''),
//                           Text(endtDateVisible
//                               ? endtime.format(context).toString()
//                               : ''),
//                           IconButton(
//                               alignment: Alignment.topCenter,
//                               icon: Icon(
//                                 Icons.date_range,
//                                 color: colorEndDate ? Colors.black : Colors.red,
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   endtDateVisible = true;
//                                   showDatePicker(
//                                     context: context,
//                                     initialDate: pickupdate ?? DateTime.now(),
//                                     firstDate: pickupdate ?? DateTime.now(),
//                                     lastDate: DateTime(2090),
//                                   ).then((date) => showTimePicker(
//                                           context: context,
//                                           initialTime: TimeOfDay.now())
//                                       .then((time) => {
//                                             print(date),
//                                             enddate = date ?? DateTime.now(),
//                                             endtime = time ?? TimeOfDay.now(),
//                                             endTimehr =
//                                                 endtime.hour.toDouble() +
//                                                     (endtime.minute.toDouble() /
//                                                         60),
//                                             print(endTimehr),
//                                             timediff = endTimehr - startTimehr,
//                                             if (timediff < 0)
//                                               {
//                                                 timediff = timediff * -1,
//                                                 print(timediff)
//                                               },
//                                             print(timediff),
//                                             pickupday =
//                                                 pickupdate.day.toString(),
//                                             pickupmonth =
//                                                 pickupdate.month.toString(),
//                                             endDay = enddate.day.toString(),
//                                             endMonth = enddate.month.toString(),
//                                             pickupday ??=
//                                                 DateTime.now().day.toString(),
//                                             pickupmonth ??=
//                                                 DateTime.now().month.toString(),
//                                             endDay ??=
//                                                 DateTime.now().day.toString(),
//                                             endMonth ??=
//                                                 DateTime.now().month.toString(),
//                                             print(time),
//                                             datediff = enddate
//                                                 .difference(pickupdate)
//                                                 .inHours
//                                                 .toDouble(),
//                                             print(datediff),
//                                             if (timediff < 0)
//                                               {timediff = timediff * -1},
//                                             if (datediff < 0)
//                                               {datediff = datediff * -1},
//                                             toteldiff = datediff + timediff,
//                                             print('--------------'),
//                                             print(toteldiff.toInt()),
//                                             print(toteldiff),
//                                             if (toteldiff <= 12)
//                                               {car.temphour(toteldiff)}
//                                             else if (toteldiff > 12 &&
//                                                 toteldiff <= 720)
//                                               {car.tempDay(toteldiff)}
//                                             else if (toteldiff > 720)
//                                               {car.tempMonth(toteldiff)}
//                                           }));
//                                 });
//                               }),
//                         ],
//                       )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 16,
//                   ),
//                   Container(
//                     margin: EdgeInsets.only(
//                         left: 20, right: 20, top: 10, bottom: 0),
//                     alignment: Alignment.centerLeft,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.all(Radius.circular(20)),
//                       border: Border.all(width: 1.0, color: nameColoe),
//                     ),
//                     height: 50.0,
//                     child: TextField(
//                       controller: nameb,
//                       // keyboardType: TextInputType.,
//                       style: TextStyle(color: Colors.black),

//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         contentPadding: EdgeInsets.only(top: 14),
//                         prefixIcon: Icon(
//                           Icons.account_circle_outlined,
//                           color: Colors.black,
//                         ),
//                         hintText: 'Enter Your Name',
//                       ),
//                     ),
//                   ),
//                   // Text('Email'),
//                   Container(
//                     margin: EdgeInsets.only(
//                         left: 20, right: 20, top: 10, bottom: 10),
//                     alignment: Alignment.centerLeft,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(20)),
//                         border: Border.all(width: 1.0, color: emailColor)),
//                     // decoration: BoxDecoration(
//                     //   boxShadow: [
//                     //     BoxShadow(
//                     //       color: Colors.blue,
//                     //       blurRadius: 5.0,
//                     //       spreadRadius: 2.0,
//                     //       offset: Offset(
//                     //         5.0,
//                     //         5.0,
//                     //       ),
//                     //     )
//                     //   ],
//                     // ),
//                     height: 50.0,
//                     child: TextField(
//                       controller: emailb,
//                       keyboardType: TextInputType.emailAddress,
//                       style: TextStyle(color: Colors.black),
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         contentPadding: EdgeInsets.only(top: 14),
//                         prefixIcon: Icon(
//                           Icons.email,
//                           color: Colors.black,
//                         ),
//                         hintText: 'Enter Your Email',
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               // Row(
//               //   children: [
//               //     Checkbox(value: null, onChanged: (value) {}),
//               //     Text('Get Reservationa Notification throgh email'),
//               //   ],
//               // ),
//               // Container(
//               // child:
//               Row(
//                 children: [
//                   Checkbox(
//                       value: notification,
//                       onChanged: (value) {
//                         setState(() {
//                           notification = !notification;
//                         });
//                       }),
//                   Text('Get reservation notification through email')
//                 ],
//                 // )
//               ),
//               // Container(
//               // child:
//               Row(
//                 children: [
//                   Checkbox(
//                       value: notificationAutolease,
//                       onChanged: (value) {
//                         setState(() {
//                           notificationAutolease = !notificationAutolease;
//                         });
//                       }),
//                   Text('Get promotional email from autolease')
//                 ],
//               ),
//               // ),
//               ExpansionTile(
//                 initiallyExpanded: true,
//                 title: Text(
//                   "Payment",
//                   style: TextStyle(
//                     fontSize: 18.0,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//                 children: <Widget>[
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         width: 30,
//                       ),
//                       Expanded(
//                         flex: 7,
//                         child: Text('Pay at Rental Counter'),
//                       ),
//                       Padding(padding: EdgeInsets.all(2)),
//                       Expanded(
//                           flex: 1,
//                           child: Checkbox(
//                             value: true,
//                             onChanged: (bool value) {
//                               value = !value;
//                               print(value);
//                               print(car.la);
//                             },
//                           )),
//                       SizedBox(
//                         width: 10,
//                       )
//                     ],
//                   ),
//                   // SizedBox(
//                   //   height: 5,
//                   // ),
//                   Row(
//                     children: [
//                       SizedBox(
//                         width: 30,
//                       ),
//                       Expanded(
//                         flex: 7,
//                         child: Text('I agree to the terms and conditions'),
//                       ),
//                       Padding(padding: EdgeInsets.all(2)),
//                       Expanded(
//                           flex: 1,
//                           child: Checkbox(
//                             value: btn,
//                             onChanged: (bool value) {
//                               setState(() {
//                                 btn = !btn;
//                               });
//                             },
//                           )),
//                       SizedBox(
//                         width: 10,
//                       )
//                     ],
//                   ),
//                   // bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
//                   // Row(
//                   //   children: [
//                   //     SizedBox(
//                   //       width: 30,
//                   //     ),
//                   //     Expanded(
//                   //         flex: 7,
//                   //         child: Column(
//                   //           children: <Widget>[
//                   //             Text('Redeem Autolease Money Point'),
//                   //             Text(
//                   //               'You Have :' + AutoLeaseMoney.toString(),
//                   //               style: TextStyle(),
//                   //             )
//                   //           ],
//                   //         )),
//                   //     Padding(padding: EdgeInsets.all(2)),
//                   //     Expanded(
//                   //       flex: 1,
//                   //       child: Checkbox(
//                   //           value: car.chM,
//                   //           onChanged: (bool) {
//                   //             car.fchM();
//                   //           }),
//                   //     )
//                   //   ],
//                   // ),
//                   // SizedBox(height: 10),
//                   Visibility(
//                     visible: startDateVisible && endtDateVisible,
//                     // visible: car.selectDate,
//                     // child: Text(
//                     //   'Total : ${car.temptotal.toString() ?? 'Please Select Date'} AED',
//                     //   style:
//                     //       TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     // ),
//                     child: // Calculation //
//                         Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(4.0),
//                       ),
//                       elevation: 0,
//                       margin: EdgeInsets.all(5),
//                       child: ExpansionTile(
//                         initiallyExpanded: false,
//                         title: Row(
//                           children: [
//                             Expanded(
//                               flex: 10,
//                               child: Text(
//                                 "Total : " + car.totel.toString() + ' AED',
//                                 style: TextStyle(
//                                   fontSize: 20.0,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                                 textAlign: TextAlign.center,
//                               ),
//                             ),
//                             SizedBox(
//                               width: 2,
//                             )
//                           ],
//                         ),
//                         children: <Widget>[
//                           Column(
//                             children: [
//                               Text('Price Summary'),
//                               Text(
//                                   'Booking mode : ${car.bookingType == null ? '' : car.bookingType}'),
//                               SizedBox(
//                                 height: 6,
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   SizedBox(
//                                     width: 30,
//                                   ),
//                                   Expanded(
//                                       flex: 6, child: Text('Car hire fee')),
//                                   Expanded(flex: 2, child: Text('AED')),
//                                   Expanded(
//                                       flex: 2,
//                                       child: Text(car.current.toString()))
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 2,
//                               ),
//                               Row(
//                                 children: [
//                                   SizedBox(
//                                     width: 30,
//                                   ),
//                                   Expanded(
//                                       flex: 6,
//                                       child: Text('Additional Driver × ' +
//                                           car.driver.toString())),
//                                   Expanded(flex: 2, child: Text('AED')),
//                                   Expanded(
//                                       flex: 2,
//                                       child: Text(car.driverTotalf == null
//                                           ? ''
//                                           : car.driverTotalf
//                                               .toInt()
//                                               .toString()))
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 2,
//                               ),
//                               Row(
//                                 children: [
//                                   SizedBox(
//                                     width: 30,
//                                   ),
//                                   Expanded(
//                                       flex: 6,
//                                       child: Text('Child Infant Seat × ' +
//                                           car.cseat.toString())),
//                                   Expanded(flex: 2, child: Text('AED')),
//                                   Expanded(
//                                       flex: 2,
//                                       child: Text(car.cTotelf == null
//                                           ? ''
//                                           : car.cTotelf.toInt().toString()))
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 2,
//                               ),
//                               Row(
//                                 children: [
//                                   SizedBox(
//                                     width: 30,
//                                   ),
//                                   Expanded(flex: 6, child: Text('PAI')),
//                                   Expanded(flex: 2, child: Text('AED')),
//                                   Expanded(
//                                       flex: 2,
//                                       child: Text(
//                                           car.temppai.toString() == 'null'
//                                               ? pai
//                                               : car.temppai.toString()))
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 2,
//                               ),
//                               Row(
//                                 children: [
//                                   SizedBox(
//                                     width: 30,
//                                   ),
//                                   Expanded(flex: 6, child: Text('CDW ')),
//                                   Expanded(flex: 2, child: Text('AED')),
//                                   Expanded(
//                                       flex: 2,
//                                       child: Text(car.temppdw.toString()))
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 2,
//                               ),
//                               Row(
//                                 children: [
//                                   SizedBox(
//                                     width: 30,
//                                   ),
//                                   Expanded(flex: 6, child: Text('VAT  5%')),
//                                   Expanded(flex: 2, child: Text('AED')),
//                                   Expanded(
//                                       flex: 2,
//                                       child: Text(
//                                           ((car.totel) * (5 / 100)).toString()))
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 5,
//                               ),
//                               Row(
//                                 children: [
//                                   SizedBox(
//                                     width: 30,
//                                   ),
//                                   Expanded(
//                                       flex: 6,
//                                       child: Text(
//                                         'Total ',
//                                         style: TextStyle(
//                                           fontSize: 15.0,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                         textAlign: TextAlign.center,
//                                       )),
//                                   Expanded(flex: 2, child: Text('AED')),
//                                   Expanded(
//                                       flex: 2,
//                                       child: Text(
//                                           (car.totel + (car.totel) * (5 / 100))
//                                               .toString()))
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 8,
//                               ),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),

//                     //-------------------------//
//                     replacement: Text(
//                       'Please Select Date',
//                       style:
//                           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                   ),

//                   SizedBox(
//                     height: 10,
//                   )
//                 ],
//               ),
//               RaisedButton(
//                 color: Colors.orange[900],
//                 onPressed: btn
//                     ? () {
//                         if (!(startDateVisible && endtDateVisible)) {
//                           Fluttertoast.showToast(
//                               msg: "Please select Date",
//                               toastLength: Toast.LENGTH_SHORT,
//                               gravity: ToastGravity.CENTER,
//                               timeInSecForIosWeb: 1,
//                               backgroundColor: Colors.red,
//                               textColor: Colors.white,
//                               fontSize: 16.0);
//                         }
//                         if (isuserLogin == true) {
//                           bool emailValid = RegExp(
//                                   r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                               .hasMatch(emailb.text);
//                           if (emailValid == false ||
//                               nameb.text == '' ||
//                               startDateVisible == false ||
//                               endtDateVisible == false) {
//                             print('validation Suc');
//                             print(nameb.text);
//                             print(emailb.text);
//                             if (emailValid == false) {
//                               setState(() {
//                                 emailColor = Colors.red;
//                               });
//                             }
//                             if (nameb.text == '') {
//                               setState(() {
//                                 nameColoe = Colors.red;
//                               });
//                             }
//                             if (startDateVisible == false) {
//                               setState(() {
//                                 colorStartDate = false;
//                               });
//                             }
//                             if (endtDateVisible == false) {
//                               setState(() {
//                                 colorEndDate = false;
//                               });
//                             }
//                           } else {
//                             setToken("name", nameb.text);
//                             Name = nameb.text;
//                             Number = phone;
//                             Token = token;
//                             setState(() {
//                               // nameb.text = '';
//                               // emailb.text = '';
//                               nameColoe = Colors.black;
//                               emailColor = Colors.black;
//                             });
//                             print(nameb.text);
//                             // print('test');
//                             // _sucess();
//                             // _getCurrentLocation();
//                             ///////////
//                             // bk();
//                             print(Number.toString() +
//                                 phone.toString() +
//                                 phone2.toString() +
//                                 'idido');
//                             bookNow(
//                                 phone2 ?? Number ?? phone,
//                                 carName,
//                                 carid1,
//                                 BookingMode,
//                                 pickupdate.year.toString() +
//                                     '-' +
//                                     pickupdate.month.toString() +
//                                     '-' +
//                                     pickupdate.day.toString() +
//                                     ' ' +
//                                     pickuptime.hour.toString() +
//                                     ':' +
//                                     pickuptime.minute.toString() +
//                                     ':00',
//                                 enddate.year.toString() +
//                                     '-' +
//                                     enddate.month.toString() +
//                                     '-' +
//                                     enddate.day.toString() +
//                                     ' ' +
//                                     endtime.hour.toString() +
//                                     ':' +
//                                     endtime.minute.toString() +
//                                     ':00',
//                                 car.tempbai.toDouble(),
//                                 car.temppdw.toDouble(),
//                                 car.temppai.toDouble(),
//                                 car.cTotel.toInt(),
//                                 car.driverTotal.toInt(),
//                                 car.temptotal.toInt(),
//                                 emailb.text,
//                                 nameb.text,
//                                 notificationAutolease,
//                                 notification,
//                                 locationaddress,
//                                 _currentAddress,
//                                 car.current.toDouble());
//                           }
//                         } else {
//                           _showDialog();
//                         }
//                       }
//                     : null,
//                 // color: Colors.white,
//                 child: Text(
//                   'Use Current Location & Continue',
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }

//   _getCurrentLocation() {
//     geolocator
//         .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
//         .then((Position position) {
//       setState(() {
//         _currentPosition = position;
//       });
//       _getAddressFromLatLng();
//     }).catchError((e) {
//       // print(e);
//     });
//   }

//   _getAddressFromLatLng() async {
//     try {
//       List<Placemark> p = await geolocator.placemarkFromCoordinates(
//           _currentPosition.latitude, _currentPosition.longitude);
//       // print(_currentPosition.latitude);
//       // print(_currentPosition);
//       // print(car.);
//       Placemark place = p[0];
//       setState(() {
//         locationaddress = _currentPosition.latitude.toString() +
//             ',' +
//             _currentPosition.longitude.toString();
//         // print(locationaddress);
//         _currentAddress =
//             "${place.locality}, ${place.postalCode}, ${place.country}";
//       });
//     } catch (e) {
//       // print(e);
//     }
//   }
// }
