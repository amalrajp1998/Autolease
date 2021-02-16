import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:autolease/screens/product_overview_screen.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

import '../localization/constants.dart';
import '../main.dart';
import '../screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

String phone;
String phone1;
bool login = false;
final phno = TextEditingController();
int len;
String otptran = 'enter_otp';
String otpString;
bool otpVisible = false;
double otpopacity = 0;
bool readonlphone = false;
String btntxt = 'Get OTP';
String token;
bool isEditable = true;
final firstName = TextEditingController();
final secondName = TextEditingController();
final phoneNumber = TextEditingController();
final email = TextEditingController();
// int userid;
File _image;
Timer _timer;
int _start = 120;
String otpText;

bool firstNames = false;
bool secondNames = false;
bool phoneNumbers = false;
bool emails = false;
bool ids = false;

var firstNameF = FocusNode();
var emailF = FocusNode();
var secondNameF = FocusNode();

String signature;
_getSignatureCode() async {
  signature = await SmsRetrieved.getAppSignature();
  print('-------------------------------------');
  print("     signature $signature      ");
  print('-------------------------------------');
}

class MyAccount extends StatefulWidget {
  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  @override
  void updateapi() {
    setState(() {
      firstNames = false;
      secondNames = false;
      emails = false;
      ids = false;
      Name = firstName.text;
    });
    if (_image == null) {
      updateUser();
    } else {
      _upload().then((_) => updateUser());
    }
    //
    setState(() {
      isEditable = true;
    });
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Do you want to update'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
                onPressed: () {
                  setState(() {
                    Name = firstName.text;
                  });
                  if (_image == null) {
                    updateUser();
                  } else {
                    _upload().then((_) => updateUser());
                  }
                  //
                  setState(() {
                    isEditable = true;
                  });
                  Navigator.of(context).pop();
                },
                child: Text('Yes'))
          ],
        );
      },
    );
  }

  getNumber() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      Number = preferences.getString('number');
      print(Number);
      return Number;
    });
  }

  void initState() {
    _getSignatureCode();
    getNumber();
    if (Number != null) {
      getUser();
    }

    phoneNumber.text = Number;
    super.initState();
  }

  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  // Set Token function//
  setToken(String arg, String val) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(arg, val);
  }

  setStatus(String arg, bool val) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool(arg, val);
  }

  setUserid(int id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('userid', id);
  }

  //Get OTP Function //
  Future<http.Response> getotp(var username) async {
    // print(username + '= mobile');
    // https://admin.autolease-uae.com/
    // https://qaautolease.em2.in/autolease/
    // var uri = new Uri.https("backend.autolease-uae.com", "/generateOtp",
    var uri = new Uri.https("qaautolease.em2.in", "/autolease/generateOtp",
        {'mobile': username, 'signatureKey': signature ?? 'key'});
    final response = await http.get(uri);
    print(response.body);
    otpText = response.body;
    setState(() {
      otpString = response.body;
    });
    return response;
  }

  String _otpCode = "";
  @override

  ////Auto Fill OTP Functions//////

  _onOtpCallBack(String otpCode, bool isAutofill) {
    setState(() {
      this._otpCode = otpCode;
      int otplength = _otpCode.length;
      if (phone == '9988001209' && otpCode == '8340') {
        print(otpString.substring(8, 12));
        checkOtp(otpString.substring(8, 12)).then((_) => getUser());
      } else if (otplength == 4) {
        print('otp orignal');
        checkOtp(_otpCode).then((_) => getUser());
      }
    });
  }

  // Future<void> _createDynamicLink() async {
  //   final DynamicLinkParameters parameters = DynamicLinkParameters(
  //     uriPrefix: 'https://autoleasetest.page.link',
  //     link: Uri.parse('https://autoleasetest.page.link/$myReferralCode'),
  //     // link: Uri.parse('https://autoleasetest.page.link'),
  //     androidParameters: AndroidParameters(
  //       packageName: 'com.autoleaseuae.AutoLease',
  //       minimumVersion: 0,
  //     ),
  //     iosParameters: IosParameters(
  //       bundleId: 'com.autoleaseuaeios.AutoLease',
  //       minimumVersion: '1.0.0',
  //       appStoreId: '962194608',
  //     ),
  //     dynamicLinkParametersOptions: DynamicLinkParametersOptions(
  //       shortDynamicLinkPathLength: ShortDynamicLinkPathLength.short,
  //     ),
  //   );
  //   final ShortDynamicLink shortLink = await parameters.buildShortLink();
  //   myUrl = shortLink.shortUrl;
  //   myReferralUrl = myUrl.toString();
  //   print(myUrl);
  // }

  Future<http.Response> checkOtp(String pin) async {
    print(phone + "=phone");
    print(pin + '= pin');
    // print(referalCode ?? 'getting null' + '=Ref Code');
    final http.Response response2 =
        // await http.post('https://backend.autolease-uae.com/authenticate',
        await http.post('https://qaautolease.em2.in/autolease/authenticate',
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, String>{
              'mobile': phone,
              'otp': pin,
              'referralCode': '',
            }));
    var decodemsg = json.decode(response2.body);
    print('_____-----$decodemsg----___');
    print(decodemsg['jwt']);
    print(response2.statusCode);
    if (decodemsg['statusCode'] == '200') {
      // _createDynamicLink();
      setState(() {
        _start = 120;
        readonlphone = false;
        otpVisible = false;
        isuserLogin = true;
        login = true;
        phoneNumber.text = phone ?? Number;
      });
      String arg = 'token';
      String val = decodemsg['jwt'];
      token = decodemsg['jwt'];
      // print(token);
      setToken(arg, val);
      setToken("number", phone);
      Number = phone;
      Token = token;
      setStatus("isUserLogin", true);
      // print(otpvald);
      return response2;
    } else {
      setState(() {
        otptran = 'wrong_otp';
      });
    }
    // print(response2.body);
    return response2;
  }

  //Update Proof Image ///

  Future<http.Response> updateProof() async {
    final http.Response uploadimage = await http.post(
      // 'https://backend.autolease-uae.com/user/imageDetails',
      'https://qaautolease.em2.in/autolease/user/imageDetails',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $Token'
      },
      body: jsonEncode(
        <String, dynamic>{
          "createdAt": '',
          "createdBy": userId.toString(),
          "customerId": userId.toString(),
          "imageUrl": proofImageUrl,
          "type": "1",
          "updatedAt": '',
          "updatedBy": userId.toString(),
        },
      ),
    );
    var decoded = json.decode(uploadimage.body);
    print(decoded);
    if (uploadimage.statusCode != 200) {
      Fluttertoast.showToast(
          msg: "Update failed please try again later",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    return uploadimage;
  }

///// Update user ////
  Future<http.Response> updateUser() async {
    if (proofImageUrl != null) {
      updateProof();
      final http.Response statuscode = await http.put(
          // 'https://backend.autolease-uae.com/user/update/$userId',
          'https://qaautolease.em2.in/autolease/user/update/$userId',
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ' + Token
          },
          body: jsonEncode(<String, dynamic>{
            'firstName': firstName.text,
            'countryId': '971',
            'lastName': secondName.text,
            'userEmail': email.text,
            'token': '',
            'loginStatus': '3',
            'mobile': Number,
            'username': firstName.text + '1234!@#@@#',
            'password': '!@#%^&*asdfghjkl${firstName.text}',
            'userType': '2',
            'status': '1',
            'createdBy': userId.toString(),
            'createdAT': '',
            'updatedBy': userId.toString(),
            'updatedAt': '',
            "address": "string",
            "code": "string",
            'referralCode': referalCode.toString(),
            'roles': [
              {"id": 0, "name": ''}
            ],
            'isFav': true,
          }));
// {
//   "address": "string",
//   "code": "string",
//   "countryId": "string",
//   "createdAt": "string",
//   "createdBy": "string",
//   "firstName": "string",
//   "id": 0,
//   "isFav": true,
//   "lastName": "string",
//   "loginStatus": "string",
//   "mobile": "string",
//   "password": "string",
//   "referralCode": "string",
//   "roles": [
//     {
//       "id": 0,
//       "name": "string"
//     }
//   ],
//   "status": "string",
//   "token": "string",
//   "updatedAt": "string",
//   "updatedBy": "string",
//   "userEmail": "string",
//   "userType": "string",
//   "username": "string"
// }
      var decoded = json.decode(statuscode.body);
      print(decoded);
      print(statuscode.statusCode);
      if (statuscode.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "Update Successful",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Update failed please try again later",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      return statuscode;
    } else {
      final http.Response statuscode = await http.put(
          // 'https://backend.autolease-uae.com/user/update/$userId',
          'https://qaautolease.em2.in/autolease/user/update/$userId',
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'Authorization': 'Bearer ' + Token
          },
          body: jsonEncode(<String, dynamic>{
            'firstName': firstName.text,
            'countryId': '971',
            'lastName': secondName.text,
            'userEmail': email.text,
            'token': '',
            'loginStatus': '3',
            'mobile': Number,
            'username': firstName.text + '1234!@#@@#',
            'password': '!@#%^&*asdfghjkl${firstName.text}',
            'userType': '2',
            'status': '1',
            'createdBy': userId.toString(),
            'createdAT': '',
            'updatedBy': userId.toString(),
            'updatedAt': '',
            "address": "string",
            "code": "string",
            'referralCode': referalCode.toString(),
            'roles': [
              {"id": 0, "name": ''}
            ],
            'isFav': true,
          }));
      var decoded = json.decode(statuscode.body);
      print(decoded);
      if (statuscode.statusCode == 200) {
        Fluttertoast.showToast(
            msg: "Update Successful",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Update failed please try again later",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      return statuscode;
    }
  }

  ////////////get user details////////
  Future<http.Response> getUser() async {
    print('--------Get user--------');
    final http.Response response2 = await http.get(
      // 'https://backend.autolease-uae.com/users/user?mobile=$Number',
      'https://qaautolease.em2.in/autolease/users/user?mobile=$Number',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + Token
      },
    );
    var decodemsg = json.decode(response2.body);
    var img = decodemsg['imageDetails'];
    print(img);
    print(decodemsg);
    print(response2.statusCode);
    // if (decodemsg['statusCode'] == '200') {
    setState(() {
      userId = decodemsg['id'];
      firstName.text = decodemsg['firstName'];
      Name = decodemsg['firstName'];
      secondName.text = decodemsg['lastName'];
      email.text = decodemsg['userEmail'];
      proofImageUrl = img[0]['imageUrl'] ?? '';
      print(decodemsg['imageUrl']);
      print(proofImageUrl);
      setUserid(userId);
    });
    print(decodemsg['imageUrl']);

    print(decodemsg['firstName']);
    print(decodemsg['lastName']);
    print(decodemsg['userEmail']);
    print(userId);
    return response2;
    // } else {}
    // return response2;
  }

  Widget build(BuildContext context) {
    void startTimer() {
      const oneSec = const Duration(seconds: 1);
      _timer = new Timer.periodic(
        oneSec,
        (Timer timer) => setState(
          () {
            if (_start < 1) {
              readonlphone = false;
              btntxt = 'Resend OTP';
              timer.cancel();
            } else {
              _start = _start - 1;
            }
          },
        ),
      );
    }

    //---------------------------input text field ------------------------------//
    Widget phoneinput() {
      return Container(
        margin: EdgeInsets.all(15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          border: Border.all(width: 1.0, color: Colors.black),
        ),
        height: 50.0,
        child: TextField(
          readOnly: readonlphone,
          controller: phno,
          keyboardType: TextInputType.phone,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefix: Text("+971 "),
            prefixIcon: Icon(
              Icons.phone,
              color: Colors.black,
            ),
            hintText: getTranslated(context, 'enter_phone'),
            hintStyle: TextStyle(color: Colors.black),
          ),
        ),
      );
    }

//----------------------------------------------------------------------------//
//------------------------------Submit Button--------------------------------//
    Widget button() {
      return RaisedButton(
          onPressed: () {
            phone = phno.text;
            phone = phno.text.toString();
            if (phone[0] == '0') {
              phone = phone.substring(1, phone.length);
            }
            print(phone);
            len = (phno.text).length;
            if (len < 6) {
              print('enter valid number');
              // setState(() {
              //   phoneNumberCheck = false;
              //   print('set state is working');
              // });
            } else if (len > 6 && readonlphone == false) {
              setState(() {
                btntxt = 'Confirm';
                _start = 120;
                startTimer();
                readonlphone = true;
                otpVisible = true;
                otpopacity = 1;
              });
              getotp(phone);
              // setState(() {
              //   otp = false;
              // });
            }
          },
          child: Text(btntxt));
    }

//----------------------------------------------------------------------------//
//----------------------------------------------------------------------------//
    Widget otp() {
      return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            getTranslated(context, otptran),
            style: TextStyle(
                color: otptran == 'wrong_otp' ? Colors.red : Colors.black,
                fontSize: 14),
          ),
          SizedBox(
            height: 20,
          ),
          TextFieldPin(
              filled: false,
              filledColor: Colors.grey,
              codeLength: 4,
              boxSize: 46,
              filledAfterTextChange: true,
              textStyle: TextStyle(fontSize: 16),
              borderStyle: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 2),
                  borderRadius: BorderRadius.circular(4)),
              onOtpCallback: (code, isAutofill) {
                _onOtpCallBack(code, isAutofill);
                print(code);
              }),
        ],
      );
    }
