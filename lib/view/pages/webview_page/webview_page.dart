import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:kitapp/view/shared/widgets/custom_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({
    Key? key,
    required this.url,
    this.heading = '',
    this.fontColor,
    this.hideAppBar = false,
  }) : super(key: key);
  final String url;
  final String heading;
  final Color? fontColor;
  final bool hideAppBar;

  @override
  WebViewPageState createState() => WebViewPageState();
}

class WebViewPageState extends State<WebViewPage> {
  Timer? timer;
  @override
  void initState() {
    super.initState();
    // show error message if page doesn't load in 15 seconds
    timer = Timer.periodic(const Duration(seconds: 15), (t) {
      if (isLoading) {
        setState(() {
          canLoad = false;
          timer!.cancel();
        });
      }
    });
  }

  @override
  void deactivate() {
    timer?.cancel();
    super.deactivate();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  bool canLoad = true;
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.hideAppBar
          ? null
          : CustomAppBar(
              title: widget.heading,
            ),
      body: SafeArea(
        child: Stack(
          children: [
            canLoad ? _buildWebView() : const SizedBox.shrink(),
            isLoading && canLoad
                ? const Center(
                    child: SpinKitFadingCircle(color: Colors.grey, size: 40))
                : isLoading
                    ? const Center(
                        child: Text(
                          ' There was a problem loading the page. Please try again.',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Widget _buildWebView() {
    return WebView(
      initialUrl: widget.url,
      javascriptMode: JavascriptMode.unrestricted,
      onPageFinished: (finish) {
        if (!mounted) return;
        setState(() {
          isLoading = false;
        });
      },
    );
  }
}
