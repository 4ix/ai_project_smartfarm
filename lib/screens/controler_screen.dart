import 'package:flutter/material.dart';
import 'package:smartfarm/models/colors_model.dart';
import 'package:smartfarm/widgets/etc_controller_screen.dart';

import '../widgets/controller_dashboard_screen.dart';

class ControlerScreen extends StatefulWidget {
  const ControlerScreen({
    super.key,
    required this.userId,
    required this.userSite,
  });

  final String userId;
  final String userSite;

  @override
  State<ControlerScreen> createState() => _ControlerScreenState();
}

class _ControlerScreenState extends State<ControlerScreen> {
  bool _expanded1 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsModel.first,
      body: Column(
        children: [
          ControllerDashboard(
            userId: widget.userId,
            userSite: widget.userSite,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ExpansionPanelList(
              children: [
                ExpansionPanel(
                  backgroundColor: ColorsModel.second,
                  headerBuilder: (context, isExpanded) {
                    return const Padding(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '기타 제어',
                        style: TextStyle(
                          color: ColorsModel.fourth,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  },
                  body: const EtcControllerScreen(),
                  isExpanded: _expanded1,
                ),
              ],
              expansionCallback: (panelIndex, isExpanded) {
                if (panelIndex == 0) {
                  setState(() {
                    _expanded1 = !_expanded1;
                  });
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
