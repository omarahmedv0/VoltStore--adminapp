import 'address_data.dart';


import 'order_details_data.dart';
import 'product_details_data.dart';

class OrderDetailsModel {
  String? status;
  String? message;
  MyorderDetails? orderDetails;
  AddressData? addressDetails;
  List<ProductsDetailsMyorder>? productsDetails;

  OrderDetailsModel({this.status, this.message, this.orderDetails, this.addressDetails, this.productsDetails});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    orderDetails = json["order_details"] == null ? null : MyorderDetails.fromJson(json["order_details"]);
    addressDetails = json["address_details"] == null ? null : AddressData.fromJson(json["address_details"]);
    productsDetails = json["products_details"] == null ? null : (json["products_details"] as List).map((e) => ProductsDetailsMyorder.fromJson(e)).toList();
  }

 
}
