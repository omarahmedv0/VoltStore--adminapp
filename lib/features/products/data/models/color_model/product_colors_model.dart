
class ProductColorsModel {
  String? status;
  String? message;
  String? productid;
  String? productColorId;
  List<String>? data;

  ProductColorsModel({this.status, this.message, this.productid, this.productColorId, this.data});

  ProductColorsModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    productid = json["productid"];
    productColorId = json["product_color_id"];
    data = json["data"] == null ? null : List<String>.from(json["data"]);
  }


}