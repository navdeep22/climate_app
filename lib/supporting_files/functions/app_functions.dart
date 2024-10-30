import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:intl/intl.dart';

class AppFunctions {
  static String extractTimeFromDate(String dateString) {
    DateTime dateTime = DateFormat("yyyy-MM-dd HH:mm").parse(dateString);
    String formattedTime = DateFormat("hh:mm a").format(dateTime);
    return formattedTime;
  }

  static String formatDate(DateTime dateTime) {
    String formattedDate = DateFormat("d MMM").format(dateTime);
    return formattedDate;
  }

  static Future<bool> checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();

    return connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi);
  }
}
