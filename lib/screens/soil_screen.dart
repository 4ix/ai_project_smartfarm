import 'package:flutter/material.dart';
import 'package:smartfarm/models/colors_model.dart';
import 'package:smartfarm/screens/soil_dashboard_screen.dart';

class SoilScreen extends StatelessWidget {
  const SoilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorsModel.first,
      body: Column(
        children: [
          SoilDashboard(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage('assets/soil.png'),
            ),
          ),
        ],
      ),
    );
  }
}
