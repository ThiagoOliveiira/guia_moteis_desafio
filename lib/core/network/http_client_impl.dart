// Exemplo de utilização no HttpAdapter (adaptado)
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

import '../core.dart';

class HttpClientImpl implements HttpClientInterface {
  final Client client;

  const HttpClientImpl({required this.client});

  @override
  Future<dynamic> request({
    required String url,
    required String method,
    Map? body,
    Map? headers,
    Map<String, dynamic>? queryParameters,
    bool hasToPrint = false,
  }) async {
    final defaultHeaders = <String, String>{'content-type': 'application/json'};
    if (headers != null) {
      defaultHeaders.addAll(headers.cast<String, String>());
    }

    final jsonBody = body != null ? jsonEncode(body) : null;
    Response response = Response('', 500);
    Uri finalUrl;
    Future<Response>? futureResponse;

    if (queryParameters == null) {
      finalUrl = Uri.parse(url);
    } else {
      final partialUrl = Uri.parse(url);
      finalUrl = Uri(
        scheme: partialUrl.scheme,
        host: partialUrl.host,
        path: partialUrl.path,
        queryParameters: queryParameters,
      );
    }

    if (hasToPrint) {
      log("METHOD: $method");
      log("URL: $finalUrl");
      log("HEADERS: $defaultHeaders");
      log("BODY: $body");
    }

    try {
      if (method.toLowerCase() == 'post') {
        futureResponse = client.post(finalUrl, headers: defaultHeaders, body: jsonBody);
      } else if (method.toLowerCase() == 'get') {
        futureResponse = client.get(finalUrl, headers: defaultHeaders);
      } else if (method.toLowerCase() == 'put') {
        futureResponse = client.put(finalUrl, headers: defaultHeaders, body: jsonBody);
      } else if (method.toLowerCase() == 'delete') {
        futureResponse = client.delete(finalUrl, headers: defaultHeaders, body: jsonBody);
      }
      if (futureResponse != null) {
        response = await futureResponse.timeout(const Duration(seconds: 45));
      }

      if (hasToPrint) {
        log("RESPONSE STATUS CODE: ${response.statusCode}");
        log("RESPONSE: ${response.body}");
      }
    } catch (error) {
      throw CustomHttpException(
        httpError: HttpError.serverError,
        message: error.toString(),
        urlRequest: url,
      );
    }

    return _handleResponse(response, url);
  }

  dynamic _handleResponse(Response response, String urlRequest) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.body.isEmpty ? null : jsonDecode(response.body);
      case 204:
        return null;
      case 400:
        throw CustomHttpException(
          httpError: HttpError.badRequest,
          message: response.body,
          urlRequest: urlRequest,
        );
      case 401:
        throw CustomHttpException(
          httpError: HttpError.unauthorized,
          message: response.body,
          urlRequest: urlRequest,
        );
      case 403:
        throw CustomHttpException(
          httpError: HttpError.forbidden,
          message: response.body,
          urlRequest: urlRequest,
        );
      case 404:
        throw CustomHttpException(
          httpError: HttpError.notFound,
          message: response.body,
          urlRequest: urlRequest,
        );
      case 422:
        throw CustomHttpException(
          httpError: HttpError.unprocessableEntity,
          message: response.body,
          urlRequest: urlRequest,
        );
      default:
        throw CustomHttpException(
          httpError: HttpError.serverError,
          message: response.body,
          urlRequest: urlRequest,
        );
    }
  }
}
