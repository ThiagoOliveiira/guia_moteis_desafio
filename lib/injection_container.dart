import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import 'core/core.dart';
import 'data/data.dart';
import 'domain/domain.dart';
import 'presentation/presentation.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // **Dependências Externas**
  // Registra a instância do Client.
  sl.registerLazySingleton(() => Client());

  // Core Layer
  sl.registerLazySingleton<HttpClientInterface>(() => HttpClientImpl(client: sl<Client>()));

  // Data Layer
  sl.registerLazySingleton<MotelRemoteDataSource>(() => MotelRemoteDatasourceImpl(httpClient: sl<HttpClientInterface>()));
  sl.registerLazySingleton<MotelRepository>(() => MotelRepositoryImpl(remoteDataSource: sl<MotelRemoteDataSource>()));

  // Domain Layer
  sl.registerLazySingleton(() => GetAllMotel(sl<MotelRepository>()));

  // Presentation Layer
  sl.registerFactory(() => HomeCubit(getAllMotel: sl<GetAllMotel>()));
}
