import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class InstantView extends StatefulWidget {
  const InstantView({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  State<InstantView> createState() => _InstantViewState();
}

class _InstantViewState extends State<InstantView> {
  InAppWebViewController? _webViewController;
  final InAppWebViewGroupOptions _options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      useShouldOverrideUrlLoading: true,
      mediaPlaybackRequiresUserGesture: false,
    ),
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
    ),
    ios: IOSInAppWebViewOptions(
      allowsInlineMediaPlayback: true,
    ),
  );

  String _url = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_url),
        actions: [
          IconButton(
            onPressed: () {
              Share.share(_url);
            },
            icon: Icon(Icons.share),
          )
        ],
      ),
      body: SafeArea(
        child: InAppWebView(
          key: UniqueKey(),
          initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
          onWebViewCreated: (controller) {
            _webViewController = controller;
          },
          onLoadStart: (controller, url) {
            setState(() {
              _url = url.toString();
            });
          },
          onTitleChanged: (controller, title) {
            setState(() {
              _url = title ?? "";
            });
          },
          shouldOverrideUrlLoading: (controller, navigationAction) async {
            var uri = navigationAction.request.url!;
            if (await canLaunchUrl(uri.toString() as Uri)) {
              await launchUrl(uri.toString() as Uri);
              return NavigationActionPolicy.CANCEL;
            }
            return NavigationActionPolicy.ALLOW;
          },
        ),
      ),
    );
  }
}
