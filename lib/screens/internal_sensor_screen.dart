import 'package:flutter/material.dart';
import 'package:smartfarm/models/internal_model.dart';

import '../models/colors_model.dart';
import '../services/api_service.dart';

class InternalSensor extends StatefulWidget {
  const InternalSensor({
    super.key,
  });

  @override
  State<InternalSensor> createState() => _InternalSensorState();
}

class _InternalSensorState extends State<InternalSensor> {
  final Future<List<InternalModel>> internals = ApiService.getInternals();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: internals,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return InternalWidget(
            internalSnapshot: snapshot,
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class InternalWidget extends StatelessWidget {
  const InternalWidget({
    super.key,
    required this.internalSnapshot,
  });

  final AsyncSnapshot<List<InternalModel>> internalSnapshot;

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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    '내부 온도',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: ColorsModel.third,
                                    ),
                                  ),
                                  Text(
                                    '${internalSnapshot.data![0].temperature} ℃',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: ColorsModel.third,
                                    ),
                                  ),
                                ],
                              ),
                              const Icon(
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    '내부 습도',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: ColorsModel.third,
                                    ),
                                  ),
                                  Text(
                                    '${internalSnapshot.data![0].humidity} %',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: ColorsModel.third,
                                    ),
                                  ),
                                ],
                              ),
                              const Icon(
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    '토양 온도',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: ColorsModel.third,
                                    ),
                                  ),
                                  Text(
                                    '${internalSnapshot.data![0].soil_temperature} ℃',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: ColorsModel.third,
                                    ),
                                  ),
                                ],
                              ),
                              const Icon(
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    '토양 습도',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: ColorsModel.third,
                                    ),
                                  ),
                                  Text(
                                    '${internalSnapshot.data![0].soil_humidity} %',
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: ColorsModel.third,
                                    ),
                                  ),
                                ],
                              ),
                              const Icon(
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
