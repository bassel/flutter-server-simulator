import 'dart:convert';
import 'dart:math';

import 'package:server_simulator/api.dart';
import 'package:server_simulator/response.dart';

class FakeHttp {
  final int delayTime;
  // this will make the response fail on some occasions
  final bool willFail = Random().nextBool();
  // failing only on (true, true) will make success rate higher
  // we have 25% chance of failure, 50% chance of delay, 25% chance of perfect connection
  final bool confirmFailure = Random().nextBool();
  // to test the app without server failure, set this to false
  final bool shouldFail;

  FakeHttp({this.delayTime = 1, this.shouldFail = true});

  Future<Response> get(String url, {Map<String, String> headers}) async {
    await _delay();

    if (shouldFail && willFail && confirmFailure) {
      return Response(code: '408', message: 'Request Timeout');
    } else {
      return API().processGet(url.substring(url.lastIndexOf('/') + 1), headers: headers);
    }
  }

  Future<Response> post(String url, {Map<String, String> headers, body, Encoding encoding}) async {
    await _delay();
    if (shouldFail && willFail && confirmFailure) {
      return Response(code: '408', message: 'Request Timeout');
    } else {
      return API().processPost(url.substring(url.lastIndexOf('/') + 1),
          headers: headers, body: body, encoding: encoding);
    }
  }

  Future<Response> put(String url, {Map<String, String> headers, body, Encoding encoding}) async {
    await _delay();
    if (shouldFail && willFail && confirmFailure) {
      return Response(code: '408', message: 'Request Timeout');
    } else {
      return API().processPut(url.substring(url.lastIndexOf('/') + 1),
          headers: headers, body: body, encoding: encoding);
    }
  }

  Future<Response> patch(String url, {Map<String, String> headers, body, Encoding encoding}) async {
    await _delay();
    if (shouldFail && willFail && confirmFailure) {
      return Response(code: '408', message: 'Request Timeout');
    } else {
      return API().processPatch(url.substring(url.lastIndexOf('/') + 1),
          headers: headers, body: body, encoding: encoding);
    }
  }

  Future<Response> delete(String url, {Map<String, String> headers}) async {
    await _delay();
    if (shouldFail && willFail && confirmFailure) {
      return Response(code: '408', message: 'Request Timeout');
    } else {
      return API().processDelete(url.substring(url.lastIndexOf('/') + 1), headers: headers);
    }
  }

  Future<void> _delay() async {
    //typical network delay
    await Future.delayed(new Duration(seconds: delayTime));
    //additional delay
    if (willFail || confirmFailure) {
      await Future.delayed(new Duration(seconds: delayTime));
    }
    //extra additional delay before failure
    if (shouldFail && willFail && confirmFailure) {
      await Future.delayed(new Duration(seconds: delayTime));
    }
  }
}
