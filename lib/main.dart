import 'package:flutter/material.dart';
import 'package:konga_testapp/constants/colors.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const KongaApp());
}

class KongaApp extends StatelessWidget {
  const KongaApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konga',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
      ),
      home: const ResponsiveHomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
