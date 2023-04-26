import 'package:flutter/material.dart';
import 'package:smartfarm/screens/sensor_screen.dart';
import 'package:smartfarm/screens/controler_screen.dart';
import 'package:smartfarm/screens/soil_screen.dart';
import 'package:smartfarm/screens/cctv_screen.dart';

import 'settings_screen.dart';
import 'menu_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const SensorScreen(),
    const ControlerScreen(),
    const SoilScreen(),
    const CctvScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const SettingsScreen(),
                ),
              );
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: _widgetOptions[_selectedIndex],
      drawer: const MenuDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: const Color(0xFFDBE4C6),
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFFAEC2B6),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.device_thermostat_outlined),
            label: '센서',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_input_composite_outlined),
            label: '환경제어',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.grass_outlined),
            label: '토양제어',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videocam),
            label: 'CCTV',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
