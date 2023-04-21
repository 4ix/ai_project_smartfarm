import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
            accountName: Text('사용자명',
                style: TextStyle(
                  color: Color(0xFFDBE4C6),
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                )),
            accountEmail: Text(
              '이멜주소@gmail.com',
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
    );
  }
}