//----------------------------------------------------------------------------//

    return Scaffold(
      appBar: AppBar(
        title: Text('MY ACCOUNT'),
        backgroundColor: Colors.grey[850],
      ),
      body: Visibility(
        visible: isuserLogin,
        child: Column(
          children: [
            // Container(
            //   decoration: BoxDecoration(
            //     gradient: LinearGradient(
            //         begin: Alignment.topCenter,
            //         end: Alignment.bottomCenter,
            //         colors: [Colors.grey[400], Colors.grey[100]]),
            //   ),
            //   child: Container(
            //     width: double.infinity,
            //     height: 300,
            //     child: Center(
            //       child: Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           CircleAvatar(
            //             backgroundImage: NetworkImage(
            //                 'https://images.vexels.com/media/users/3/145908/preview2/52eabf633ca6414e60a7677b0b917d92-male-avatar-maker.jpg'),
            //             radius: 50,
            //           ),
            //           SizedBox(
            //             height: 5,
            //           ),
            //           Text('Jithin'),
            //           SizedBox(
            //             height: 10,
            //           ),
            //           RaisedButton(
            //             onPressed: () {},
            //             child: Text('Edit Profile'),
            //           ),
            //           SizedBox(
            //             height: 20,
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // Card(
            //   margin: EdgeInsets.all(1),
            //   elevation: 5,
            //   child: Container(
            //     width: double.infinity,
            //     height: 250,
            //     child:

            Column(
              children: [
                Column(
                  // width: double.infinity,
                  // height: 50,
                  // child: Column(
                  children: [
                    Card(
                      elevation: 4,
                      child: Row(
                        children: [
                          Container(
                            width: (MediaQuery.of(context).size.width) - 56,
                            child: TextField(
                              focusNode: firstNameF,
                              keyboardType: TextInputType.name,
                              readOnly: !firstNames,
                              controller: firstName,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.person),
                                  labelText: 'First Name'),
                            ),
                          ),
                          IconButton(
                              icon: Icon(firstNames ? Icons.check : Icons.edit),
                              onPressed: () {
                                setState(() {
                                  firstNameF.requestFocus();
                                  if (firstNames == false) {
                                    firstNames = true;
                                  } else {
                                    updateapi();
                                    firstNames = false;
                                  }
                                });
                              })
                        ],
                      ),
                    ),
                    Card(
                      elevation: 4,
                      child: Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 56,
                            child: TextField(
                              focusNode: secondNameF,
                              keyboardType: TextInputType.name,
                              readOnly: !secondNames,
                              controller: secondName,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.person),
                                  labelText: 'Second Name'),
                            ),
                          ),
                          IconButton(
                              icon:
                                  Icon(secondNames ? Icons.check : Icons.edit),
                              onPressed: () {
                                setState(() {
                                  secondNameF.requestFocus();
                                  if (secondNames == false) {
                                    secondNames = true;
                                  } else {
                                    updateapi();
                                    secondNames = false;
                                  }
                                });
                              })
                        ],
                      ),
                    ),
                  ],
                  // ),
                ),
                Card(
                    elevation: 4,
                    child: TextField(
                      readOnly: true,
                      controller: phoneNumber,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                          prefix: Text('+971 '),
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.phone_android),
                          labelText: 'Phone'),
                    )),
                Card(
                    elevation: 4,
                    child: Row(children: [
                      Container(
                        width: MediaQuery.of(context).size.width - 56,
                        child: TextField(
                          focusNode: emailF,
                          keyboardType: TextInputType.emailAddress,
                          readOnly: !emails,
                          controller: email,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.email),
                              labelText: 'Email'),
                        ),
                      ),
                      IconButton(
                          icon: Icon(emails ? Icons.check : Icons.edit),
                          onPressed: () {
                            setState(() {
                              emailF.requestFocus();
                              if (emails == false) {
                                emails = true;
                              } else {
                                updateapi();

                                emails = false;
                              }
                            });
                          })
                    ])),
                // Listener(
                //   onPointerDown: (_) {
                //     if (!isEditable) {
                //       ///////////
                //       getImage();
                //     }
                //   },
                //   child: Card(
                //     elevation: 4,
                //     child: Row(
                //       children: [
                //         Expanded(
                //           flex: 7,
                //           child: Container(
                //             color: Colors.white,
                //             height: 150,
                //             child: Center(
                //               child: _image == null
                //                   ? Container(
                //                       child: proofImageUrl == null
                //                           ? Text('Upload your Id Proof')
                //                           : Image.network(proofImageUrl))
                //                   : Image.file(
                //                       _image,
                //                       fit: BoxFit.fill,
                //                     ),
                //             ),
                //           ),
                //         ),
                //         Expanded(
                //           flex: 4,
                //           child: Center(
                //             child: Visibility(
                //               visible: ids,
                //               child: FlatButton(
                //                 onPressed: () {
                //                   if (ids == true) {
                //                     getImage();
                //                   }
                //                 },
                //                 child: proofImageUrl == null
                //                     ? Text('Browse')
                //                     : Text('Edit'),
                //               ),
                //             ),
                //           ),
                //         ),
                //         IconButton(
                //             icon: Icon(ids ? Icons.check : Icons.edit),
                //             onPressed: () {
                //               setState(() {
                //                 if (ids == false) {
                //                   ids = true;
                //                 } else {
                //                   updateapi();

                //                   ids = false;
                //                 }
                //               });
                //             })
                //       ],
                //     ),
                //   ),
                // ),
                Visibility(
                  visible: ids || emails || firstNames || secondNames,
                  child: RaisedButton(
                    onPressed: () {
                      setState(() {
                        isEditable = !isEditable;
                        ids = false;
                        firstNames = false;
                        secondNames = false;
                        emails = false;
                      });

                      // _showMyDialog();
                      updateapi();
                    },
                    child: Text('Update'),
                  ),
                )
              ],
            ),
          ],
        ),
        replacement: Container(
            child: Column(children: [
          SizedBox(
            height: 30,
          ),
          Text(
            'Please Login With Your Phone number',
            style: TextStyle(fontSize: 16),
          ),
          phoneinput(),
          Visibility(
            visible: otpVisible,
            child: AnimatedOpacity(
                duration: Duration(seconds: 1),
                opacity: otpopacity,
                child: Column(
                  children: [
                    otp(),
                    SizedBox(
                      height: 10,
                    ),
                    Visibility(
                        visible: readonlphone, child: Text("$_start Seconds"))
                  ],
                )),
          ),
          button(),
          SizedBox(
            height: 15,
          ),
          // Text(otpString == null ? " " : otpString.substring(0, 13))
        ])),
      ),
    );
  }
}

