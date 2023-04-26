import 'package:flutter/material.dart';
import 'package:smartfarm/models/external_model.dart';
import '../services/api_service.dart';

class ExternalSensor extends StatefulWidget {
  const ExternalSensor({
    super.key,
  });

  @override
  State<ExternalSensor> createState() => _ExternalSensorState();
}

class _ExternalSensorState extends State<ExternalSensor> {
  final Future<List<ExternalModel>> externals = ApiService.getExternals();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: externals,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ExternalWidget(
            externalSnapshot: snapshot,
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class ExternalWidget extends StatelessWidget {
  const ExternalWidget({
    super.key,
    required this.externalSnapshot,
  });

  final AsyncSnapshot<List<ExternalModel>> externalSnapshot;

  @override
  Widget build(BuildContext context) {
    IconData iconData;
    switch (externalSnapshot.data![0].weather) {
      case '맑음':
        iconData = Icons.sunny;
        break;
      case '흐림':
        iconData = Icons.cloud;
        break;
      case '비':
        iconData = Icons.water;
      case '눈':
        iconData = Icons.snowing;
      default:
        iconData = Icons.error;
    }

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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    '외부 온도',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0XFF94AF9F),
                                    ),
                                  ),
                                  Text(
                                    '${externalSnapshot.data![0].temperature} ℃',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Color(0XFF94AF9F),
                                    ),
                                  ),
                                ],
                              ),
                              const Icon(
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    '외부 습도',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0XFF94AF9F),
                                    ),
                                  ),
                                  Text(
                                    '${externalSnapshot.data![0].humidity} %',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Color(0XFF94AF9F),
                                    ),
                                  ),
                                ],
                              ),
                              const Icon(
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    '날씨',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0XFF94AF9F),
                                    ),
                                  ),
                                  Text(
                                    '${externalSnapshot.data![0].weather}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Color(0XFF94AF9F),
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                iconData,
                                size: 50,
                                color: const Color(0XFF94AF9F),
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    '풍향',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0XFF94AF9F),
                                    ),
                                  ),
                                  Text(
                                    '${externalSnapshot.data![0].wind_direction}',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Color(0XFF94AF9F),
                                    ),
                                  ),
                                ],
                              ),
                              const Icon(
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    '풍속',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Color(0XFF94AF9F),
                                    ),
                                  ),
                                  Text(
                                    '${externalSnapshot.data![0].wind_speed} m/s',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: Color(0XFF94AF9F),
                                    ),
                                  ),
                                ],
                              ),
                              const Icon(
                                Icons.wind_power_outlined,
                                size: 50,
                                color: Color(0XFF94AF9F),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // const SizedBox(
                      //   width: 10,
                      // ),
                      // Container(
                      //   width: 150,
                      //   height: 71,
                      //   decoration: const BoxDecoration(
                      //     color: Color(0XFFDBE4C6),
                      //   ),
                      //   child: const Padding(
                      //     padding: EdgeInsets.all(8.0),
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //       children: [
                      //         Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             Text(
                      //               '일사량',
                      //               style: TextStyle(
                      //                 fontSize: 20,
                      //                 color: Color(0XFF94AF9F),
                      //               ),
                      //             ),
                      //             Text(
                      //               '0 W/㎡',
                      //               style: TextStyle(
                      //                 fontSize: 18,
                      //                 color: Color(0XFF94AF9F),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //         Icon(
                      //           Icons.wb_sunny_outlined,
                      //           size: 50,
                      //           color: Color(0XFF94AF9F),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
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
