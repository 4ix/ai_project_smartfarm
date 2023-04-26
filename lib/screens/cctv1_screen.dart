import 'package:flutter/material.dart';

import '../models/colors_model.dart';

class CctvOne extends StatelessWidget {
  const CctvOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: ColorsModel.second),
      child: const Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'CCTV #1',
                  style: TextStyle(fontSize: 20, color: ColorsModel.fourth),
                ),
                Icon(
                  Icons.home_max_outlined,
                  color: ColorsModel.fourth,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage('assets/cctv.png'),
            ),
          ),
        ],
      ),
    );
  }
}
