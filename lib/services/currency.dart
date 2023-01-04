import 'dart:convert';
import 'dart:developer';

import 'package:currencyconverter/model/allcurrency/allcurrency.dart';
import 'package:currencyconverter/model/eachcurrency/eachcurerncy.dart';
import 'package:currencyconverter/services/api/api_url.dart';

import 'package:http/http.dart';

class CurrencyServices {
  Future<dynamic> allCurrency() async {
    String json = '';
    Client client = Client();
    Uri uri = Uri.parse(baseUrl);
    Response response = await client.get(uri);
    if (response.statusCode == 200) {
      json = response.body;
      return allCurrencyModelFromJson(json);
    }
  }

  Future<CurrencyConvertModel?> currencyConversion(
      String source, String target) async {
    try {
      Map<String, dynamic> json = {};
      Client client = Client();
      Uri uri =
          Uri.parse('${eachCurrency}latest/currencies/$source/$target.json?');
      Response response = await client.get(uri);

      if (response.statusCode == 200) {
        json = jsonDecode(response.body) as Map<String, dynamic>;

        final jsonasData = CurrencyConvertModel.fromJson(json);
        return jsonasData;
      }
    } catch (e) {
      log('$e error thrown');
    }
    return null;
  }
}
