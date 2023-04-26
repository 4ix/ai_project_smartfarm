import 'package:flutter/material.dart';
import 'package:smartfarm/models/colors_model.dart';

class SoilDashboard extends StatelessWidget {
  const SoilDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: const BoxDecoration(
        color: ColorsModel.second,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              height: 46,
              decoration: const BoxDecoration(color: ColorsModel.fourth),
              child: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.sunny,
                          size: 30,
                          color: ColorsModel.third,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            '맑음 / 23.8℃',
                            style: TextStyle(
                              fontSize: 15,
                              color: ColorsModel.third,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 165,
                  decoration: const BoxDecoration(
                    color: ColorsModel.fourth,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(6),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.device_thermostat_outlined,
                              size: 30,
                              color: ColorsModel.third,
                            ),
                            Text(
                              '내부 온도',
                              style: TextStyle(
                                fontSize: 15,
                                color: ColorsModel.third,
                              ),
                            ),
                            Text(
                              '23.8℃',
                              style: TextStyle(
                                fontSize: 15,
                                color: ColorsModel.third,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.water_drop_outlined,
                              size: 30,
                              color: ColorsModel.third,
                            ),
                            Text(
                              '내부 습도',
                              style: TextStyle(
                                fontSize: 15,
                                color: ColorsModel.third,
                              ),
                            ),
                            Text(
                              '23.8℃',
                              style: TextStyle(
                                fontSize: 15,
                                color: ColorsModel.third,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 165,
                  decoration: const BoxDecoration(
                    color: ColorsModel.fourth,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(6),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.device_thermostat_outlined,
                              size: 30,
                              color: ColorsModel.third,
                            ),
                            Text(
                              '토양 온도',
                              style: TextStyle(
                                fontSize: 15,
                                color: ColorsModel.third,
                              ),
                            ),
                            Text(
                              '15.3℃',
                              style: TextStyle(
                                fontSize: 15,
                                color: ColorsModel.third,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.water_drop_outlined,
                              size: 30,
                              color: ColorsModel.third,
                            ),
                            Text(
                              '토양 습도',
                              style: TextStyle(
                                fontSize: 15,
                                color: ColorsModel.third,
                              ),
                            ),
                            Text(
                              '72.8%',
                              style: TextStyle(
                                fontSize: 15,
                                color: ColorsModel.third,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
