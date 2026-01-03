import 'package:e_commerce_app/core/data/models/category_model.dart';
import 'dart:io';

class ProductModel {
  const ProductModel({
    required this.category,
    required this.name,
    required this.description,
    required this.price,
    required this.count,
    this.image,
    this.isAvilable,
  });
  final CategoryModel category;
  final String name;
  final String description;
  final double price;
  final int count;
  final File? image;
  final bool? isAvilable;
}
