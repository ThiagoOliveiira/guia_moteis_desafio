import '../domain.dart';

class GetAllMotel {
  final MotelRepository repository;

  GetAllMotel(this.repository);

  Future<DataMotelEntity?> call() async {
    return await repository.getAllMotel();
  }
}
