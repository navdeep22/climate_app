import 'package:climate_app/features/domain/entities/climate_model.dart';
import 'package:climate_app/features/domain/repositories/climate_repository.dart';
import 'package:climate_app/supporting_files/app_globals/app_string.dart';
import 'package:climate_app/supporting_files/app_globals/app_toast.dart';
import 'package:climate_app/supporting_files/functions/app_functions.dart';
import 'package:flutter/material.dart';

class ClimateUsecases {
  final ClimateRepository climateRepository;
  ClimateUsecases(this.climateRepository);

  Future<ClimateModel?>? fetchClimateDetails(
      BuildContext context, String city) async {
    bool isConnected = await AppFunctions.checkInternetConnection();
    if (isConnected) {
      if (context.mounted) {
        return climateRepository.fetchClimateDetails(context, city);
      }
    } else {
      AppToast.showAppToast(msg: AppString.noInternetError);
    }
    return null;
  }
}
