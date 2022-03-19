import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';

enum MyConnectionState { online, offline }

class MyHttpClient extends http.BaseClient {
  final _client = http.Client();

  final BehaviorSubject<MyConnectionState> _connectionState =
      BehaviorSubject<MyConnectionState>();

  Stream<MyConnectionState> get connectionState => _connectionState;

  final uri = Uri.parse("https://jsonplaceholder.typicode.com/todos/1");

  void stopListening() {
    _connectionState.close();
  }

  Future<void> httpRequest() async {
    final response = await get(uri);
  }

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    try {
      final response = await _client.send(request);
      _connectionState.add(MyConnectionState.online);
      return response;
    } on SocketException catch (e) {
      debugPrint("Socket exception: ${e.toString()}");
      _connectionState.add(MyConnectionState.offline);
    }
    throw UnimplementedError();
  }
}
