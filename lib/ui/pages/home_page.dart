import 'package:e_commerce_app/core/data/dummy_data.dart';
import 'package:e_commerce_app/core/data/models/category_model.dart';
import 'package:e_commerce_app/core/data/models/product_model.dart';
import 'package:e_commerce_app/ui/pages/add_edit_page.dart';
import 'package:e_commerce_app/ui/shared/widgets/categories_list.dart';
import 'package:e_commerce_app/ui/shared/widgets/products_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void addEdit() {
    showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddEditPage(isProduct: false),
                ),
              );
            },
            child: Text('Category'),
          ),
          TextButton(
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddEditPage(isProduct: true),
                ),
              );
              if (result is CategoryModel) {
                setState(() {
                  dummyCategories.add(result);
                });
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
              }
              if (result is ProductModel) {
                setState(() {
                  dummyProducts.add(result);
                });
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
              }
            },
            child: Text('Product'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('E-commerce app'),
        leading: IconButton(onPressed: addEdit, icon: Icon(Icons.add)),
      ),
      body: Column(
        children: [
          CategoriesList(categoriesList: dummyCategories),
          SizedBox(height: 10),
          Expanded(child: ProductsList(productsList: dummyProducts)),
        ],
      ),
    );
  }
}
