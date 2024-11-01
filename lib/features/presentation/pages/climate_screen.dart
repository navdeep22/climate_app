import 'package:climate_app/features/data/climate_repository_impl.dart';
import 'package:climate_app/features/domain/entities/climate_model.dart';
import 'package:climate_app/features/domain/use_cases/climate_usecases.dart';
import 'package:climate_app/features/presentation/widgets/climate_app_bar.dart';
import 'package:climate_app/features/presentation/widgets/forecast_list.dart';
import 'package:climate_app/features/presentation/widgets/weather_condition.dart';
import 'package:climate_app/features/presentation/widgets/weather_header.dart';
import 'package:climate_app/supporting_files/app_globals/app_colors.dart';
import 'package:climate_app/supporting_files/app_globals/app_string.dart';
import 'package:flutter/material.dart';

class ClimateScreen extends StatefulWidget {
  const ClimateScreen({super.key});

  @override
  State<ClimateScreen> createState() => _ClimateScreenState();
}

class _ClimateScreenState extends State<ClimateScreen> {
  final ClimateUsecases climateUsecases =
      ClimateUsecases(ClimateRepositoryImpl());
  Future<ClimateModel?>? climateFuture;
  @override
  void initState() {
    super.initState();
    searchClimateData("jaipur");
  }

  void searchClimateData(String cityName) {
    setState(() {
      climateFuture = climateUsecases.fetchClimateDetails(context, cityName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.appBackgroundColor,
      child: SafeArea(
        child: Scaffold(
          appBar: ClimateAppBar(searchData: searchClimateData),
          backgroundColor: Colors.transparent,
          body: FutureBuilder(
              future: climateFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SizedBox();
                } else if (snapshot.hasError) {
                  return Center(child: Text(AppString.somethingWentWrong));
                } else {
                  var climateDetails = snapshot.data;
                  if (climateDetails?.location == null) {
                    return const Center(
                        child: Text(
                      "No data found for selected city",
                      style: TextStyle(
                          color: AppColors.appTextColor, fontSize: 20),
                    ));
                  } else {
                    return ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      children: [
                        WeatherHeader(
                            currentLocation: climateDetails?.location,
                            currentTemp: climateDetails?.current),
                        const SizedBox(height: 20),
                        WeatherCondition(
                            dayDetails:
                                climateDetails?.forecast?.forecastday?.first),
                        const SizedBox(height: 20),
                        ForecastList(
                          dayDetails:
                              climateDetails?.forecast?.forecastday ?? [],
                        ),
                      ],
                    );
                  }
                }
              }),
        ),
      ),
    );
  }
}
