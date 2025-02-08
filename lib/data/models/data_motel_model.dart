import '../../domain/domain.dart';
import '../data.dart';

class DataMotelModel {
  final int? pagina;
  final int? qtdPorPagina;
  final int? totalSuites;
  final int? totalMoteis;
  final int? raio;
  final double? maxPaginas;
  final List<MotelModel>? moteis;

  const DataMotelModel({
    this.pagina,
    this.qtdPorPagina,
    this.totalSuites,
    this.totalMoteis,
    this.raio,
    this.maxPaginas,
    this.moteis,
  });

  factory DataMotelModel.fromJson(Map json) => DataMotelModel(
        pagina: json['pagina'],
        qtdPorPagina: json['qtdPorPagina'],
        totalSuites: json['totalSuites'],
        totalMoteis: json['totalMoteis'],
        raio: json['raio'],
        maxPaginas: json['maxPaginas'],
        moteis: json['moteis'] != null && json['moteis'].isNotEmpty ? json['moteis'].map<MotelModel>((motel) => MotelModel.fromJson(motel)).toList() : null,
      );

  DataMotelEntity toEntity() => DataMotelEntity(
        maxPaginas: maxPaginas,
        pagina: pagina,
        qtdPorPagina: qtdPorPagina,
        totalMoteis: totalMoteis,
        totalSuites: totalSuites,
        raio: raio,
        moteis: moteis?.map((motel) => motel.toEntity()).toList(),
      );
}
