

import 'package:panificadora_mimago/data/models/productSale_model.dart';

class CartModel {
  CartModel({
    this.clienteId,
    this.products
  });

  int clienteId;
  List<ProductSaleModel> products;
   

}