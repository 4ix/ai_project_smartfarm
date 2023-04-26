import 'package:flutter/material.dart';

import '../models/colors_model.dart';

class InternalSensor extends StatelessWidget {
  const InternalSensor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 150,
                        height: 71,
                        decoration: const BoxDecoration(
                          color: ColorsModel.fourth,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '내부 온도',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: ColorsModel.third,
                                    ),
                                  ),
                                  Text(
                                    '23.8 ℃',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: ColorsModel.third,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.device_thermostat_outlined,
                                size: 50,
                                color: ColorsModel.third,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 150,
                        height: 71,
                        decoration: const BoxDecoration(
                          color: ColorsModel.fourth,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '내부 습도',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: ColorsModel.third,
                                    ),
                                  ),
                                  Text(
                                    '69.2 %',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: ColorsModel.third,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.water_drop_outlined,
                                size: 50,
                                color: ColorsModel.third,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  //2번째 줄 시작
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 150,
                        height: 71,
                        decoration: const BoxDecoration(
                          color: ColorsModel.fourth,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '토양 온도',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: ColorsModel.third,
                                    ),
                                  ),
                                  Text(
                                    '15.3 ℃',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: ColorsModel.third,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.device_thermostat_outlined,
                                size: 50,
                                color: ColorsModel.third,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 150,
                        height: 71,
                        decoration: const BoxDecoration(
                          color: ColorsModel.fourth,
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '토양 습도',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: ColorsModel.third,
                                    ),
                                  ),
                                  Text(
                                    '78.6 %',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: ColorsModel.third,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.water_drop_outlined,
                                size: 50,
                                color: ColorsModel.third,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
