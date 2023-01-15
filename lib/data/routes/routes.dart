import 'package:agendamientos/data/constans.dart';
import 'package:agendamientos/features/home/home_screen.dart';
import 'package:agendamientos/features/reservation/reservation_screen.dart';
import 'package:agendamientos/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  Routes.splash: (_) => const SplashScreen(),
  Routes.home: (_) => const HomeScreen(),
  Routes.reservation: (_) => const ReservationScreen(),
};
