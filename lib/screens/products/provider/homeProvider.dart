import 'dart:convert';

import 'package:ecommerceapp/screens/products/modal/ProductModal.dart';
import 'package:ecommerceapp/screens/products/utils/sharedPrefrence.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as storehttp;

class ProductProvider extends ChangeNotifier {
  String? value;
  List JsonList = [];
  List<ProductModal> productList = [];
  List<ProductModal> filterList = [];
  int i = 0;

  Future<List> getUserData() async {
    productList.clear();
    var Jsonfile =
        await storehttp.get(Uri.parse('https://fakestoreapi.com/products'));
    JsonList = jsonDecode(Jsonfile.body);

   return JsonList.map((e) => ProductModal.fromJson(e)).toList();
  }

  void filter1() {
    for (i = 0; i < productList.length; i++) {
      if (productList[i].price! >= 0 && productList[i].price! <= 49) {
        filterList.add(productList[i]);
      }
    }
    productList = filterList;
    notifyListeners();
  }

  void filter2() {
    for (i = 0; i < productList.length; i++) {
      if (productList[i].price! >= 50 && productList[i].price! <= 99) {
        filterList.add(productList[i]);
      }

    }
    productList = filterList;
    notifyListeners();
  }

  void filter3() {
    for (i = 0; i < productList.length; i++) {
      if (productList[i].price! >= 100) {
        filterList.add(productList[i]);
      }
    }
    productList = filterList;
    notifyListeners();
  }
ProductModal? click;
  void getuser() async {

    value = await getusername();
    notifyListeners();
  }
}

