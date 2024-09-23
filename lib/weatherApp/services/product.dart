import 'package:first_project/weatherApp/data/models/prudectmodeltest.dart';
import 'package:first_project/weatherApp/services/categoryservicestest.dart';
import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  Product({super.key, required this.productModel});

  Future<void> getProducts() async {
    productModel = await productServcies().getProducts();
  }

  ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [Text(productModel.name)],
    ));
  }
}
