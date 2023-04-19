import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'wot.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:share/share.dart';

class BusquedaView extends StatefulWidget {
  const BusquedaView({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  State<BusquedaView> createState() => _BusquedaViewState();
}

class _BusquedaViewState extends State<BusquedaView> {
  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }

  late InAppWebViewController _webViewController;
  late String _currentUrl;

  final adUrlFilters =
      ".*.doubleclick.net/.*, .*ads.pubmatic.com/.*, .*googlesyndication.com/.*, .*google-analytics.com/.*, .*adservice.google.*/.*, .*adbrite.com/.*, .*exponential.com/.*, .*quantserve.com/.*, .*scorecardresearch.com/.*, .*zedo.com/.*, .*adsafeprotected.com/.*, .*teads.tv/.*, .*outbrain.com/.*";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 30, 30, 30),
        title: Center(
          child: GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const WotScreen(),
                ),
              );
            },
            child: Image.asset(
              "assets/images/icono_ints_central.png",
              height: 22,
            ),
          ),
        ),
        elevation: 0,
      ),
      body: Stack(
        children: [
          InAppWebView(
            initialUrlRequest: URLRequest(url: Uri.parse(widget.url)),
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                  preferredContentMode: UserPreferredContentMode.MOBILE,
                  javaScriptEnabled: true,
                  contentBlockers: [
                    ContentBlocker(
                        trigger: ContentBlockerTrigger(
                          urlFilter: adUrlFilters,
                        ),
                        action: ContentBlockerAction(
                            type: ContentBlockerActionType.CSS_DISPLAY_NONE,
                            selector:
                                '.notification, .media, #developer-story'))
                  ]),
            ),
            onWebViewCreated: (controller) {
              _webViewController = controller;
            },
            onLoadStart: (controller, url) {
              setState(() {});
            },
            onLoadStop: (controller, url) {
              setState(() {
                _currentUrl = url.toString();
              });
            },
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        color: const Color.fromARGB(255, 30, 30, 30),
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back_rounded,
                  color: Color(0XFFF8F8F8)),
              onPressed: () {
                _webViewController.goBack();
              },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_rounded,
                  color: Color(0XFFF8F8F8)),
              onPressed: () {
                _webViewController.goForward();
              },
            ),
            IconButton(
              icon: const Icon(Icons.change_circle_rounded,
                  color: Color(0XFFF8F8F8)),
              onPressed: () {
                _webViewController.reload();
              },
            ),
            IconButton(
              icon: const Icon(Icons.pending_rounded, color: Color(0XFFF8F8F8)),
              onPressed: () async {
                await Share.share(_currentUrl);
              },
            ),
          ],
        ),
      ),
    );
  }
}
