import 'package:flutter/material.dart';
import 'package:smartfarm/screens/cctv1_screen.dart';

class CctvScreen extends StatelessWidget {
  const CctvScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0XFFBBD6B8),
      body: Column(
        children: [CctvOne()],
      ),
    );
  }
}
