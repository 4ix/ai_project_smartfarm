import 'package:flutter/material.dart';
import 'package:smartfarm/shared/menu_drawer.dart';

import '../shared/menu_bottom.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBBD6B8),
      appBar: AppBar(
        title: const Text('스마트 팜'),
        backgroundColor: const Color(0xFF94AF9F),
        foregroundColor: const Color(0xFFDBE4C6),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuBottom(),
    );
  }
}
