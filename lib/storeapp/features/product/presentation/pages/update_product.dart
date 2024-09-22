import 'package:first_project/storeapp/features/product/data/models/product_model.dart';
import 'package:flutter/material.dart';

import '../../data/sources/update_product.dart';

class UpdateProduct extends StatelessWidget {
  UpdateProduct({super.key});
  String? title;
  String? price;
  String? description;
  String? image;
  @override
  Widget build(BuildContext context) {
    ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Update Product',
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) => title = value,
              decoration: InputDecoration(
                hintText: 'edit name of product',
                fillColor: Colors.black,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) => price = value,
              decoration: InputDecoration(
                hintText: 'edit price of product',
                fillColor: Colors.black,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) => description = value,
              decoration: InputDecoration(
                hintText: 'edit description of product',
                fillColor: Colors.black,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              onChanged: (value) => image = value,
              decoration: InputDecoration(
                hintText: 'edit image of product',
                fillColor: Colors.black,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(),
                ),
              ),
            ),
          ),
          ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.black),
                fixedSize: WidgetStateProperty.all(const Size(200, 50)),
              ),
              onPressed: () {
                UpdateProductt().updateProduct(
                    id: product.id,
                    title: title.toString(),
                    price: price.toString(),
                    description: description.toString(),
                    category: product.category,
                    image: image.toString());
                print('Product: [${product.id}]');
                print('Product: [$title]');
                print('Product: [$price]');
                Navigator.pop(context);
              },
              child: const Text(
                'Update Product',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
