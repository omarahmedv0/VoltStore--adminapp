
class DeliveryIdModel {
  String? status;
  String? message;
  List<IDData>? data;

  DeliveryIdModel({this.status, this.message, this.data});

  DeliveryIdModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => IDData.fromJson(e)).toList();
  }

 
}

class IDData {
  String? deliveryId;

  IDData({this.deliveryId});

  IDData.fromJson(Map<String, dynamic> json) {
    deliveryId = json["delivery_id"];
  }

 
}