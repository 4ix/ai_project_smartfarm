import 'package:flutter/material.dart';
import 'package:smartfarm/models/colors_model.dart';
import 'package:smartfarm/widgets/soil_dashboard_screen.dart';

class SoilScreen extends StatefulWidget {
  const SoilScreen({
    super.key,
    required this.userId,
    required this.userSite,
  });

  final String userId;
  final String userSite;

  @override
  State<SoilScreen> createState() => _SoilScreenState();
}

class _SoilScreenState extends State<SoilScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsModel.first,
      body: Column(
        children: [
          SoilDashboard(
            userId: widget.userId,
            userSite: widget.userSite,
          ),
          const Padding(
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
