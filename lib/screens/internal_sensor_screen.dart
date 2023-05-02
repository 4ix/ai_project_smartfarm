import 'package:flutter/material.dart';
import 'package:smartfarm/models/internal_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/colors_model.dart';
import '../services/api_service.dart';

class InternalSensor extends StatefulWidget {
  const InternalSensor({
    super.key,
    required this.userId,
    required this.userSite,
  });

  final String userId;
  final String userSite;

  @override
  State<InternalSensor> createState() => _InternalSensorState();
}

class _InternalSensorState extends State<InternalSensor> {
  late SharedPreferences prefs;

  Future<List<InternalModel>> _getData() async {
    prefs = await SharedPreferences.getInstance();

    final List<InternalModel> internals = await ApiService.getInternals(
      widget.userId,
      widget.userSite,
    );

    if (prefs.getBool('isChecked1') == true) {
      double high = double.parse(prefs.get('dropdownValueHigh').toString());
      double low = double.parse(prefs.get('dropdownValueLow').toString());
      double now = internals.first.temperature;

      if (now >= high) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("고온 경보"),
              content: const Text("내부 온도가 설정한 고온 경보 온도보다 높습니다. 🥵"),
              actions: [
                TextButton(
                  child: const Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
      if (now < low) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("저온 경보"),
              content: const Text("내부 온도가 설정한 저온 경보 온도보다 낮습니다. 🥶"),
              actions: [
                TextButton(
                  child: const Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    }
    return internals;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getData(),
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
                                    'CO2',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: ColorsModel.third,
                                    ),
                                  ),
                                  Text(
                                    '${internalSnapshot.data![0].soilCo2} ppm',
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: ColorsModel.third,
                                    ),
                                  ),
                                ],
                              ),
                              const Icon(
                                Icons.co2_outlined,
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
                                    '${internalSnapshot.data![0].soilHumidity} %',
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
