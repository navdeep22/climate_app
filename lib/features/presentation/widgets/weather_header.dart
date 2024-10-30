import 'package:climate_app/features/domain/entities/climate_model.dart';
import 'package:climate_app/supporting_files/app_globals/app_colors.dart';
import 'package:flutter/material.dart';

class WeatherHeader extends StatelessWidget {
  final Current? currentTemp;
  final Location? currentLocation;
  const WeatherHeader(
      {super.key, required this.currentTemp, required this.currentLocation});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          currentLocation?.name ?? "",
          style: const TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            color: AppColors.appTextColor,
          ),
        ),
        Text(
          (currentTemp?.tempC ?? 0).toString(),
          style: const TextStyle(
            fontSize: 80,
            color: AppColors.appTextColor,
          ),
        ),
        Text(
          "Current Condition: ${currentTemp?.condition?.text}",
          style: TextStyle(
            fontSize: 20,
            color: AppColors.appTextColor.withOpacity(0.8),
          ),
        ),
        Text(
          "Humidity: ${currentTemp?.humidity}  Wind Speed: ${currentTemp?.windKph} km/h",
          style: TextStyle(
            fontSize: 16,
            color: AppColors.appTextColor.withOpacity(0.8),
          ),
        ),
      ],
    );
  }
}
