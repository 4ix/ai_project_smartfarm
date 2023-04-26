import 'package:flutter/material.dart';

class SoilDashboard extends StatelessWidget {
  const SoilDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: const BoxDecoration(
        color: Color(0XFFAEC2B6),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              height: 46,
              decoration: const BoxDecoration(color: Color(0XFFDBE4C6)),
              child: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.sunny,
                          size: 30,
                          color: Color(0XFF94AF9F),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            '맑음 / 23.8℃',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0XFF94AF9F),
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
                    color: Color(0XFFDBE4C6),
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
                              color: Color(0XFF94AF9F),
                            ),
                            Text(
                              '내부 온도',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0XFF94AF9F),
                              ),
                            ),
                            Text(
                              '23.8℃',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0XFF94AF9F),
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
                              color: Color(0XFF94AF9F),
                            ),
                            Text(
                              '내부 습도',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0XFF94AF9F),
                              ),
                            ),
                            Text(
                              '23.8℃',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0XFF94AF9F),
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
                    color: Color(0XFFDBE4C6),
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
                              color: Color(0XFF94AF9F),
                            ),
                            Text(
                              '토양 온도',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0XFF94AF9F),
                              ),
                            ),
                            Text(
                              '15.3℃',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0XFF94AF9F),
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
                              color: Color(0XFF94AF9F),
                            ),
                            Text(
                              '토양 습도',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0XFF94AF9F),
                              ),
                            ),
                            Text(
                              '72.8%',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color(0XFF94AF9F),
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
