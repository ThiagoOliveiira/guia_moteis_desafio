import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:guia_moteis/domain/domain.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetAllMotel getAllMotel;
  HomeCubit({required this.getAllMotel}) : super(const HomeState.initial());

  List<SuiteEntity?>? get discountedSuites => getSuitesDiscount(state.dataMotelEntity?.moteis?.first);

  Future<void> init() async {
    emit(state.copyWith(status: HomeStatus.loading));

    var data = await getAllMotel.call();

    emit(state.copyWith(status: HomeStatus.success, dataMotelEntity: data));
  }

  List<SuiteEntity?>? getSuitesDiscount(MotelEntity? motel) => motel?.suites?.getSuiteByDiscount();
}
