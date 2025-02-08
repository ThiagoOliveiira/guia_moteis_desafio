import 'package:equatable/equatable.dart';

import '../domain.dart';

class PeriodEntity extends Equatable {
  final String? tempoFormatado;
  final String? tempo;
  final double? valor;
  final double? valorTotal;
  final bool? temCortesia;
  final DiscountEntity? desconto;

  const PeriodEntity({this.tempoFormatado, this.tempo, this.valor, this.valorTotal, this.temCortesia, this.desconto});

  @override
  List get props => [tempoFormatado, tempo, valor, valorTotal, temCortesia, desconto];
}
