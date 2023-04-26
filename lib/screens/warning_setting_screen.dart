import 'package:flutter/material.dart';

class WarningSetting extends StatefulWidget {
  const WarningSetting({super.key});

  @override
  State<WarningSetting> createState() => _WarningSettingState();
}

class _WarningSettingState extends State<WarningSetting> {
  bool _isChecked1 = false;
  String dropdownValueHigh = '27';
  String dropdownValueLow = '17';
  List<String> itemListHigh = ['20', '21', '22', '23', '24', '25', '26', '27'];
  List<String> itemListLow = ['10', '11', '12', '13', '14', '15', '16', '17'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color(0XFFAEC2B6)),
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
                color: Color(0XFFDBE4C6),
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
                    color: Color(0XFFDBE4C6),
                  ),
                ),
                Switch(
                  activeColor: const Color(0XFF94AF9F),
                  inactiveThumbColor: const Color(0XFFAEC2B6),
                  value: _isChecked1,
                  onChanged: (value) {
                    setState(
                      () {
                        _isChecked1 = value;
                      },
                    );
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
                    color: Color(0XFFDBE4C6),
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
                  },
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  '저온 경보',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0XFFDBE4C6),
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
