import 'package:assignments/Crud%20Api%20Exam%203/model/productmodel.dart';
import 'package:assignments/Crud%20Api%20Exam%203/screens/update.dart';
import 'package:assignments/Crud%20Api%20Exam%203/utils/baseurl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    super.key,
    required this.product,
    required this.refreshproductList,
  });

  final ProductModel product;
  final VoidCallback refreshproductList;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool _deleteinprogress = false;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: Image.network(
          widget.product.img,

          errorBuilder: (_, __, ___) {
            return Icon(Icons.error);
          },
        ),
      ),
      title: Text(widget.product.name),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Code : ${widget.product.code}"),

          Row(
            spacing: 16,
            children: [
              Expanded(child: Text("Quantity: ${widget.product.Quantity}")),
              Expanded(child: Text("Unit Prize : ${widget.product.unitprice}")),
            ],
          ),
        ],
      ),
      trailing: Visibility(
        visible: _deleteinprogress == false,
        replacement: CircularProgressIndicator(),
        child: PopupMenuButton<productOption>(
          itemBuilder: (context) {
            return [
              PopupMenuItem(value: productOption.update, child: Text("update")),
              PopupMenuItem(value: productOption.delete, child: Text("delete")),
            ];
          },
          onSelected: (productOption seletedoption) {
            if (seletedoption == productOption.delete) {
              deleteproductist();
            } else if (seletedoption == productOption.update) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UpdateProductCrud()),
              );
            }
          },
        ),
      ),
    );
  }

  Future<void> deleteproductist() async {
    _deleteinprogress = true;
    setState(() {});

    Uri _uri = Uri.parse(Urls.deleteProductsUrl(widget.product.id));
    Response response = await get(_uri);

    debugPrint(response.statusCode.toString());
    debugPrint(response.body);

    if (response.statusCode == 200) {
      widget.refreshproductList();
    }
    _deleteinprogress = false;
    setState(() {});
  }
}

enum productOption { update, delete }
