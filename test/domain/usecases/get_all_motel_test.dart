import 'package:flutter_test/flutter_test.dart';
import 'package:guia_moteis/domain/domain.dart';
import 'package:mocktail/mocktail.dart';

import '../../core/mocks/api_factory.dart';
import '../../core/mocks/http_client_spy.dart';

/// Cria um mock para o repositório de hotéis.
class MockHotelRepository extends Mock implements MotelRepository {}

void main() {
  late GetAllMotel usecase;
  late MockHotelRepository mockHotelRepository;
  late Map dataMotel;
  late HttpClientSpy httpClient;
  late DataMotelEntity motel;

  setUp(() {
    dataMotel = ApiFactory.makeResultAPIMotel();
    motel = const DataMotelEntity();

    httpClient = HttpClientSpy();
    mockHotelRepository = MockHotelRepository();
    usecase = GetAllMotel(mockHotelRepository);
    httpClient.mockRequest(dataMotel);
  });

  test('Should call DataMotelEntity with correct value', () async {
    when(() => mockHotelRepository.getAllMotel()).thenAnswer((_) async => motel);
    final result = await usecase();
    expect(result, equals(motel));
    verify(() => mockHotelRepository.getAllMotel()).called(1);
  });

  test('Deve lançar uma exceção se o repositório falhar', () async {
    when(() => mockHotelRepository.getAllMotel()).thenThrow(Exception("Erro ao obter hotéis"));

    expect(() => usecase(), throwsA(isA<Exception>()));
    verify(() => mockHotelRepository.getAllMotel()).called(1);
  });
}
