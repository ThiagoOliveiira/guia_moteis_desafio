import '../../domain/domain.dart';
import '../data.dart';

class MotelModel {
  final String? fantasia;
  final String? logo;
  final String? bairro;
  final double? distancia;
  final int? qtdFavoritos;
  final List<SuiteModel>? suites;
  final int? qtdAvaliacoes;
  final double? media;

  const MotelModel({this.fantasia, this.logo, this.bairro, this.distancia, this.qtdFavoritos, this.suites, this.qtdAvaliacoes, this.media});

  factory MotelModel.fromJson(Map json) => MotelModel(
        fantasia: json['fantasia'],
        logo: json['logo'],
        bairro: json['bairro'],
        distancia: json['distancia'],
        qtdFavoritos: json['qtdFavoritos'],
        suites: json['suites'] != null && json['suites'].isNotEmpty ? json['suites'].map<SuiteModel>((suite) => SuiteModel.fromJson(suite)).toList() : null,
        qtdAvaliacoes: json['qtdAvaliacoes'],
        media: json['media'],
      );

  MotelEntity toEntity() => MotelEntity(
        bairro: bairro,
        distancia: distancia,
        fantasia: fantasia,
        logo: logo,
        media: media,
        qtdAvaliacoes: qtdAvaliacoes,
        qtdFavoritos: qtdFavoritos,
        suites: suites?.map((suite) => suite.toEntity()).toList(),
      );
}
