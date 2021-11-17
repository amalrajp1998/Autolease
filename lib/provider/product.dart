import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';
import '../screens/fleet_design.dart';

var locationOptions = LocationOptions(distanceFilter: 10);
final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
String bookingMode = BookingMode;

class Product with ChangeNotifier {
  int id1;
  final int id;
  final String name;
  final String seat;
  final String engin;
  final String ac;
  final String door;
  final String gear;
  final String luggage;
  final double costPerDay;
  final double costPreMounth;
  final double costPerHour;
  final String imageurl;
  String bookingType;
  bool isFavorite;
  int driver = 0;
  int gps = 0;
  int cseat = 0;
  int totel;
  double driverTotal = 0;
  double driverTotalf = 0;
  double driverCost;
  double seatCost;
  int gpsTotel = 0;
  double cTotel = 0;
  double cTotelf = 0;
  bool ch1;
  bool ch2;
  bool ch3;
  double chc1 = 0;
  double chc2 = 0;
  int pai;
  double la;
  double lo;
  int carid;
  bool login = false;
  String custId;
  int cost;
  bool chM = false;
  int newPoint;
  String carModel;
  //Temp //
  int costDay;
  int costMonth;
  int costHour;
  int current;
  int monyback;
  int noofdays = 1;
  int tempch1 = 0;
  int tempch2 = 0;
  int tempbai = 0;
  int temppai = 0;
  int temppdw = 0;
  double temppaicost;
  double tempbiwcost = 0;
  double tempcdwcost = 0;
  double temptotal;
  int current1;
  bool selectDate = false;
  double temppaiFinal = 0;
  double tempcdwFinal = 0;
  int paistatus = 0;
  int cdwstatus = 0;
  //Temp//
  Product(
      {@required this.name,
      this.costPerHour,
      this.driverTotalf,
      this.cTotelf,
      @required this.seat,
      @required this.engin,
      @required this.ac,
      @required this.door,
      @required this.gear,
      @required this.luggage,
      @required this.costPerDay,
      @required this.costPreMounth,
      @required this.imageurl,
      @required this.id,
      this.isFavorite = false,
      this.driver = 0,
      this.gps = 0,
      this.cseat = 0,
      this.cTotel = 0,
      this.driverTotal = 0,
      this.gpsTotel = 0,
      this.totel,
      this.ch1 = true,
      this.ch2 = false,
      this.ch3 = true,
      this.pai,
      id1,
      this.bookingType,
      this.la,
      this.cost,
      this.lo,
      this.carid,
      this.custId,
      this.newPoint,
      this.costDay,
      this.costHour,
      this.costMonth,
      this.chc1,
      this.chc2,
      this.driverCost,
      this.seatCost,
      this.carModel,
      this.temppaicost,
      this.tempbiwcost,
      this.tempcdwcost = 0});
  void fav() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  void fch1() {
    ch1 = !ch1;
    if (ch1 == true) {
      temppaicost = temppaiFinal;
      paistatus = 1;
      totel = totel + temppaiFinal.toInt();
      notifyListeners();
      // if (ch2 == true && ch1 == true) {
      //   fch2();
      // }
    } else {
      paistatus = 0;
      totel = totel - temppaiFinal.toInt();
      temppaicost = 0;
      notifyListeners();
    }
    notifyListeners();
  }

  void fch3() {
    ch3 = !ch3;
    if (ch2 == true && ch3 == true) {
      fch2();
    }
    notifyListeners();
  }

  void fch2() {
    ch2 = !ch2;
    if (ch2 == true) {
      tempcdwcost = tempcdwFinal;
      cdwstatus = 1;
      totel = totel + tempcdwFinal.toInt();
      notifyListeners();
      if (ch3 == true) {
        ch3 = false;
      }
      // totel = totel + tempcdwFinal.toInt();
      notifyListeners();
    } else {
      cdwstatus = 0;
      totel = totel - tempcdwFinal.toInt();
      tempcdwcost = 0;
      notifyListeners();
    }
    // if (ch1 == true && ch2 == true) {
    // totel = totel + tempcdwFinal.toInt() + temppaiFinal.toInt();
    //   notifyListeners();
    // }
    notifyListeners();
  }

  void addDriver() {
    driver = driver + 1;
    driverTotal = driverTotal + driverCost.toInt();
    totel = totel + driverCost.toInt();
    notifyListeners();
    print(totel);
  }

  void subDriiver() {
    driver = driver - 1;
    driverTotal = driverTotal - driverCost.toInt();
    if (driver < 0) {
      driver = 0;
      driverTotal = 0;
    } else {
      totel = totel - driverCost.toInt();
    }
    notifyListeners();
  }

