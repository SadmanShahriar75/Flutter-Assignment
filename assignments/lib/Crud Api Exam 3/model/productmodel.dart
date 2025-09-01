//  "_id": "68b0967ddd287e3f18a26b4a",
//   "ProductName": "iphone",
//   "ProductCode": 1234,
//   "Img": "hhhh",
//   "Qty": 3,
//   "UnitPrice": 50000,
//   "TotalPrice": 150000

class ProductModel {
  late String id;
  late String name;
  late int code;
  late String img;
  late int Quantity;
  late int unitprice;
  late int totalprice;

  ProductModel.fromJson(Map<String, dynamic> productjosn) {
    id = productjosn['_id'];
    name = productjosn['ProductName'];
    code = productjosn['ProductCode'];
    img = productjosn['Img'];
    Quantity = productjosn['Qty'];
    unitprice = productjosn['UnitPrice'];
    totalprice = productjosn['TotalPrice'];
  }
}
