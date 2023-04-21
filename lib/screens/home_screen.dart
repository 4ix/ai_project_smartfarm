import 'package:flutter/material.dart';

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
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFFBBD6B8),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/profile.png',
                ),
              ),
              accountName: Text('오늘도 헛소리',
                  style: TextStyle(
                    color: Color(0xFFDBE4C6),
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  )),
              accountEmail: Text(
                'oh@heart.sound',
                style: TextStyle(
                  color: Color(0xFFDBE4C6),
                  fontSize: 16,
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xFF94AF9F),
              ),
            ),
            ListTile(
              title: const Text('농장 #1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('농장 #2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
