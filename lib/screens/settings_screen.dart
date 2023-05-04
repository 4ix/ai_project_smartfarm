import 'package:flutter/material.dart';
import 'package:smartfarm/models/colors_model.dart';
import 'package:smartfarm/screens/login_screen.dart';
import 'package:smartfarm/widgets/warning_setting_screen.dart';

import 'change_password_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    super.key,
    required this.userId,
  });

  final String userId;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsModel.first,
      appBar: AppBar(
        title: const Text('설정'),
        backgroundColor: ColorsModel.third,
        foregroundColor: ColorsModel.fourth,
      ),
      body: Column(children: [
        const WarningSetting(),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ButtonTheme(
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChangePassWordScreen(
                            userId: widget.userId,
                          )),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsModel.third,
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text(
                '비밀번호 변경',
                style: TextStyle(
                  fontSize: 30,
                  color: ColorsModel.fourth,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ButtonTheme(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, '/', (_) => false);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsModel.third,
                minimumSize: const Size.fromHeight(50),
              ),
              child: const Text(
                '로그아웃',
                style: TextStyle(
                  fontSize: 30,
                  color: ColorsModel.fourth,
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
