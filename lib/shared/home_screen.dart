import 'package:flutter/material.dart';
import 'package:smartfarm/models/colors_model.dart';
import 'package:smartfarm/screens/sensor_screen.dart';
import 'package:smartfarm/screens/controler_screen.dart';
import 'package:smartfarm/screens/soil_screen.dart';
import 'package:smartfarm/screens/cctv_screen.dart';

import '../screens/settings_screen.dart';
import 'menu_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.userIndex,
    required this.userName,
    required this.userEmail,
  });

  final int userIndex;
  final String userName;
  final String userEmail;

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
      backgroundColor: ColorsModel.first,
      appBar: AppBar(
        title: const Text('스마트 팜'),
        backgroundColor: ColorsModel.third,
        foregroundColor: ColorsModel.fourth,
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
      drawer: MenuDrawer(
        userIndex: widget.userIndex,
        userName: widget.userName,
        userEmail: widget.userEmail,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: ColorsModel.fourth,
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorsModel.second,
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
