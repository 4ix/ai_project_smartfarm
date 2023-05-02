import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/colors_model.dart';

class WarningSetting extends StatefulWidget {
  const WarningSetting({super.key});

  @override
  State<WarningSetting> createState() => _WarningSettingState();
}

class _WarningSettingState extends State<WarningSetting> {
  late bool _isChecked1 = false;
  String dropdownValueHigh = '27';
  String dropdownValueLow = '17';
  List<String> itemListHigh = [
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29'
  ];
  List<String> itemListLow = [
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19'
  ];
  late SharedPreferences prefs;

  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      _isChecked1 = prefs.getBool('isChecked1') ?? false;
      dropdownValueHigh = prefs.getString('dropdownValueHigh') ?? '27';
      dropdownValueLow = prefs.getString('dropdownValueLow') ?? '17';
    });
  }

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  void _saveValues() async {
    await prefs.setBool('isChecked1', _isChecked1);
    await prefs.setString('dropdownValueHigh', dropdownValueHigh);
    await prefs.setString('dropdownValueLow', dropdownValueLow);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: ColorsModel.second),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '경보설정',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: ColorsModel.fourth,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '경보 활성화',
                  style: TextStyle(
                    fontSize: 20,
                    color: ColorsModel.fourth,
                  ),
                ),
                Switch(
                  activeColor: ColorsModel.third,
                  inactiveThumbColor: ColorsModel.second,
                  value: _isChecked1,
                  onChanged: (value) {
                    setState(() {
                      _isChecked1 = value;
                    });
                    _saveValues();
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '고온 경보',
                  style: TextStyle(
                    fontSize: 20,
                    color: ColorsModel.fourth,
                  ),
                ),
                DropdownButton(
                  style: const TextStyle(color: Colors.red),
                  value: dropdownValueHigh,
                  menuMaxHeight: 150,
                  items: itemListHigh.map((String itemText) {
                    return DropdownMenuItem<String>(
                      value: itemText,
                      child: SizedBox(child: Text(itemText)),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValueHigh = newValue!;
                    });
                    _saveValues();
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '저온 경보',
                  style: TextStyle(
                    fontSize: 20,
                    color: ColorsModel.fourth,
                  ),
                ),
                DropdownButton(
                  style: const TextStyle(color: Colors.blue),
                  value: dropdownValueLow,
                  menuMaxHeight: 150,
                  items: itemListLow.map((String itemText) {
                    return DropdownMenuItem<String>(
                      value: itemText,
                      child: SizedBox(child: Text(itemText)),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValueLow = newValue!;
                    });
                    _saveValues();
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
