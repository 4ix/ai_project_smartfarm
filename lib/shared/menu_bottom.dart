import 'package:flutter/material.dart';

class MenuBottom extends StatelessWidget {
  const MenuBottom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
        ]);
  }
}
