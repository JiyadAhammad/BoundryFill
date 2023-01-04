import 'package:currencyconverter/controller/currency_controller.dart';
import 'package:currencyconverter/model/eachcurrency/eachcurerncy.dart';
import 'package:currencyconverter/model/hive_local/store_data.dart';
import 'package:currencyconverter/services/currency.dart';
import 'package:currencyconverter/view/screen/myconversion.dart';
import 'package:currencyconverter/view/widget/appbar_widget.dart';
import 'package:currencyconverter/view/widget/textform_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

String target = '';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController amountController = TextEditingController();

  String source = '';

  final Currencycontroller currencycontroller = Get.find();

  String currentSourceValue = '';

  CurrencyConvertModel? currencies;

  int amount = 1;

  @override
  Widget build(BuildContext context) {
    List<String> item = [];
    item.addAll(currencycontroller.currencyValues);
    // log(item.toString());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(title: '\$ Converter'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextformWidget(
                controller: amountController,
                labelText: 'Amount',
                hintText: 'Enter Amount',
              ),
              const SizedBox(
                height: 15,
              ),
              DropdownButtonFormField(
                iconSize: 20,
                decoration: InputDecoration(
                  hintText: 'Source',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: const BorderSide(
                      width: 3,
                    ),
                  ),
                ),
                items: item.map(
                  (item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item.toUpperCase()),
                    );
                  },
                ).toList(),
                onChanged: (value) {
                  // log(value.toString());
                  source = value!;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              DropdownButtonFormField(
                iconSize: 20,
                decoration: InputDecoration(
                  hintText: 'Target',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16.0),
                    borderSide: const BorderSide(
                      width: 3,
                    ),
                  ),
                ),
                items: item.map(
                  (item) {
                    return DropdownMenuItem(
                      value: item,
                      child: Text(item.toUpperCase()),
                    );
                  },
                ).toList(),
                onChanged: (value) {
                  target = value!;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    minimumSize: const Size(70, 40),
                  ),
                  onPressed: () async {
                    currencies = await CurrencyServices()
                        .currencyConversion(source, target);

                    setState(() {});
                    amount = int.parse(amountController.text);

                    final DateTime date = currencies!.date!;
                    final String data =
                        '${1 * amount} ${source.toUpperCase()}   =   ${currencies!.targetData * amount} ${target.toUpperCase()}';
                    final Storageitem dataToDb = Storageitem(
                      dateTime: date,
                      data: data,
                    );
                    amountController.clear();
                    currencycontroller.addDataList(dataToDb);
                  },
                  child: const Text('Convert'),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              divider(),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Result',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              currencies == null
                  ? const SizedBox(
                      child: Text(
                        'Waiting.....',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                        ),
                      ),
                    )
                  : Text(
                      '${1 * amount} ${source.toUpperCase()}   =   ${currencies!.targetData * amount} ${target.toUpperCase()}',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                      ),
                    ),
              const SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(50, 40),
                    backgroundColor: Colors.yellow[100],
                  ),
                  onPressed: () {
                    Get.to(
                      () => MyConversion(),
                      transition: Transition.fadeIn,
                      duration: const Duration(
                        milliseconds: 1000,
                      ),
                    );
                  },
                  child: const Text(
                    'View Previous Conversion',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Divider divider() {
  return const Divider(
    thickness: 2,
    color: Colors.black,
  );
}
