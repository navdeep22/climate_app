import 'package:climate_app/features/domain/entities/climate_model.dart';
import 'package:flutter/material.dart';

abstract class ClimateRepository {
  Future<ClimateModel?>? fetchClimateDetails(BuildContext context, String city);
}
