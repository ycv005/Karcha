import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

List getCurrencyDetail(context) {
  Locale locale = Localizations.localeOf(context);
  var format = NumberFormat.simpleCurrency(locale: locale.toString());
  // print("CURRENCY SYMBOL ${format.currencySymbol}"); // $
  // print("CURRENCY NAME ${format.currencyName}"); // USD
  return [format.currencySymbol, format.currencyName];
}
