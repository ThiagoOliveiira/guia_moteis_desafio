import 'package:equatable/equatable.dart';

class ItemEntity extends Equatable {
  final String? nome;

  const ItemEntity({this.nome});

  @override
  List get props => [nome];
}
