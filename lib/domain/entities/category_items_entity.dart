import 'package:equatable/equatable.dart';

class CategoryItemsEntity extends Equatable {
  final String? nome;
  final String? icone;

  const CategoryItemsEntity({this.nome, this.icone});

  @override
  List get props => [nome, icone];
}
