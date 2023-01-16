import 'package:flutter/material.dart';
import 'package:agendamientos/data/constans.dart';

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reservar"),
      ),
        // floatingActionButton: FloatingActionButton(onPressed:() => Navigator.pushNamed(context, Routes.reservation),),
        body: Center(
          child: Column(
      children: [
          TextFormField(),
          TextFormField(),
          TextFormField(),
      ],
    ),
        ));
  }
}
