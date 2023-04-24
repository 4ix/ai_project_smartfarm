import 'package:flutter/material.dart';
import 'package:smartfarm/shared/menu_drawer.dart';

import '../shared/menu_bottom.dart';
import 'external_sensor_screen.dart';
import 'internal_sensor_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _expanded1 = true;
  bool _expanded2 = false;

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
              ExpansionPanel(
                backgroundColor: const Color(0XFFAEC2B6),
                headerBuilder: (context, isExpanded) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      '내부 환경',
                      style: TextStyle(
                        color: Color(0XFFDBE4C6),
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
                body: const InternalSensor(),
                isExpanded: _expanded2,
              ),
            ],
            expansionCallback: (panelIndex, isExpanded) {
              if (panelIndex == 0) {
                setState(() {
                  _expanded1 = !_expanded1;
                });
              }
              if (panelIndex == 1) {
                setState(() {
                  _expanded2 = !_expanded2;
                });
              }
            },
          ),
        ),
      ),
      drawer: const MenuDrawer(),
      bottomNavigationBar: const MenuBottom(),
    );
  }
}
