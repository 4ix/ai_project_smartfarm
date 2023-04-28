import 'package:flutter/material.dart';
import 'package:flutter_mjpeg/flutter_mjpeg.dart';

class VideoStreamPage extends StatelessWidget {
  const VideoStreamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ESP32-CAM Video Stream'),
      ),
      body: const Center(
        child: Mjpeg(
          isLive: true,
          stream: 'http://192.168.172.254/stream',
        ),
      ),
    );
  }
}
