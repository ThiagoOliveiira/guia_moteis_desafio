abstract class HttpClientInterface {
  Future<dynamic> request({
    required String url,
    required String method,
    Map? body,
    Map? headers,
    Map<String, dynamic>? queryParameters,
    bool hasToPrint = false,
  });
}
