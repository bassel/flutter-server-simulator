import 'dart:convert';

import 'package:server_simulator/response.dart';

class API {
  /// The switch cases in the API act like the routes.php file;
  /// they route each path to the corresponding method.
  /// The private methods act like the methods inside the controller.

  Future<Response> processGet(String path, {Map<String, String> headers}) async {
    switch (path) {
      case 'user':
        return _getUser();
      default:
        return Response(code: '404', message: 'Page not found');
    }
  }

  Future<Response> processPost(String path,
      {Map<String, String> headers, body, Encoding encoding}) async {
    switch (path) {
      default:
        return Response(code: '404', message: 'Page not found');
    }
  }

  Future<Response> processPut(String path,
      {Map<String, String> headers, body, Encoding encoding}) async {
    switch (path) {
      default:
        return Response(code: '404', message: 'Page not found');
    }
  }

  Future<Response> processPatch(String path,
      {Map<String, String> headers, body, Encoding encoding}) async {
    switch (path) {
      default:
        return Response(code: '404', message: 'Page not found');
    }
  }

  Future<Response> processDelete(String path, {Map<String, String> headers}) async {
    switch (path) {
      default:
        return Response(code: '404', message: 'Page not found');
    }
  }

  Future<Response> _getUser() async {
    //create fake data
    return Response(
        code: '200',
        message: 'Success',
        body: {'firstName': 'John', 'lastName': 'Doe', 'email': 'john.doe@example.com'});
  }
}
