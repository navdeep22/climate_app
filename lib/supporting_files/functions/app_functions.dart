import 'package:climate_app/supporting_files/app_globals/app_colors.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
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

  static void showCustomBottomSheet(BuildContext context, Widget child) {
    showModalBottomSheet(
      backgroundColor: AppColors.appBackgroundColor,
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.appTextColor.withOpacity(0.3),
          ),
          height: MediaQuery.of(context).size.height * 0.5,
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: child,
        );
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      isScrollControlled: true,
    );
  }
}
