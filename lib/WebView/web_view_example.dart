import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewExample extends StatefulWidget {
  const WebViewExample({super.key});

  @override
  State<WebViewExample> createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  late WebViewController controller;

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() {
    String link = "https://vegamovies.boo/";

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.disabled)
      ..loadRequest(Uri.parse(link));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Web View Example"),
        actions: [
          InkResponse(
            onTap: () {
              controller.goBack();
            },
            child: const Icon(Icons.arrow_back_ios_new),
          ),
          const SizedBox(width: 15),
          InkResponse(
            onTap: () {
              controller.reload();
            },
            child: const Icon(Icons.replay),
          ),
          const SizedBox(width: 15),
          InkResponse(
            onTap: () {
              controller.goForward();
            },
            child: const Icon(Icons.arrow_forward_ios),
          ),
          const SizedBox(width: 15),
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: () {},
                child: const Text('Clear cookies'),
              ),
              PopupMenuItem(
                onTap: () {},
                child: const Text('Clear cookies'),
              ),
              PopupMenuItem(
                onTap: () {},
                child: const Text('Clear cookies'),
              ),
            ],
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
