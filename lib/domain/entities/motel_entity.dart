import 'package:equatable/equatable.dart';

import '../domain.dart';

class MotelEntity extends Equatable {
  final String? fantasia;
  final String? logo;
  final String? bairro;
  final double? distancia;
  final int? qtdFavoritos;
  final List<SuiteEntity>? suites;
  final int? qtdAvaliacoes;
  final double? media;

  const MotelEntity({this.fantasia, this.logo, this.bairro, this.distancia, this.qtdFavoritos, this.suites, this.qtdAvaliacoes, this.media});

  @override
  List get props => [fantasia, logo, bairro, distancia, qtdFavoritos, suites, qtdAvaliacoes, media];
}
