import 'dart:convert';

// To parse this JSON data, do
//
//     final allCurrencyModel = allCurrencyModelFromJson(jsonString);

Map<String, String> allCurrencyModelFromJson(String str) =>
    Map.from(json.decode(str)).map((k, v) => MapEntry<String, String>(k, v));

String allCurrencyModelToJson(Map<String, String> data) =>
    json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v)));
