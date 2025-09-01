import 'dart:convert';

import 'package:assignments/Crud%20Api%20Exam%203/widgets/showsnackbar.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddProductCrud extends StatefulWidget {
  const AddProductCrud({super.key});

  @override
  State<AddProductCrud> createState() => _AddProductCrudState();
}

class _AddProductCrudState extends State<AddProductCrud> {
  bool _inprogress = false;

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
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return "enter your value";
                  }
                  return null;
                },
              ),

              TextFormField(
                keyboardType: TextInputType.number,
                controller: productcodeController,
                decoration: InputDecoration(hintText: "product code"),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return "enter your value";
                  }
                  return null;
                },
              ),

              TextFormField(
                keyboardType: TextInputType.number,
                controller: quantityController,
                decoration: InputDecoration(hintText: "Quantity"),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return "enter your value";
                  }
                  return null;
                },
              ),

              TextFormField(
                keyboardType: TextInputType.number,
                controller: unitpriceController,
                decoration: InputDecoration(hintText: "Unit Price"),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return "enter your value";
                  }
                  return null;
                },
              ),

              TextFormField(
                controller: imageController,
                decoration: InputDecoration(hintText: "image url"),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return "enter your value";
                  }
                  return null;
                },
              ),

              SizedBox(height: 15),

              Visibility(
                visible: _inprogress == false,
                replacement: Center(child: CircularProgressIndicator()),
                child: FilledButton(
                  onPressed: () {
                    addOnTapProductButtton();
                  },
                  child: Text("add product"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addOnTapProductButtton() async {
    if (_fromkey.currentState!.validate() == false) {
      return;
    }

    _inprogress = true;
    setState(() {});

    // uri
    Uri uri = Uri.parse("http://35.73.30.144:2008/api/v1/CreateProduct");

    // data preparation
    int totalpricee =
        int.parse(unitpriceController.text) *
        int.parse(quantityController.text);

    Map<String, dynamic> requestbody = {
      "ProductName": productnameController.text.trim(),
      "ProductCode": int.parse(productcodeController.text.trim()),
      "Img": imageController.text.trim(),
      "Qty": int.parse(quantityController.text.trim()),
      "UnitPrice": int.parse(unitpriceController.text.trim()),
      "TotalPrice": totalpricee,
    };

    //  request data
    Response response = await post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(requestbody),
    );

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      final decodededjson = jsonDecode(response.body);
      if (decodededjson['status'] == 'success') {
        clearTEXT();
        showsnackbar(context, "created successfully");
      } else {
        final errorsms = decodededjson['data'];
        showsnackbar(context, errorsms);
      }
    }

    _inprogress = false;
    setState(() {});
  }

  ///done

  void clearTEXT() {
    productcodeController.clear();
    productnameController.clear();
    unitpriceController.clear();
    quantityController.clear();
    imageController.clear();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    productnameController.dispose();
    productcodeController.dispose();
    quantityController.dispose();
    unitpriceController.dispose();
    imageController.dispose();
    super.dispose();
  }
}
