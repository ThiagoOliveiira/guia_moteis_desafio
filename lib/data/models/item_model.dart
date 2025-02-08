import '../../domain/domain.dart';

class ItemModel {
  final String? nome;

  const ItemModel({this.nome});

  factory ItemModel.fromJson(Map json) => ItemModel(nome: json['nome']);

  ItemEntity toEntity() => ItemEntity(nome: nome);
}
