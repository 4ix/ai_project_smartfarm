import 'package:flutter/material.dart';
import 'package:smartfarm/services/api_service.dart';
import '../models/colors_model.dart';

class EtcControllerScreen extends StatefulWidget {
  const EtcControllerScreen({
    super.key,
    required this.userId,
    required this.userSite,
  });

  final String userId;
  final String userSite;

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
                decoration: const BoxDecoration(color: ColorsModel.fourth),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        '환풍기 제어',
                        style: TextStyle(
                          fontSize: 20,
                          color: ColorsModel.third,
                        ),
                      ),
                    ),
                    Switch(
                      activeColor: ColorsModel.third,
                      inactiveThumbColor: ColorsModel.second,
                      value: _isChecked1,
                      onChanged: (value) {
                        setState(
                          () {
                            _isChecked1 = value;
                            if (_isChecked1 == true) {
                              ApiService.getEtc1(
                                  widget.userId, widget.userSite, 'True');
                            } else {
                              ApiService.getEtc1(
                                  widget.userId, widget.userSite, 'False');
                            }
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
                decoration: const BoxDecoration(color: ColorsModel.fourth),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        '환풍구 제어',
                        style: TextStyle(
                          fontSize: 20,
                          color: ColorsModel.third,
                        ),
                      ),
                    ),
                    Switch(
                      activeColor: ColorsModel.third,
                      inactiveThumbColor: ColorsModel.second,
                      value: _isChecked2,
                      onChanged: (value) {
                        setState(
                          () {
                            _isChecked2 = value;
                            if (_isChecked2 == true) {
                              ApiService.getEtc2(
                                  widget.userId, widget.userSite, 'True');
                            } else {
                              ApiService.getEtc2(
                                  widget.userId, widget.userSite, 'False');
                            }
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
                decoration: const BoxDecoration(color: ColorsModel.fourth),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        '조도 제어',
                        style: TextStyle(
                          fontSize: 20,
                          color: ColorsModel.third,
                        ),
                      ),
                    ),
                    Switch(
                      activeColor: ColorsModel.third,
                      inactiveThumbColor: ColorsModel.second,
                      value: _isChecked3,
                      onChanged: (value) {
                        setState(
                          () {
                            _isChecked3 = value;
                            if (_isChecked3 == true) {
                              ApiService.getEtc3(
                                  widget.userId, widget.userSite, 'True');
                            } else {
                              ApiService.getEtc3(
                                  widget.userId, widget.userSite, 'False');
                            }
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
