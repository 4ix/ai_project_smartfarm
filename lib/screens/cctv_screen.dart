import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CctvScreen extends StatefulWidget {
  const CctvScreen({
    super.key,
    required this.userId,
    required this.userSite,
  });

  final String userId;
  final String userSite;

  @override
  State<CctvScreen> createState() => _CctvScreenState();
}

class _CctvScreenState extends State<CctvScreen> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();

    late final PlatformWebViewControllerCreationParams params;
    params = const PlatformWebViewControllerCreationParams();

    final WebViewController controller =
        WebViewController.fromPlatformCreationParams(params);

    controller
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(
          'http://172.16.10.57:5000/FARM/${widget.userId}/${widget.userSite}/cctv'));

    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: _controller);
  }
}
