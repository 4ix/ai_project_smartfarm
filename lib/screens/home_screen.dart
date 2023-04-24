import 'package:flutter/material.dart';
import 'package:smartfarm/shared/menu_drawer.dart';

import '../shared/menu_bottom.dart';
import 'external_sensor_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _expanded1 = true;

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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: ExpansionPanelList(
            children: [
              ExpansionPanel(
                backgroundColor: const Color(0XFFAEC2B6),
                headerBuilder: (context, isExpanded) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      '외부 환경',
                      style: TextStyle(
                        color: Color(0XFFDBE4C6),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
                body: const ExternalSensor(),
                isExpanded: _expanded1,
              ),
            ],
            expansionCallback: (panelIndex, isExpanded) {
              setState(() {
                _expanded1 = !_expanded1;
              });
            },
          ),
        ),
      ),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuBottom(),
    );
  }
}
