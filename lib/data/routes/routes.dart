import 'package:agendamientos/data/constans.dart';
import 'package:agendamientos/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  Routes.splash: (_) => const SplashScreen(),
};
