import 'package:agendamientos/data/constans.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: Const.splashDuration),
        () => Navigator.pushReplacementNamed(context, Routes.home));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Const.radius),
          child: Image.asset(
            Assets.logo,
            width: 100,
            height: 100,
          ),
        ),
      ),
    );
  }
}
