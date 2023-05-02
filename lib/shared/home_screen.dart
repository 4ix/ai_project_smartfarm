import 'package:flutter/material.dart';
import 'package:smartfarm/models/colors_model.dart';

import '../screens/cctv_screen.dart';
import '../screens/controler_screen.dart';
import '../screens/sensor_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/soil_screen.dart';
import '../services/api_service.dart';
import 'menu_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    required this.userId,
    required this.userName,
    required this.userEmail,
  }) : super(key: key);

  final String userId;
  final String userName;
  final String userEmail;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  // ignore: unused_field
  late final Future<List<String>> _futureSites;

  List<String> _userSites = [];
  List<Widget> _widgetOptions = [Container()];
  @override
  void initState() {
    super.initState();
    _futureSites = ApiService.getSites(widget.userId).then((sites) {
      setState(() {
        _userSites = sites;
        _widgetOptions = [
          SensorScreen(
            userId: widget.userId,
            userSite: sites.first,
          ),
          ControlerScreen(
            userId: widget.userId,
            userSite: sites.first,
          ),
          SoilScreen(
            userId: widget.userId,
            userSite: sites.first,
          ),
          CctvScreen(
            userId: widget.userId,
            userSite: sites.first,
          ),
        ];
      });
      print(sites.first);
      return sites;
    });
  }

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
                  builder: (BuildContext context) => SettingsScreen(
                    userId: widget.userId,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: _widgetOptions[_selectedIndex],
      drawer: MenuDrawer(
        userId: widget.userId,
        userName: widget.userName,
        userEmail: widget.userEmail,
        userSites: _userSites,
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
