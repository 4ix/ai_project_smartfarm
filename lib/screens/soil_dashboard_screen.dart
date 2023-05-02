import 'package:flutter/material.dart';
import 'package:smartfarm/models/colors_model.dart';

import '../models/external_model.dart';
import '../models/internal_model.dart';
import '../services/api_service.dart';

class SoilDashboard extends StatefulWidget {
  const SoilDashboard({
    super.key,
    required this.userId,
    required this.userSite,
  });

  final String userId;
  final String userSite;

  @override
  State<SoilDashboard> createState() => _SoilDashboardState();
}

class _SoilDashboardState extends State<SoilDashboard> {
  Future<List<dynamic>> _getData() async {
    final Future<List<InternalModel>> internals = ApiService.getInternals(
      widget.userId,
      widget.userSite,
    );
    final Future<List<ExternalModel>> externals = ApiService.getExternals(
      widget.userId,
      widget.userSite,
    );

    return Future.wait([internals, externals]);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SoilDashboardWidget(
            dataSnapshot: snapshot,
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class SoilDashboardWidget extends StatelessWidget {
  const SoilDashboardWidget({
    super.key,
    required this.dataSnapshot,
  });

  final AsyncSnapshot<List<dynamic>> dataSnapshot;

  @override
  Widget build(BuildContext context) {
    final List<InternalModel> internals = dataSnapshot.data![0];
    final List<ExternalModel> externals = dataSnapshot.data![1];

    IconData iconData;
    switch (externals[0].weather) {
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
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Icon(
                          iconData,
                          size: 30,
                          color: ColorsModel.third,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            '${externals[0].weather} / ${externals[0].temperature} ℃',
                            style: const TextStyle(
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
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.device_thermostat_outlined,
                              size: 30,
                              color: ColorsModel.third,
                            ),
                            const Text(
                              '내부 온도',
                              style: TextStyle(
                                fontSize: 15,
                                color: ColorsModel.third,
                              ),
                            ),
                            Text(
                              '${internals[0].temperature} ℃',
                              style: const TextStyle(
                                fontSize: 15,
                                color: ColorsModel.third,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.water_drop_outlined,
                              size: 30,
                              color: ColorsModel.third,
                            ),
                            const Text(
                              '내부 습도',
                              style: TextStyle(
                                fontSize: 15,
                                color: ColorsModel.third,
                              ),
                            ),
                            Text(
                              '${internals[0].humidity} %',
                              style: const TextStyle(
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
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.co2_outlined,
                              size: 30,
                              color: ColorsModel.third,
                            ),
                            const Text(
                              'CO2',
                              style: TextStyle(
                                fontSize: 15,
                                color: ColorsModel.third,
                              ),
                            ),
                            Text(
                              '${internals[0].soilCo2} ppm',
                              style: const TextStyle(
                                fontSize: 15,
                                color: ColorsModel.third,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.water_drop_outlined,
                              size: 30,
                              color: ColorsModel.third,
                            ),
                            const Text(
                              '토양 습도',
                              style: TextStyle(
                                fontSize: 15,
                                color: ColorsModel.third,
                              ),
                            ),
                            Text(
                              '${internals[0].soilHumidity} %',
                              style: const TextStyle(
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
