// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "juniorMobileDeveloper": "Junior Mobile Developer",
  "apple": "Apple",
  "watermelon": "Watermelon",
  "banana": "banana",
  "shoppingList": "Shopping List",
  "noItemOnTheList": "No Item On The List",
  "shoppingCart": "Shopping Cart",
  "pay": "Pay"
};
static const Map<String,dynamic> tr = {
  "juniorMobileDeveloper": "Junior Mobil Geliştirici",
  "apple": "Elma",
  "watermelon": "Kavun",
  "banana": "Muz",
  "shoppingList": "Alışveriş Listesi",
  "noItemOnTheList": "Listede öğe yok",
  "shoppingCart": "Alışveriş Sepeti",
  "pay": "Öde"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "tr": tr};
}
