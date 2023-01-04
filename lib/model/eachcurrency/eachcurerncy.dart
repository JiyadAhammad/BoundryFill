// To parse this JSON data, do
//
//     final currencyConvertModel = currencyConvertModelFromJson(jsonString);

import 'dart:convert';

import 'package:currencyconverter/view/screen/home_screen.dart';

// CurrencyConvertModel currencyConvertModelFromJson(String str) =>
//     CurrencyConvertModel.fromJson(json.decode(str));

// String currencyConvertModelToJson(CurrencyConvertModel data) =>
//     json.encode(data.toJson());

class CurrencyConvertModel {
  CurrencyConvertModel({
    this.date,
    this.targetData = 0.0,
  });

  DateTime? date;
  double targetData;

  factory CurrencyConvertModel.fromJson(Map<String, dynamic> json) =>
      CurrencyConvertModel(
        date: DateTime.parse(json["date"] as String),
        targetData: json[target].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "targetData": targetData,
      };
}
