import 'dart:convert';

import 'package:assignments/Crud%20Api%20Exam%203/model/productmodel.dart';
import 'package:assignments/Crud%20Api%20Exam%203/screens/add_product.dart';
import 'package:assignments/Crud%20Api%20Exam%203/utils/baseurl.dart';
import 'package:assignments/Crud%20Api%20Exam%203/widgets/pruductitem.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

// post , get , delete korsi ,, update ta kora hoy nai

class CrudHome extends StatefulWidget {
  const CrudHome({super.key});

  @override
  State<CrudHome> createState() => _CrudHomeState();
}

class _CrudHomeState extends State<CrudHome> {
  List<ProductModel> _productlist = [];
  bool _getinprogress = false;

  @override
  void initState() {
    super.initState();
    _getproductist();
  }

  Future<void> _getproductist() async {
    _productlist.clear();
    _getinprogress = true;
    setState(() {});
    Uri _uri = Uri.parse(Urls.getProductUrl);
    Response response = await get(_uri);

    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if (response.statusCode == 200) {
      final decodedjson = jsonDecode(response.body);
      for (Map<String, dynamic> productjosn in decodedjson['data']) {
        ProductModel product = ProductModel.fromJson(productjosn);

        _productlist.add(product);
      }
    }
    _getinprogress = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product List"),
        actions: [
          IconButton(
            onPressed: () {
              _getproductist();
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Visibility(
        visible: _getinprogress == false,
        replacement: Center(child: CircularProgressIndicator()),

        child: ListView.separated(
          itemCount: _productlist.length,
          itemBuilder: (context, index) {
            return ProductItem(
              product: _productlist[index],
              refreshproductList: () {
                _getproductist();
              },
            );
          },
          separatorBuilder: (context, index) {
            return Divider(indent: 70);
          },
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddProductCrud()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
