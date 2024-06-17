import 'package:cpims_dcs_mobile/core/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class RequestAccessScreen extends StatefulWidget {
  const RequestAccessScreen({super.key});

  @override
  State<RequestAccessScreen> createState() => _RequestAccessScreenState();
}

class _RequestAccessScreenState extends State<RequestAccessScreen> {
  WebViewController? webViewController;

  @override
  void initState() {
    webViewController = WebViewController();
    loadWebView();
    super.initState();
  }

  void loadWebView() {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(registerUrl));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(
        controller: webViewController!,
      ),
    );
  }
}
