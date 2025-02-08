import 'package:guia_moteis/core/core.dart';
import 'package:mocktail/mocktail.dart';

class HttpClientSpy extends Mock implements HttpClientInterface {
  When mockRequestCall({String? url}) => when(() => request(
        url: url ?? any(named: 'url'),
        method: any(named: 'method'),
        body: any(named: 'body'),
        headers: any(named: 'headers'),
        queryParameters: any(named: 'queryParameters'),
      ));

  void mockRequest(dynamic data, {String? url}) => mockRequestCall(url: url).thenAnswer((_) async => data);
  void mockRequestError(CustomHttpException error) => mockRequestCall().thenThrow(error);
}
