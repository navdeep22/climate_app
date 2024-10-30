import 'package:climate_app/supporting_files/app_globals/app_toast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppExceptions {
  static Future<void> manageException(
      http.Response response, BuildContext context) async {
    if (response.statusCode == 401 || response.statusCode == 440) {
    } else if (response.statusCode == 500) {
      AppToast.showAppToast(msg: "ERROR");
    } else {
      AppToast.showAppToast(msg: "No city found with this name");
    }
  }
}
