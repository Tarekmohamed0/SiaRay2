import 'dart:developer';
import 'dart:ffi';
import 'package:first_project/storeapp/core/routes/routes.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';

import '../../data/models/product_model.dart';
import '../../data/sources/get_all_product.dart';

class HomeProduct extends StatelessWidget {
  const HomeProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Home Product'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Navigator.pushNamed(context, '/add_product');
            },
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ],
      ),
      body: FutureBuilder(
        future: GetAllProduct().getAllProduct(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List<ProductModel> products = snapshot.data!;
            return MasonryGridView.count(
              itemCount: products.length, // Use the length of products list
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              itemBuilder: (context, index) {
                final product = products[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.updateProduct,
                        arguments: product);
                    log('Product:[ ${product.title.substring(0, 6)}]');
                    log('Product: [${product.price}]');
                    log('Product: [${product.description}]');
                    log('Product: [${product.image}]');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 20,
                                offset: const Offset(9, 5),
                              )
                            ],
                          ),
                          height: 130,
                          width: 200,
                          child: Card(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.title.substring(0, 6),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ), // Use the product title
                                  const SizedBox(height: 10),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          'Rp ${product.price}'), // Use the product price
                                      const Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          bottom: 55,
                          child: RepaintBoundary(
                            child: Image.network(
                              product.image, // Use the product image URL
                              height: 80,
                              width: 80,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('No data available.'));
          }
        },
      ),
    );
  }
}
