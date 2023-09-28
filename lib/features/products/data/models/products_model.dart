
class ProductsModel {
  String? status;
  String? message;
  List<ProductData>? data;

  ProductsModel({this.status, this.message, this.data});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => ProductData.fromJson(e)).toList();
  }


}

class ProductData {
  String? productId;
  String? productNameAr;
  String? productNameEn;
  String? productDescAr;
  String? productDescEn;
  String? productImage;
  String? productCount;
  String? productActive;
  String? productOldprice;
  String? productDescount;
  String? productTimeCreate;

  ProductData({this.productId, this.productNameAr, this.productNameEn, this.productDescAr, this.productDescEn, this.productImage, this.productCount, this.productActive, this.productOldprice, this.productDescount, this.productTimeCreate});

  ProductData.fromJson(Map<String, dynamic> json) {
    productId = json["product_id"];
    productNameAr = json["product_name_ar"];
    productNameEn = json["product_name_en"];
    productDescAr = json["product_desc_ar"];
    productDescEn = json["product_desc_en"];
    productImage = json["product_image"];
    productCount = json["product_count"];
    productActive = json["product_active"];
    productOldprice = json["product_oldprice"];
    productDescount = json["product_descount"];
    productTimeCreate = json["product_time_create"];
  }


}