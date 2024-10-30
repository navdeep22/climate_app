import 'dart:convert';

import 'package:climate_app/features/data/api_impl/api_impl.dart';
import 'package:climate_app/features/data/app_exceptions.dart';
import 'package:climate_app/features/domain/entities/climate_model.dart';
import 'package:climate_app/features/domain/repositories/climate_repository.dart';
import 'package:climate_app/supporting_files/app_globals/api_endpoints.dart';
import 'package:climate_app/supporting_files/app_globals/app_keys.dart';
import 'package:climate_app/supporting_files/app_globals/server_keys.dart';
import 'package:flutter/material.dart';

class ClimateRepositoryImpl extends ClimateRepository {
  static var client = ApiImpl();
  @override
  Future<ClimateModel?>? fetchClimateDetails(
      BuildContext context, String city) async {
    var params = {
      ServerKeys.key: AppKeys.apiKey,
      ServerKeys.city: city,
      ServerKeys.days: "7"
    };
    final url =
        Uri.parse(ApiEndpoints.weatherApi).replace(queryParameters: params);
    final response = await client.get(url);
    final json = jsonDecode(response.body);
    if (response.statusCode == 200) {
      return ClimateModel.fromJson(json);
    } else {
      if (context.mounted) {
        AppExceptions.manageException(response, context);
      }
    }
    return null;
  }
}
