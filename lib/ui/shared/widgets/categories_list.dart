import 'package:e_commerce_app/core/data/models/category_model.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatefulWidget {
  const CategoriesList({super.key, required this.categoriesList});
  final List<CategoryModel> categoriesList;

  @override
  State<CategoriesList> createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  void showDetails(CategoryModel category) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: Text(category.name)),
          body: Center(child: Text('Category: ${category.name}')),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Constrain horizontal ListView height and provide itemCount to avoid
    // unbounded/overflow errors and out-of-range indices.
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categoriesList.length,
        itemBuilder: (context, index) {
          final category = widget.categoriesList[index];
          return Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Ink(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(8)),
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () => showDetails(category),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          Text(category.name),
                          SizedBox(width: 8),
                          Text(category.productsCount.toString()),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
