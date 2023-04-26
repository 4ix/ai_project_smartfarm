import 'package:flutter/material.dart';

class CctvOne extends StatelessWidget {
  const CctvOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color(0XFFAEC2B6)),
      child: const Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'CCTV #1',
                  style: TextStyle(fontSize: 20, color: Color(0XFFDBE4C6)),
                ),
                Icon(
                  Icons.home_max_outlined,
                  color: Color(0XFFDBE4C6),
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
