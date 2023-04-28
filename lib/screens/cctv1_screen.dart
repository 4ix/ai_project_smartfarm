import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../models/colors_model.dart';

class CctvOne extends StatefulWidget {
  const CctvOne({super.key});

  @override
  State<CctvOne> createState() => _CctvOneState();
}

class _CctvOneState extends State<CctvOne> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        _controller.play();
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: ColorsModel.second),
      child: Column(
        children: [
          const Padding(
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
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: GestureDetector(
                        onTap: () {
                          if (_controller.value.isPlaying) {
                            _controller.pause();
                          } else {
                            _controller.play();
                          }
                        },
                        child: VideoPlayer(_controller),
                      ),
                    )
                  : Container(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
