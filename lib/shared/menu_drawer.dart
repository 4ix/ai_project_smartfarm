import 'package:flutter/material.dart';

import '../models/users_model.dart';
import '../services/api_service.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({
    super.key,
    required this.userIndex,
  });

  final int userIndex;

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  final Future<List<UsersModel>> users = ApiService.getUsers();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: users,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return DrawerWidget(
            userSnapshot: snapshot,
            userIndex: widget.userIndex,
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
    required this.userSnapshot,
    required this.userIndex,
  });

  final AsyncSnapshot<List<UsersModel>> userSnapshot;
  final int userIndex;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFBBD6B8),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage(
                'assets/profile.png',
              ),
            ),
            accountName: Text(
              userSnapshot.data![userIndex].username,
              style: const TextStyle(
                color: Color(0xFFDBE4C6),
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            accountEmail: Text(
              userSnapshot.data![userIndex].email,
              style: const TextStyle(
                color: Color(0xFFDBE4C6),
                fontSize: 16,
              ),
            ),
            decoration: const BoxDecoration(
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
