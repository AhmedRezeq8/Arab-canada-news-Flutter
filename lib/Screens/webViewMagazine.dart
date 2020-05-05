import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MagazineWebView extends StatefulWidget {
  MagazineWebView({Key key}) : super(key: key);

  @override
  _MagazineWebViewState createState() => _MagazineWebViewState();
}

class _MagazineWebViewState extends State<MagazineWebView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (BuildContext context) {
        return SafeArea(
          child: WebView(
            initialUrl: 'https://arabcanadanews.ca/magazine/index.html',
            javascriptMode: JavascriptMode.unrestricted,
            // onWebViewCreated: (WebViewController webViewController) {
            //   _controller.complete(webViewController);
            // },
            // // TODO(iskakaushik): Remove this when collection literals makes it to stable.
            // // ignore: prefer_collection_literals
            // javascriptChannels: <JavascriptChannel>[
            //   _toasterJavascriptChannel(context),
            // ].toSet(),
            // navigationDelegate: (NavigationRequest request) {
            //   if (request.url.startsWith('https://www.youtube.com/')) {
            //     print('blocking navigation to $request}');
            //     return NavigationDecision.prevent;
            //   }
            //   print('allowing navigation to $request');
            //   return NavigationDecision.navigate;
            // },
            // onPageStarted: (String url) {
            //   print('Page started loading: $url');
            // },
            // onPageFinished: (String url) {
            //   print('Page finished loading: $url');
            // },
            gestureNavigationEnabled: true,
          ),
        );
      }),
      // floatingActionButton: favoriteButton(),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

  Widget favoriteButton() {
    return FutureBuilder<WebViewController>(
        future: _controller.future,
        builder: (BuildContext context,
            AsyncSnapshot<WebViewController> controller) {
          if (controller.hasData) {
            return FloatingActionButton(
              onPressed: () async {
                final String url = await controller.data.currentUrl();
                Scaffold.of(context).showSnackBar(
                  SnackBar(content: Text('Favorited $url')),
                );
              },
              child: const Icon(Icons.favorite),
            );
          }
          return Container();
        });
  }
}
