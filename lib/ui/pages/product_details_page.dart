
import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/data/dummy_data.dart';
import 'package:e_commerce_app/core/data/models/product_model.dart';
import 'package:e_commerce_app/core/data/models/category_model.dart';

class ProductDetailsPage extends StatefulWidget {
  final int productIndex;
  const ProductDetailsPage({super.key, required this.productIndex});

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  ProductModel get product => dummyProducts[widget.productIndex];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        actions: [
          IconButton(
            onPressed: _deleteProduct,
            icon: Icon(Icons.delete),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${product.name}'),
            SizedBox(height: 8),
            Text('Description: ${product.description}'),
            SizedBox(height: 8),
            Text('Price: \$${product.price}'),
            SizedBox(height: 8),
            Text('Count: ${product.count}'),
            SizedBox(height: 8),
            Text('Category: ${product.category.name}'),
          ],
        ),
      ),
    );
  }

  void _deleteProduct() {
    final prod = product;
    // Remove product
    dummyProducts.removeAt(widget.productIndex);

    // Decrement category count if exists
    final idx = dummyCategories.indexWhere((c) => c.name == prod.category.name);
    if (idx != -1) {
      final old = dummyCategories[idx];
      final newCount = (old.productsCount - 1).clamp(0, 1 << 30);
      dummyCategories[idx] = CategoryModel(
        name: old.name,
        description: old.description,
        productsCount: newCount,
      );
    }

    Navigator.pop(context);
  }
}