import 'package:climate_app/features/domain/entities/climate_model.dart';
import 'package:climate_app/supporting_files/app_globals/app_colors.dart';
import 'package:climate_app/supporting_files/app_globals/app_string.dart';
import 'package:climate_app/supporting_files/functions/app_functions.dart';
import 'package:flutter/material.dart';

class ForecastList extends StatelessWidget {
  final List<Forecastday>? dayDetails;
  const ForecastList({super.key, this.dayDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.appTextColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppString.sevenDayForcast,
            style: const TextStyle(
              color: AppColors.appTextColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: dayDetails?.length ?? 0,
            itemBuilder: (context, index) {
              var dayData = dayDetails?[index];
              return ForecastRow(dayData: dayData);
            },
          ),
        ],
      ),
    );
  }
}

class ForecastRow extends StatelessWidget {
  final Forecastday? dayData;

  const ForecastRow({super.key, required this.dayData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppFunctions.formatDate(dayData?.date ?? DateTime.now()),
            style: const TextStyle(
              fontSize: 18,
              color: AppColors.appTextColor,
            ),
          ),
          const Icon(Icons.wb_sunny, color: Colors.yellowAccent),
          Text(
            "${dayData?.day?.maxtempC ?? ""}",
            style: const TextStyle(
              fontSize: 18,
              color: AppColors.appTextColor,
            ),
          ),
          Text(
            "${dayData?.day?.mintempC ?? ""}",
            style: TextStyle(
              fontSize: 18,
              color: AppColors.appTextColor.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}
