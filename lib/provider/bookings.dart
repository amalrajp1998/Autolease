import 'dart:convert';
import '../screens/car_detail.dart';
import '../screens/splash.dart';
import 'package:flutter/cupertino.dart';
import 'bookingModel.dart';
import 'package:http/http.dart' as http;

import 'bookingModel.dart';

String number = Number;
String token = Token;

class Bookings with ChangeNotifier {
  List<Booking> items = [];
  Future<String> fetchBooking() async {
    // String url = 'https://backend.autolease-uae.com/booking/${number}';
    String url = 'https://qaautolease.em2.in/autolease/booking/${number}';
    if (number != null) {
      try {
        // print(url);
        final response = await http.get(url, headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer ' + token
        });

        final String extractedData = response.body;
        final content = jsonDecode(extractedData)['content'];
        print(content);
        print(content.length);

        // final conyent1 = content['content'] as List;
        List<Booking> loadedProducts = [];
        if (content.length != 0) {
          print('get into ');
          print(content);
          content.forEach((element) {
            print(element);
            loadedProducts.add(Booking(
                carName: element['name'],
                total: element['total'],
                bookinId: element['id'],
                date: element['start_date'],
                endDate: element['end_date']));

            print(element['id']);
          });
        }

        print(
            '---------------------------------END OF FETCH Booking-------------------------------------');
        items = loadedProducts;
        notifyListeners();
        return extractedData;
      } catch (error) {
        print(error);
        throw (error);
      }
    }
  }
}
