
class ShippingCostModel {
  String? status;
  String? message;
  List<ShippingCostData>? data;

  ShippingCostModel({this.status, this.message, this.data});

  ShippingCostModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => ShippingCostData.fromJson(e)).toList();
  }


}

class ShippingCostData {
  String? id;
  String? cityId;
  String? shippingCost;
  String? cityNameEn;
  String? cityNameAr;

  ShippingCostData({this.id, this.cityId, this.shippingCost, this.cityNameEn, this.cityNameAr});

  ShippingCostData.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    cityId = json["city_id"];
    shippingCost = json["shipping_cost"];
    cityNameEn = json["city_name_en"];
    cityNameAr = json["city_name_ar"];
  }


}