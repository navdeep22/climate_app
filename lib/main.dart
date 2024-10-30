import 'package:climate_app/features/presentation/pages/climate_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      builder: (context, mywidget) {
        mywidget = EasyLoading.init()(context, mywidget);
        mywidget = MediaQuery(
          data: MediaQuery.of(context).copyWith(),
          child: mywidget,
        );
        mywidget = MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1),
          ),
          child: mywidget,
        );
        return mywidget;
      },
      home: const ClimateScreen(),
    );
  }
}
