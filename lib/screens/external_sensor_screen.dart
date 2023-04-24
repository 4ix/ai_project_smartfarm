import 'package:flutter/material.dart';

class ExternalSensor extends StatelessWidget {
  const ExternalSensor({
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
                          color: Color(0XFFDBE4C6),
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
                                    '외부 온도',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0XFF94AF9F),
                                    ),
                                  ),
                                  Text(
                                    '12.5 ℃',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0XFF94AF9F),
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.device_thermostat_outlined,
                                size: 50,
                                color: Color(0XFF94AF9F),
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
                          color: Color(0XFFDBE4C6),
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
                                    '외부 습도',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0XFF94AF9F),
                                    ),
                                  ),
                                  Text(
                                    '62.3 %',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0XFF94AF9F),
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.water_drop_outlined,
                                size: 50,
                                color: Color(0XFF94AF9F),
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
                          color: Color(0XFFDBE4C6),
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
                                    '강우',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0XFF94AF9F),
                                    ),
                                  ),
                                  Text(
                                    '비 안옴',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0XFF94AF9F),
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.wb_cloudy,
                                size: 50,
                                color: Color(0XFF94AF9F),
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
                          color: Color(0XFFDBE4C6),
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
                                    '풍향',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0XFF94AF9F),
                                    ),
                                  ),
                                  Text(
                                    '남동향',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0XFF94AF9F),
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.assistant_navigation,
                                size: 50,
                                color: Color(0XFF94AF9F),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  //3번째 줄 시작
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 150,
                        height: 71,
                        decoration: const BoxDecoration(
                          color: Color(0XFFDBE4C6),
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
                                    '풍속',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0XFF94AF9F),
                                    ),
                                  ),
                                  Text(
                                    '1.2 m/s',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0XFF94AF9F),
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.wind_power_outlined,
                                size: 50,
                                color: Color(0XFF94AF9F),
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
                          color: Color(0XFFDBE4C6),
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
                                    '일사량',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0XFF94AF9F),
                                    ),
                                  ),
                                  Text(
                                    '0 W/㎡',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0XFF94AF9F),
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.wb_sunny_outlined,
                                size: 50,
                                color: Color(0XFF94AF9F),
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
