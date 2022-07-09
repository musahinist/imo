import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'dart:io';

//TODO: add   currency_picker: ^2.0.11 and
class PriceFormField extends StatelessWidget {
  const PriceFormField({Key? key}) : super(key: key);
  String getCurrency() {
    var format = NumberFormat.simpleCurrency(locale: Platform.localeName);
    return format.currencySymbol;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: const TextInputType.numberWithOptions(
        decimal: true,
        signed: false,
      ),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}'))
      ],
      decoration: InputDecoration(
        label: const Text('What is the price of the pack?'),
        prefix: Text(getCurrency()),
        // suffixIcon: IconButton(
        //     onPressed: () {
        //       showCurrencyPicker(
        //         context: context,
        //         showFlag: false,
        //         showCurrencyName: true,
        //         showCurrencyCode: true,
        //         onSelect: (Currency currency) {
        //           print('Select currency: ${currency.symbol}');
        //           ref
        //               .read(userProvider.notifier)
        //               .updateUser(user.copyWith(currency: currency.symbol));
        //         },
        //       );
        //     },
        //     icon: const Icon(Icons.currency_exchange_outlined)),
      ),
      onChanged: (value) {},
    );
  }
}
