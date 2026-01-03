import 'package:e_commerce_app/core/data/dummy_data.dart';

class CategoryModel {
  CategoryModel({required this.name, required this.description, productsCount})
    : productsCount = dummyProducts
          .where((product) => product.name == name)
          .length;
  final String name;
  final String description;
  final int productsCount;
}