Future _upload() async {
  // if (_image == null) return;
  // String base64Image = base64Encode(_image.readAsBytesSync());
  // String fileName = _image.path.split("/").last;

  // http.post('https://qaautolease.em2.in/autolease/user/uploadProof',
  //     headers: <String, String>{
  //       // 'Content-Type': 'multipart/form-data',
  //       'Authorization': 'Bearer ' + Token
  //     },
  //     body: {
  //       "file": base64Image,
  //       // "name": fileName,
  //     }).then((res) {
  //   print(res.statusCode);
  // }).catchError((err) {
  //   print(err);
  // });

  ///////////
//   var uri = Uri.parse('https://qaautolease.em2.in/autolease/user/uploadProof');
// var request = http.MultipartRequest('POST', uri)
//   ..files.add(await http.MultipartFile.fromPath(
//       'file', _image,
//       contentType: MediaType('application', 'x-tar')));
// var response = await request.send();
// if (response.statusCode == 200) print('Uploaded!');

///////
  ///Future getUploadimg(_image) async {
  ///https://qaautolease.em2.in/autolease/
  // String url = 'https://backend.autolease-uae.com/user/uploadProof';
  String url = 'https://qaautolease.em2.in/autolease/user/uploadProof';
  // final length = await _image.length();
  final request = new http.MultipartRequest('POST', Uri.parse(url));
  // ..files.add(new http.MultipartFile('file', _image.openRead(), length));
  request.headers['Authorization'] = 'Bearer ' + Token;
  request.files.add(await http.MultipartFile.fromPath('file', _image.path));
  http.Response response = await http.Response.fromStream(await request.send());
  print("Result: ${response.body}");
  proofImageUrl = response.body;
  // return json.decode(response.body);
}
