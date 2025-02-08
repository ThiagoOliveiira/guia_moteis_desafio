import '../../domain/domain.dart';

class DiscountModel {
  final double? desconto;

  const DiscountModel({this.desconto});

  factory DiscountModel.fromJson(Map json) => DiscountModel(desconto: json['desconto']);

  DiscountEntity toEntity() => DiscountEntity(desconto: desconto);
}
