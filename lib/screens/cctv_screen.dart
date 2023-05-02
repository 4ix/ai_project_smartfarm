import 'package:flutter/material.dart';
import 'package:smartfarm/models/colors_model.dart';
import 'package:smartfarm/screens/cctv1_screen.dart';

class CctvScreen extends StatefulWidget {
  const CctvScreen({
    super.key,
    required this.userId,
    required this.userSite,
  });

  final String userId;
  final String userSite;

  @override
  State<CctvScreen> createState() => _CctvScreenState();
}

class _CctvScreenState extends State<CctvScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorsModel.first,
      body: Column(
        children: [CctvOne()],
      ),
    );
  }
}
