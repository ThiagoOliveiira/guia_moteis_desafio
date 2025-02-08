import 'package:equatable/equatable.dart';

import '../domain.dart';

class DataMotelEntity extends Equatable {
  final int? pagina;
  final int? qtdPorPagina;
  final int? totalSuites;
  final int? totalMoteis;
  final int? raio;
  final double? maxPaginas;
  final List<MotelEntity>? moteis;

  const DataMotelEntity({
    this.pagina,
    this.qtdPorPagina,
    this.totalSuites,
    this.totalMoteis,
    this.raio,
    this.maxPaginas,
    this.moteis,
  });

  @override
  List get props => [
        pagina,
        qtdPorPagina,
        totalSuites,
        totalMoteis,
        raio,
        maxPaginas,
        moteis,
      ];
}
