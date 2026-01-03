import 'package:e_commerce_app/core/data/models/category_model.dart';
import 'package:e_commerce_app/core/data/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/data/dummy_data.dart';

class AddEditPage extends StatefulWidget {
  const AddEditPage({super.key, required this.isProduct});
  final bool isProduct;

  @override
  State<AddEditPage> createState() => _AddEditPageState();
}

class _AddEditPageState extends State<AddEditPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController countController = TextEditingController();
  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    void saveProduct() {
      if (!_formKey.currentState!.validate()) return;
      if (widget.isProduct) {
        final name = nameController.text.trim();
        final description = descriptionController.text.trim();
        final price = double.tryParse(priceController.text) ?? 0.0;
        final count = int.tryParse(countController.text) ?? 0;
        final product = ProductModel(
          category: dummyCategories.first,
          name: name,
          description: description,
          price: price,
          count: count,
        );
        Navigator.pop(context, product);
      } else {
        final name = nameController.text.trim();
        final description = descriptionController.text.trim();
        final category = CategoryModel(name: name, description: description);
        Navigator.pop(context, category);
      }
    }

    Widget content = widget.isProduct
        ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Name is required.'
                    : null,
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: countController,
                decoration: InputDecoration(labelText: 'Count'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 12),
              DropdownButtonFormField<int>(
                initialValue: selectedCategoryIndex,
                items: List.generate(
                  dummyCategories.length,
                  (index) => DropdownMenuItem(
                    value: index,
                    child: Text(dummyCategories[index].name),
                  ),
                ),
                onChanged: (value) {
                  selectedCategoryIndex = value ?? 0;
                },
                decoration: InputDecoration(labelText: 'Category'),
              ),
              SizedBox(height: 12),
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) =>
                    value == null ||
                        value.trim().isEmpty ||
                        value.length < 2 ||
                        value.length > 50
                    ? 'Name should be from 2 to 50 characters.'
                    : null,
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) =>
                    value == null ||
                        value.trim().isEmpty ||
                        value.length < 2 ||
                        value.length > 250
                    ? 'Description should be from 2 to 250 characters.'
                    : null,
              ),
              SizedBox(height: 12),
              TextFormField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.numberWithOptions(),
                validator: (value) => value == null || value.trim().isEmpty
                    ? 'Price should not be zero.'
                    : null,
              ),
            ],
          );

    return Scaffold(
      appBar: AppBar(
        title: Text('Add/Edit product'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: saveProduct,
            child: Text('Save', style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(child: content),
        ),
      ),
    );
  }
}
