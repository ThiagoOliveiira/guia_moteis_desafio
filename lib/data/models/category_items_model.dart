import '../../domain/domain.dart';

class CategoryItemsModel {
  final String? nome;
  final String? icone;

  const CategoryItemsModel({this.nome, this.icone});

  factory CategoryItemsModel.fromJson(Map json) => CategoryItemsModel(icone: json['icone'], nome: json['nome']);

  CategoryItemsEntity toEntity() => CategoryItemsEntity(icone: icone, nome: nome);
}
