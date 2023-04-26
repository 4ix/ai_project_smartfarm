import 'package:flutter/material.dart';

class EtcControllerScreen extends StatefulWidget {
  const EtcControllerScreen({super.key});

  @override
  State<EtcControllerScreen> createState() => _EtcControllerScreenState();
}

class _EtcControllerScreenState extends State<EtcControllerScreen> {
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(color: Color(0XFFDBE4C6)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        '환풍기 세기',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0XFF94AF9F),
                        ),
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
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: const BoxDecoration(color: Color(0XFFDBE4C6)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        '환풍기 각도',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0XFF94AF9F),
                        ),
                      ),
                    ),
                    Switch(
                      activeColor: const Color(0XFF94AF9F),
                      inactiveThumbColor: const Color(0XFFAEC2B6),
                      value: _isChecked2,
                      onChanged: (value) {
                        setState(
                          () {
                            _isChecked2 = value;
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: const BoxDecoration(color: Color(0XFFDBE4C6)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        '조도 제어',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0XFF94AF9F),
                        ),
                      ),
                    ),
                    Switch(
                      activeColor: const Color(0XFF94AF9F),
                      inactiveThumbColor: const Color(0XFFAEC2B6),
                      value: _isChecked3,
                      onChanged: (value) {
                        setState(
                          () {
                            _isChecked3 = value;
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
