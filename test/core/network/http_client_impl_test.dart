// http_client_impl_test.dart
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis/core/core.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';

class MockClient extends Mock implements Client {}

void main() {
  late MockClient client;
  late HttpClientImpl sut;
  late String url;

  Matcher httpErrorType(HttpError httpError) => predicate((e) => e is CustomHttpException && e.httpError == httpError);

  setUp(() {
    client = MockClient();
    sut = HttpClientImpl(client: client);
  });

  setUpAll(() {
    url = faker.internet.httpsUrl();
    registerFallbackValue(Uri.parse(url));
  });

  group('GET', () {
    test('Should call post with correct values none and without body', () async {
      when(() => client.get(Uri.parse(url), headers: any(named: 'headers'))).thenAnswer((_) async => Response('', 200));

      await sut.request(url: url, method: 'get');
      verify(() => client.get(Uri.parse(url), headers: {"content-type": "application/json"}));

      await sut.request(url: url, method: 'get', headers: {'any_header': 'any_value'});
      verify(() => client.get(Uri.parse(url), headers: {'content-type': 'application/json', 'any_header': 'any_value'}));
    });

    test('Should return null if get returns 200 with no data', () async {
      when(() => client.get(Uri.parse(url), headers: any(named: 'headers'))).thenAnswer((_) async => Response('', 200));

      final response = await sut.request(url: url, method: 'get');
      expect(response, null);
    });
  });

  test('Should return null if get returns 204', () async {
    when(() => client.get(Uri.parse(url), headers: any(named: 'headers'))).thenAnswer((_) async => Response('', 204));

    final response = await sut.request(url: url, method: 'get');
    expect(response, null);
  });

  test('Should return BadRequestError if get returns 400', () async {
    when(() => client.get(Uri.parse(url), headers: any(named: 'headers'))).thenAnswer((_) async => Response('', 400));

    final future = sut.request(url: url, method: 'get');

    expect(future, throwsA(httpErrorType(HttpError.badRequest)));
  });

  test('Should throw CustomHttpException with HttpError.notFound for 404 status', () async {
    when(() => client.get(Uri.parse(url), headers: any(named: 'headers'))).thenAnswer((_) async => Response('', 404));

    expect(() async => await sut.request(url: url, method: 'get'), throwsA(httpErrorType(HttpError.notFound)));
  });

  test('Should return ServerError if get returns 500', () async {
    when(() => client.get(Uri.parse(url), headers: any(named: 'headers'))).thenAnswer((_) async => Response('', 505));

    final future = sut.request(url: url, method: 'get');

    expect(future, throwsA(httpErrorType(HttpError.serverError)));
  });
}
