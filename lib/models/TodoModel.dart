import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

import 'Products.dart';

class TodoModel extends ChangeNotifier {
  List<Products>? ProductList;
  List<Products>? Filtered_ProductList;
  Products? selectedproduct;

  int size = 0;

  changeSProduct(Products products) {
    selectedproduct = products;
    notifyListeners();
  }

  getProducts() async {
    String url = 'https://fakestoreapi.com/products';
    Response response = await get(Uri.parse(url));
    print(response.body);
    Iterable list = jsonDecode(response.body);
    ProductList =
        List<Products>.from(list.map((model) => Products.fromMap(model)));
    Filtered_ProductList = ProductList;
    print(ProductList!.length);
    size = ProductList!.length;
    notifyListeners();
  }

  onchange(String ch) {
    print(ch);
    Filtered_ProductList = [];
    int lenth = ProductList!.length;
    print(lenth);
    if (ch == "All") {
      Filtered_ProductList = ProductList;
    } else {
      for (int i = 0; i < 20; i++) {
        if (ProductList![i].category == ch) {
          Filtered_ProductList!.add(ProductList![i]);
        }
        print("runned for each");
      }
    }
    size = Filtered_ProductList!.length;
    print("notified");
    print(Filtered_ProductList!.length);
    notifyListeners();
  }
}
