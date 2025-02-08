import '../../domain/domain.dart';
import '../data.dart';

class MotelRepositoryImpl implements MotelRepository {
  final MotelRemoteDataSource remoteDataSource;

  MotelRepositoryImpl({required this.remoteDataSource});

  @override
  Future<DataMotelEntity?> getAllMotel() async {
    return await remoteDataSource.getMotels();
  }
}