  void addgps() {
    gps = gps + 1;
    gpsTotel = gpsTotel + 10;
    totel = totel + 10;
    notifyListeners();
    // print(totel);
  }

  void subgps() {
    gps = gps - 1;
    gpsTotel = gpsTotel - 10;
    if (gps < 0) {
      gps = 0;
      gpsTotel = 0;
    } else {
      totel = totel - 10;
    }
    notifyListeners();
  }

  void addCseat() {
    cseat = cseat + 1;
    cTotel = cTotel + seatCost.toInt();
    totel = totel + seatCost.toInt();
    notifyListeners();
    // print(cseat);
  }

  // void addHireCost() {
  //   totel = 5;
  //   totel = totel + cost;
  //   notifyListeners();
  // }

  void subCseat() {
    cseat = cseat - 1;
    cTotel = cTotel - seatCost.toInt();
    if (cseat < 0) {
      cseat = 0;
      cTotel = 0;
    } else {
      totel = totel - seatCost.toInt();
      notifyListeners();
    }
    notifyListeners();
  }

  void location() {
    StreamSubscription<Position> positionStream = geolocator
        .getPositionStream(locationOptions)
        .listen((Position position) {
      la = position.latitude;
      lo = position.longitude;
      // print(la.toString() + '' + lo.toString());
    });
    notifyListeners();
  }

////////////////////////////////////////////needed edit////
  ///AutoLeaseMoney
  int mony = 100 ~/ 10;
  ////////////////////////////////////////////////////////
  fchM() {
    chM = !chM;
    monyback = mony;
    if (chM == true) {
      if (mony < totel) {
        totel = totel - mony;
        newPoint = 0;
      } else {
        mony = mony - totel;
        totel = 0;
        newPoint = mony * 10;
      }
      // print(mony);
      notifyListeners();
    }
    if (chM == false) {
      totel = totel + monyback;
      notifyListeners();
    }
    // print(chM);
    notifyListeners();
  }

  void chcheck() {
    if (ch1 == true) {
      tempch1 = chc1.toInt();
    }
    if (ch2 == true) {
      tempch2 = chc2.toInt();
    }
  }

  //Temp Functions//
  tempMonth(double n) {
    // totel = totel - current;
    // totel = 0;
    double day = n / 24;
    n = n / 720;
    temppai = ((temppaiFinal.toDouble() * day * paistatus) * 0.45).toInt();
    temppdw = ((tempcdwFinal.toDouble() * day * cdwstatus) * 0.45).toInt();
    current = (costMonth.toDouble() * n).toInt();
    driverTotalf = driverTotal * day;
    cTotelf = cTotel * day;

    totel =
        ((costMonth * n) + driverTotalf + cTotelf + temppai + temppdw).toInt();
    // BookingMode = 'Month';
    bookingType = 'Month';
    temptotal = totel.toDouble();
    selectDate = true;

    notifyListeners();
    return totel;
  }

  tempDay(double n) {
    print('$temppaiFinal pai');
    bookingType = 'Day';
    n = n / 24;
    driverTotalf = driverTotal * n;
    cTotelf = cTotel * n;
    temppai = (temppaiFinal.toDouble() * n * paistatus).toInt();
    print('$temppai pai totel');
    temppdw = (tempcdwFinal.toDouble() * n * cdwstatus).toInt();
    current = (costDay.toDouble() * n).toInt();
    totel = (current + driverTotalf + cTotelf + temppai + temppdw).toInt();
    temptotal = totel.toDouble();
    selectDate = true;
    notifyListeners();
    return totel;
  }

  temphour(double n) {
    driverTotalf = driverTotal * 1;
    cTotelf = cTotel * 1;
    bookingType = 'Hour';
    double day = n / 24;

    temppai = (temppaiFinal.toDouble() * 1 * paistatus).toInt();
    temppdw = (tempcdwFinal.toDouble() * 1 * cdwstatus).toInt();
    current = (costHour * (n <= 4 ? 4 : n)).toInt();
    totel = ((costHour * (n <= 4 ? 4 : n)) +
            driverTotalf +
            cTotelf +
            temppai +
            temppdw)
        .toInt();
    temptotal = totel.toDouble();
    selectDate = true;
    notifyListeners();
    return totel;
  }
  // tempMin() {
  //   temppai = temppaiFinal.toDouble() * 1 * paistatus;
  //   temppdw = tempcdwFinal.toDouble() * 1 * cdwstatus;
  //   // totel - totel - current;
  //   current = costHour.toDouble();
  //   totel = totel + costHour;
  //   temptotal = totel.toDouble();
  //   selectDate = true;
  //   notifyListeners();
  //   // print('Function return Statement');
  //   return totel;
  // }
}
