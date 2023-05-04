import 'package:flutter/material.dart';
import 'package:smartfarm/models/colors_model.dart';
import 'package:smartfarm/widgets/graph_screen.dart';
import '../widgets/external_sensor_screen.dart';
import '../widgets/internal_sensor_screen.dart';

class SensorScreen extends StatefulWidget {
  const SensorScreen({
    super.key,
    required this.userId,
    required this.userSite,
  });

  final String userId;
  final String userSite;

  @override
  State<SensorScreen> createState() => _SensorScreenState();
}

class _SensorScreenState extends State<SensorScreen> {
  bool _expanded1 = true;
  bool _expanded2 = false;
  bool _expanded3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsModel.first,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: ExpansionPanelList(
            children: [
              ExpansionPanel(
                backgroundColor: ColorsModel.second,
                headerBuilder: (context, isExpanded) {
                  return const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '외부환경',
                      style: TextStyle(
                        color: ColorsModel.fourth,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
                body: ExternalSensor(
                  userId: widget.userId,
                  userSite: widget.userSite,
                ),
                isExpanded: _expanded1,
              ),
              ExpansionPanel(
                backgroundColor: ColorsModel.second,
                headerBuilder: (context, isExpanded) {
                  return const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '내부환경',
                      style: TextStyle(
                        color: ColorsModel.fourth,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
                body: InternalSensor(
                  userId: widget.userId,
                  userSite: widget.userSite,
                ),
                isExpanded: _expanded2,
              ),
              ExpansionPanel(
                backgroundColor: ColorsModel.second,
                headerBuilder: (context, isExpanded) {
                  return const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      '그래프',
                      style: TextStyle(
                        color: ColorsModel.fourth,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                },
                body: GraphScreen(
                  userId: widget.userId,
                  userSite: widget.userSite,
                ),
                isExpanded: _expanded3,
              ),
            ],
            expansionCallback: (panelIndex, isExpanded) {
              if (panelIndex == 0) {
                setState(() {
                  _expanded1 = !_expanded1;
                });
              }
              if (panelIndex == 1) {
                setState(() {
                  _expanded2 = !_expanded2;
                });
              }
              if (panelIndex == 2) {
                setState(() {
                  _expanded3 = !_expanded3;
                });
              }
            },
          ),
        ),
      ),
    );
  }
}
