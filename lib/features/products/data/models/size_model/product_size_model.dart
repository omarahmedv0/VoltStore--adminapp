
class ProductSizeModel {
  String? status;
  String? message;
  String? productid;
  String? productSizId;
  List<String>? data;

  ProductSizeModel({this.status, this.message, this.productid, this.productSizId, this.data});

  ProductSizeModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    productid = json["productid"];
    productSizId = json["product_siz_id"];
    data = json["data"] == null ? null : List<String>.from(json["data"]);
  }

 
}