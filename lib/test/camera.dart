import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MyVideoPlayer extends StatefulWidget {
  const MyVideoPlayer({super.key});

  @override
  _MyVideoPlayerState createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // 영상 URL을 설정합니다.
    _controller = VideoPlayerController.network('http://192.168.172.254/');
    // 영상 로드가 완료될 때까지 대기합니다.
    _controller.addListener(() {
      if (_controller.value.isInitialized) {
        setState(() {});
      }
    });
    _controller.initialize();
    _controller.setLooping(true); // 영상 반복 재생
    _controller.play(); // 영상 재생 시작
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: VideoPlayer(_controller),
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
