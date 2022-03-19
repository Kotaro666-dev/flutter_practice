import 'dart:async';

import 'package:flutter/material.dart';
import 'package:handle_offline_with_rxdart/my_http_client.dart';

final negativeButtonStyle = ElevatedButton.styleFrom(primary: Colors.redAccent);

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final httpClient = MyHttpClient();
  bool? isOffline;
  var isListening = false;
  var isHttpRequesting = false;
  var httpRequestCount = 0;
  Timer? _timer;

  void startListening() {
    setState(() {
      isListening = true;
    });
    httpClient.connectionState.listen((connectionState) {
      if (connectionState == MyConnectionState.offline) {
        setState(() {
          isOffline = true;
        });
      } else if (connectionState == MyConnectionState.online) {
        setState(() {
          isOffline = false;
        });
      }
    });
  }

  void stopListening() {
    httpClient.stopListening();
    setState(() {
      isListening = false;
      isOffline = null;
    });
  }

  void startHttpRequest() {
    setState(() {
      isHttpRequesting = true;
    });
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      httpClient.httpRequest();
      setState(() {
        httpRequestCount++;
      });
    });
  }

  void stopHttpRequest() {
    _timer?.cancel();
    setState(() {
      isHttpRequesting = false;
      httpRequestCount = 0;
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Handle offline with rxdart"),
      ),
      body: Stack(children: [
        if (isOffline != null)
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: double.infinity,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: isOffline! ? Colors.red : Colors.green,
                ),
                child: isOffline!
                    ? const Text(
                        "オフライン",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      )
                    : const Text(
                        "オンライン",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
              ),
            ),
          ),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    startListening();
                  },
                  child: const Text("購読開始")),
              ElevatedButton(
                onPressed: () {
                  stopListening();
                },
                child: const Text("購読終了"),
                style: negativeButtonStyle,
              ),
              ElevatedButton(
                  onPressed: () {
                    startHttpRequest();
                  },
                  child: const Text("HTTPリクエスト開始")),
              ElevatedButton(
                onPressed: () {
                  stopHttpRequest();
                },
                child: const Text("HTTPリクエスト終了"),
                style: negativeButtonStyle,
              ),
              Text("購読状態： $isListening"),
              Text("HTTPリクエスト状態： $isHttpRequesting"),
              Text("HTTPリクエスト回数： $httpRequestCount")
            ],
          ),
        ),
      ]),
    );
  }
}
