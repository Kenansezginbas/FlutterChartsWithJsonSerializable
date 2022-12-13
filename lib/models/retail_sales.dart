import 'package:json_annotation/json_annotation.dart';
part "retail_sales.g.dart";

@JsonSerializable()
class RetailSales {
  final int year;
  final int sumQty;
  RetailSales(this.year, this.sumQty);

  factory RetailSales.fromJson(Map<String, dynamic> json) =>
      _$RetailSalesFromJson(json);

  Map<String, dynamic> toJson() => _$RetailSalesToJson(this);
}
