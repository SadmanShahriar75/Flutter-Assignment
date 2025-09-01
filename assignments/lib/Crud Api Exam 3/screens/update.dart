import 'package:flutter/material.dart';

class UpdateProductCrud extends StatefulWidget {
  const UpdateProductCrud({super.key});

  @override
  State<UpdateProductCrud> createState() => _AddProductCrudState();
}

class _AddProductCrudState extends State<UpdateProductCrud> {
  final GlobalKey<FormState> _fromkey = GlobalKey<FormState>();
  TextEditingController productnameController = TextEditingController();
  TextEditingController productcodeController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController unitpriceController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Product")),
      body: Form(
        key: _fromkey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.name,
                controller: productnameController,
                decoration: InputDecoration(hintText: "product name"),
              ),

              TextFormField(
                keyboardType: TextInputType.number,
                controller: productcodeController,
                decoration: InputDecoration(hintText: "product code"),
              ),

              TextFormField(
                keyboardType: TextInputType.number,
                controller: quantityController,
                decoration: InputDecoration(hintText: "Quantity"),
              ),

              TextFormField(
                keyboardType: TextInputType.number,
                controller: unitpriceController,
                decoration: InputDecoration(hintText: "Unit Price"),
              ),

              TextFormField(
                controller: imageController,
                decoration: InputDecoration(hintText: "image url"),
              ),

              SizedBox(height: 15),

              FilledButton(onPressed: () {}, child: Text("update product")),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    productcodeController.dispose();
    productcodeController.dispose();
    quantityController.dispose();
    unitpriceController.dispose();
    imageController.dispose();
    super.dispose();
  }
}
