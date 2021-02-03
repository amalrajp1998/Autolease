import 'package:flutter/cupertino.dart';

class Booking with ChangeNotifier {
  final String carName;
  final int bookinId;
  final int total;
  final String date;
  final String endDate;
  Booking({this.bookinId, this.carName, this.total, this.date, this.endDate});
}
