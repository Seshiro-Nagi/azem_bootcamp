import 'package:e_commerce_app/core/data/models/product_model.dart';
import 'package:e_commerce_app/ui/pages/product_details_page.dart';
import 'package:flutter/material.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key, required this.productsList});
  final List<ProductModel> productsList;

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.productsList.length,
      itemBuilder: (context, index) {
        final product = widget.productsList[index];
        return Card(
          elevation: 4,
          margin: EdgeInsets.all(10),
          child: ListTile(
            title: Text(product.name),
            subtitle: Text('\$ ${product.price.toString()}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductDetailsPage(productIndex: index),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
