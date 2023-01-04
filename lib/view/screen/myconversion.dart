import 'package:currencyconverter/controller/currency_controller.dart';
import 'package:currencyconverter/view/screen/home_screen.dart';
import 'package:currencyconverter/view/widget/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MyConversion extends StatelessWidget {
  MyConversion({Key? key}) : super(key: key);

  final Currencycontroller currencycontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarWidget(
        title: 'Myconversion',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        child: GetBuilder<Currencycontroller>(
            init: Currencycontroller(),
            builder: (Currencycontroller currencycontroller) {
              return ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: currencycontroller.list.length,
                itemBuilder: (BuildContext context, int index) {
                  return MyconversionList(
                    index: index,
                  );
                },
              );
            }),
      ),
    );
  }
}

class MyconversionList extends StatelessWidget {
  MyconversionList({
    Key? key,
    required this.index,
  }) : super(key: key);
  final Currencycontroller currencycontroller = Get.find();
  final int index;

  @override
  Widget build(BuildContext context) {
    final dateToconvert = currencycontroller.list[index].dateTime.toString();
    final perfectDate = dateToconvert.split(' ');
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          perfectDate[0],
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          currencycontroller.list[index].data,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        divider(),
        const SizedBox(
          height: 50,
        ),
      ],
    );
  }
}
