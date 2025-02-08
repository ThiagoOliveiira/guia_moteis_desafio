import '../../domain/domain.dart';
import '../data.dart';

class PeriodModel {
  final String? tempoFormatado;
  final String? tempo;
  final double? valor;
  final double? valorTotal;
  final bool? temCortesia;
  final DiscountModel? desconto;

  const PeriodModel({this.tempoFormatado, this.tempo, this.valor, this.valorTotal, this.temCortesia, this.desconto});

  factory PeriodModel.fromJson(Map json) => PeriodModel(
        tempoFormatado: json['tempoFormatado'],
        tempo: json['tempo'],
        valor: json['valor'],
        valorTotal: json['valorTotal'],
        temCortesia: json['temCortesia'],
        desconto: json['desconto'] != null ? DiscountModel.fromJson(json['desconto']) : null,
      );

  PeriodEntity toEntity() => PeriodEntity(
        desconto: desconto?.toEntity(),
        temCortesia: temCortesia,
        tempo: tempo,
        tempoFormatado: tempoFormatado,
        valor: valor,
        valorTotal: valorTotal,
      );
}
