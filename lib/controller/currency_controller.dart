import 'package:currencyconverter/main.dart';
import 'package:currencyconverter/model/eachcurrency/eachcurerncy.dart';
import 'package:currencyconverter/model/hive_local/store_data.dart';
import 'package:currencyconverter/services/currency.dart';
import 'package:get/get.dart';

class Currencycontroller extends GetxController {
  var allCurrency = {};
  List<String> currencyValues = [];
  List<CurrencyConvertModel> eachCurrency = [];
  List<Storageitem> list = <Storageitem>[];

  @override
  void onInit() {
    super.onInit();
    getAllCurrency();
  }

  @override
  void onReady() {
    list.clear();
    list.addAll(dataItem.values);
    super.onReady();
  }

  void getAllCurrency() async {
    allCurrency = await CurrencyServices().allCurrency();
    for (var item in allCurrency.keys) {
      currencyValues.add(item);
    }
  }

  Future<void> addDataList(Storageitem data) async {
    final int id = await dataItem.add(data);
    final Storageitem studentdata = Storageitem(
      id: id,
      data: data.data,
      dateTime: data.dateTime,
    );

    await dataItem.put(id, studentdata);
    list.add(studentdata);
    update();
  }

  // getEachCurrency(String source, String target) async {
  //   eachCurrency = await CurrencyServices().currencyConversion(source, target);
  //   log('$eachCurrency eqch currency');
  // }
}
