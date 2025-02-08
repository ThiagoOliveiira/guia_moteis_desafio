import '../domain.dart';

abstract class MotelRepository {
  Future<DataMotelEntity?> getAllMotel();
}
