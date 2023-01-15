import 'package:flutter/material.dart';
import 'package:agendamientos/data/constans.dart';

class CourtSelectionScreen extends StatefulWidget {
  const CourtSelectionScreen({Key? key}) : super(key: key);

  @override

  _CourtSelectionScreenState createState() => _CourtSelectionScreenState();
}

class _CourtSelectionScreenState extends State<CourtSelectionScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Selección de cancha"),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, Routes.reservation),
          child: const Icon(Icons.add)),
      body: const Center(child: Text("SelectionCourt page")),
    );
  }
}