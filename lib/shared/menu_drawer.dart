import 'package:flutter/material.dart';
import '../models/colors_model.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({
    Key? key,
    required this.userId,
    required this.userName,
    required this.userEmail,
    required this.userSites,
  }) : super(key: key);

  final String userId;
  final String userName;
  final String userEmail;
  final List<String> userSites;

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  String? _selectedSiteId;

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
          ListView.builder(
            shrinkWrap: true,
            itemCount: widget.userSites.length,
            itemBuilder: (context, index) {
              final siteId = widget.userSites[index];
              return ListTile(
                title: Text(
                  '농장 #$siteId',
                  style: TextStyle(
                    fontWeight: _selectedSiteId == siteId
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                onTap: () {
                  setState(() {
                    _selectedSiteId = siteId;
                    showSnackBar(
                      context,
                      Text('$siteId 를 선택하셨습니다.'),
                    );
                  });
                  Navigator.pop(context);
                },
                selected: _selectedSiteId == siteId,
              );
            },
          ),
        ],
      ),
    );
  }
}

void showSnackBar(BuildContext context, text) {
  final snackBar = SnackBar(
    content: text,
    backgroundColor: ColorsModel.third,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
