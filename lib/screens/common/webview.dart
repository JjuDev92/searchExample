import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:developer';

class Webview extends StatefulWidget {
  static String routeName = "/Webview";
  const Webview({Key? key}) : super(key: key);
  @override
  _WebviewState createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  bool showProgress = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _args = ModalRoute.of(context)!.settings.arguments as WebViewArgs;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Webview'),
        iconTheme: const IconThemeData(color: Colors.cyan),
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
          child: Stack(children: [
        WebView(
          initialUrl: _args.imageUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onProgress: (progress) {
            log('progress: $progress');
          },
          onPageFinished: (value) {
            showProgress = false;
            setState(() {});
          },
        ),
        Visibility(
          visible: showProgress,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ])),
    );
  }
}

class WebViewArgs {
  final String imageUrl;

  WebViewArgs({
    required this.imageUrl,
  });
}
