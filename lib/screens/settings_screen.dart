import 'package:flutter/material.dart';
import 'package:smartfarm/models/colors_model.dart';
import 'package:smartfarm/screens/warning_setting_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

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
      body: const Column(children: [WarningSetting()]),
    );
  }
}
