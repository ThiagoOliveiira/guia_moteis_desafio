// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_cubit.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeState extends Equatable {
  final HomeStatus? status;
  final DataMotelEntity? dataMotelEntity;

  const HomeState({this.status, this.dataMotelEntity});

  const HomeState.initial()
      : status = HomeStatus.initial,
        dataMotelEntity = null;

  @override
  List get props => [status, dataMotelEntity];

  HomeState copyWith({
    HomeStatus? status,
    DataMotelEntity? dataMotelEntity,
  }) {
    return HomeState(
      status: status ?? this.status,
      dataMotelEntity: dataMotelEntity ?? this.dataMotelEntity,
    );
  }
}
