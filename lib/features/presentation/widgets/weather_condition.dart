import 'package:climate_app/features/domain/entities/climate_model.dart';
import 'package:climate_app/supporting_files/app_globals/app_colors.dart';
import 'package:climate_app/supporting_files/functions/app_functions.dart';
import 'package:flutter/material.dart';

class WeatherCondition extends StatelessWidget {
  final Forecastday? dayDetails;
  const WeatherCondition({super.key, this.dayDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.appTextColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Sunrise at ${dayDetails?.astro?.sunrise} and sunset at ${dayDetails?.astro?.sunset}",
            style: const TextStyle(
              color: AppColors.appTextColor,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(dayDetails?.hour?.length ?? 0, (index) {
                var dayData = dayDetails?.hour?[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    children: [
                      const Icon(Icons.wb_sunny, color: Colors.yellow),
                      const SizedBox(height: 5),
                      Text(
                        "${dayData?.tempC}",
                        style: const TextStyle(
                          color: AppColors.appTextColor,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        AppFunctions.extractTimeFromDate(dayData?.time ?? ""),
                        style: TextStyle(
                          color: AppColors.appTextColor.withOpacity(0.7),
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
