
class DeliveryAccountModel {
  String? status;
  String? message;
  List<DeliveryData> deleveryData =[];

  DeliveryAccountModel({this.status, this.message, });

  DeliveryAccountModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    deleveryData = (json["data"] == null ? null : (json["data"] as List).map((e) => DeliveryData.fromJson(e)).toList())!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["status"] = status;
    data["message"] = message;
    data["data"] = deleveryData.map((e) => e.toJson()).toList();
      return data;
  }
}

class DeliveryData {
  String? deliveryId;
  String? deliveryName;
  String? deliveryEmail;
  String? deliveryPassword;
  String? deliveryPhone;

  DeliveryData({this.deliveryId, this.deliveryName, this.deliveryEmail, this.deliveryPassword, this.deliveryPhone});

  DeliveryData.fromJson(Map<String, dynamic> json) {
    deliveryId = json["delivery_id"];
    deliveryName = json["delivery_name"];
    deliveryEmail = json["delivery_email"];
    deliveryPassword = json["delivery_password"];
    deliveryPhone = json["delivery_phone"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["delivery_id"] = deliveryId;
    data["delivery_name"] = deliveryName;
    data["delivery_email"] = deliveryEmail;
    data["delivery_password"] = deliveryPassword;
    data["delivery_phone"] = deliveryPhone;
    return data;
  }
}