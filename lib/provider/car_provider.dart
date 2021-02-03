import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import '../provider/product.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
// import '../screens/product_overview_screen.dart';
import '../screens/splash.dart';

// void main(List<dynamic> arguments) async {
//   // This example uses the Google Books API to search for books about http.
//   // https://developers.google.com/books/docs/overview
//   var url = 'https://www.googleapis.com/books/v1/volumes?q={http}';

//   // Await the http get response, then decode the json-formatted response.
//   var response = await http.get(url);
//   if (response.statusCode == 200) {
//     var jsonResponse = convert.jsonDecode(response.body);
//     var itemCount = jsonResponse['totalItems'];
//     print('Number of books about http: $itemCount.');
//   } else {
//     print('Request failed with status: ${response.statusCode}.');
//   }
// }

// String token = getToken();
// getToken() async {
//   SharedPreferences preferences = await SharedPreferences.getInstance();
//   token = preferences.getString('token') ?? '';
//   print(token);
//   return token;
// }

class CarProvider with ChangeNotifier {
  List<Product> _items = [];

  Future<String> fetchProduct() async {
    // print(token);
    const url = 'https://autolease.em2.in/autolease/products';
    // const url = 'http://192.168.56.1:8080/products';

    try {
      final response = await http.get(url
          // headers: <String, String>{'Authorization': 'Bearer ' + token});
          );
      // print(json.decode(response.body));
      // final extractedData =
      // (json.decode(response.body) as Map<String, dynamic>);
      final extractedData = (json.decode(response.body) as List);
      print(extractedData);
      List<Product> loadedProducts = [];
      extractedData.forEach((element) {
        // print(element);
        if (element['status'] == '1') {
          loadedProducts.add(
            Product(
                id1: element['id'],
                name: element['name'],
                seat: element['seat'],
                engin: element['engin'],
                ac: element['ac'],
                door: element['door'],
                gear: element['gear'],
                luggage: element['luggage'],
                costPerDay: element['costPerDay'],
                costPreMounth: element['costPerMonth'],
                imageurl: element['imageurl'],
                id: element['id'],
                costPerHour: element['costPerHour'],
                chc1: element['paiCost'],
                temppaicost: element['paiCost'],
                chc2: element['cdwCost'],
                // tempcdwcost: element['cdwCost'],
                // tempbiwcost: element['biwCost'],
                driverCost: element['driverCost'],
                seatCost: element['childSeatCost'],
                carModel: element['carModel']),
          );
        }
      });
      print(
          '---------------------------------END OF FETCH PRODUCTS-------------------------------------');
      _items = loadedProducts;
      // print(_items);
      notifyListeners();
    } catch (error) {
      // throw (error);
      print('error');
      print(error);
    }
  }

  var _showFav = false;
  int _driver = 0;
  List<Product> get items {
    if (_showFav) {
      return _items.where((prodItm) => prodItm.isFavorite).toList();
    }
    return [..._items];
  }

  void showfav() {
    _showFav = true;
    notifyListeners();
  }

  void showall() {
    _showFav = false;
    notifyListeners();
  }

  void addProduct() {
    //_items.add(value);
    notifyListeners();
  }

  void addDriver() {
    _driver = _driver + 1;
    notifyListeners();
  }
}
