import '../../domain/domain.dart';
import '../data.dart';

class SuiteModel {
  final String? nome;
  final int? qtd;
  final bool? exibirQtdDisponiveis;
  final List<String>? fotos;
  final List<ItemModel>? itens;
  final List<CategoryItemsModel>? categoriaItens;
  final List<PeriodModel>? periodos;

  const SuiteModel({this.nome, this.qtd, this.exibirQtdDisponiveis, this.fotos, this.itens, this.categoriaItens, this.periodos});

  factory SuiteModel.fromJson(Map json) => SuiteModel(
        nome: json['nome'],
        qtd: json['qtd'],
        exibirQtdDisponiveis: json['exibirQtdDisponiveis'],
        fotos: json['fotos'].cast<String>(),
        itens: json['itens'] != null && json['itens'].isNotEmpty ? json['itens'].map<ItemModel>((item) => ItemModel.fromJson(item)).toList() : null,
        categoriaItens:
            json['categoriaItens'] != null && json['categoriaItens'].isNotEmpty ? json['categoriaItens'].map<CategoryItemsModel>((categoriaItem) => CategoryItemsModel.fromJson(categoriaItem)).toList() : null,
        periodos: json['periodos'] != null && json['periodos'].isNotEmpty ? json['periodos'].map<PeriodModel>((periodo) => PeriodModel.fromJson(periodo)).toList() : null,
      );

  SuiteEntity toEntity() => SuiteEntity(
        nome: nome,
        qtd: qtd,
        exibirQtdDisponiveis: exibirQtdDisponiveis,
        fotos: fotos,
        categoriaItens: categoriaItens?.map((categoriaItem) => categoriaItem.toEntity()).toList(),
        itens: itens?.map((item) => item.toEntity()).toList(),
        periodos: periodos?.map((periodo) => periodo.toEntity()).toList(),
      );
}
