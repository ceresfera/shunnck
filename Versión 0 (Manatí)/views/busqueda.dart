
import 'package:flutter/material.dart';
import 'package:ints_play/screens/wot.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:share/share.dart';

class BusquedaView extends StatefulWidget {
  const BusquedaView({Key? key, required this.url}) : super(key: key);

  final String url;

  @override
  State<BusquedaView> createState() => _BusquedaViewState();
}

class _BusquedaViewState extends State<BusquedaView> {
  late final WebViewController controller;
  var loadingPercentage = 0;
  var currentUrl = '';

  getCurrentUrl() async {
    var currentUrl = await controller.currentUrl();
    debugPrint("Current URL: $currentUrl");
  }

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          setState(() {
            loadingPercentage = 0;
            currentUrl = url;
          });
          debugPrint('url: $url');
        },
        onProgress: (progress) {
          setState(() {
            loadingPercentage = progress;
          });
        },
        onPageFinished: (url) {
          setState(() {
            loadingPercentage = 100;
          });
        },
      ));
    controller.loadRequest(
      Uri.parse(widget.url),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 30, 30, 30),
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
      body: WebViewWidget(
        controller: controller,
        layoutDirection: TextDirection.ltr,
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
                controller.goBack();
              },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_rounded,
                  color: Color(0XFFF8F8F8)),
              onPressed: () {
                controller.goForward();
              },
            ),
            IconButton(
              icon: const Icon(Icons.change_circle_rounded,
                  color: Color(0XFFF8F8F8)),
              onPressed: () {
                controller.reload();
              },
            ),
            IconButton(
              icon: const Icon(Icons.pending_rounded, color: Color(0XFFF8F8F8)),
              onPressed: () async {
                final url = await controller.currentUrl();
                Share.share(url!);
              },
            ),
          ],
        ),
      ),
    );
  }
}
