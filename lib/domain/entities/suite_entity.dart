import 'package:equatable/equatable.dart';

import '../domain.dart';

class SuiteEntity extends Equatable {
  final String? nome;
  final int? qtd;
  final bool? exibirQtdDisponiveis;
  final List<String>? fotos;
  final List<ItemEntity>? itens;
  final List<CategoryItemsEntity>? categoriaItens;
  final List<PeriodEntity>? periodos;

  const SuiteEntity({this.nome, this.qtd, this.exibirQtdDisponiveis, this.fotos, this.itens, this.categoriaItens, this.periodos});

  @override
  List get props => [nome, qtd, exibirQtdDisponiveis, fotos, itens, categoriaItens, periodos];
}

extension ListSuiteExt on List<SuiteEntity?> {
  List<SuiteEntity?> getSuiteByDiscount() => where((suite) => suite?.periodos?.any((p) => p.desconto != null) == true).toList();
}
