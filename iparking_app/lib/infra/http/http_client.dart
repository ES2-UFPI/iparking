import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import 'error_http.dart';

import 'package:http/http.dart' as http;

class HttpAdapter {
  final Client client = http.Client();

  Future<dynamic> request(
      {required String url,
      required String method,
      Map? body,
      Map? headers}) async {
    final defaultHeaders = {
      'content-type': 'application/json',
      'accept': 'application/json'
    };
    final jsonBody = body != null ? jsonEncode(body) : null;
    var response = Response('', 500);
    Future<Response>? futureResponse;
    print(url);
    if (method == 'post') {
      futureResponse =
          client.post(Uri.parse(url), headers: defaultHeaders, body: jsonBody);
    } else if (method == 'get') {
      print("asdwdawda");
      futureResponse = client.get(Uri.parse(url), headers: defaultHeaders);
    } else if (method == 'put') {
      futureResponse =
          client.put(Uri.parse(url), headers: defaultHeaders, body: jsonBody);
    } else if (method == 'delete') {
      futureResponse = client.delete(Uri.parse(url), headers: defaultHeaders);
    }
    if (futureResponse != null) {
      response = await futureResponse.timeout(const Duration(seconds: 10));
    }

    return _handleResponse(response);
  }

  dynamic _handleResponse(Response response) {
    if (kDebugMode) {
      print(response.statusCode);
      print(response.body);
    }

    switch (response.statusCode) {
      case 200:
        return response.body.isEmpty ? null : jsonDecode(response.body);
      case 204:
        return null;
      case 400:
        throw HttpError.badRequest;
      case 401:
        throw HttpError.unauthorized;
      case 403:
        throw HttpError.forbidden;
      case 404:
        throw HttpError.notFound;
      case 422:
        throw HttpError.unprocessableEntity;
      default:
        throw HttpError.serverError;
    }
  }
}
