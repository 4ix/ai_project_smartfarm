import 'package:flutter/material.dart';
import 'package:smartfarm/services/api_service.dart';
import '../models/colors_model.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({
    super.key,
    required this.userId,
    required this.userName,
    required this.userEmail,
  });

  final String userId;
  final String userName;
  final String userEmail;

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  void initState() {
    super.initState();
    ApiService.getSites(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorsModel.first,
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
              widget.userName,
              style: const TextStyle(
                color: ColorsModel.fourth,
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            accountEmail: Text(
              widget.userEmail,
              style: const TextStyle(
                color: ColorsModel.fourth,
                fontSize: 16,
              ),
            ),
            decoration: const BoxDecoration(
              color: ColorsModel.third,
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
