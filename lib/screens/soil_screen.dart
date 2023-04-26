import 'package:flutter/material.dart';
import 'package:smartfarm/screens/soil_dashboard_screen.dart';

class SoilScreen extends StatelessWidget {
  const SoilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFBBD6B8),
      body: Column(
        children: [SoilDashboard()],
      ),
    );
  }
}
