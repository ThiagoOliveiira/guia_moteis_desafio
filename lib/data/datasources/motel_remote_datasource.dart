import '../../core/core.dart';
import '../../domain/domain.dart';
import '../data.dart';

abstract class MotelRemoteDataSource {
  Future<DataMotelEntity?> getMotels();
}

class MotelRemoteDatasourceImpl implements MotelRemoteDataSource {
  final HttpClientInterface httpClient;

  MotelRemoteDatasourceImpl({required this.httpClient});

  @override
  Future<DataMotelEntity?> getMotels() async {
    final request = await httpClient.request(url: 'https://jsonkeeper.com/b/1IXK', method: 'get');

    final data = request["data"];

    return DataMotelModel.fromJson(data).toEntity();
  }
}
