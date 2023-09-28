
class OrderModel {
  String? status;
  String? message;
  List<OrderData>? data;

  OrderModel({this.status, this.message, this.data});

  OrderModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => OrderData.fromJson(e)).toList();
  }


}

class OrderData {
  String? orderId;
  String? orderAddressid;
  String? orderUserid;
  String? orderDeliveryid;
  String? orderDeliveryprice;
  String? orderSubprice;
  String? orderDiscount;
  String? orderTotalprice;
  String? status;
  String? orderCouponid;
  String? orderPaymentmethod;
  String? orderDatetime;
  String? addressNo;
  String? addressUserid;
  String? addressName;
  String? cityId;
  String? addressStreet;
  String? additionalDetails;
  String? addressPhoneNumber;
  String? addressLat;
  String? addressLong;

  OrderData({this.orderId, this.orderAddressid, this.orderUserid, this.orderDeliveryid, this.orderDeliveryprice, this.orderSubprice, this.orderDiscount, this.orderTotalprice, this.status, this.orderCouponid, this.orderPaymentmethod, this.orderDatetime, this.addressNo, this.addressUserid, this.addressName, this.cityId, this.addressStreet, this.additionalDetails, this.addressPhoneNumber, this.addressLat, this.addressLong});

  OrderData.fromJson(Map<String, dynamic> json) {
    orderId = json["order_id"];
    orderAddressid = json["order_addressid"];
    orderUserid = json["order_userid"];
    orderDeliveryid = json["order_deliveryid"];
    orderDeliveryprice = json["order_deliveryprice"];
    orderSubprice = json["order_subprice"];
    orderDiscount = json["order_discount"];
    orderTotalprice = json["order_totalprice"];
    status = json["status"];
    orderCouponid = json["order_couponid"];
    orderPaymentmethod = json["order_paymentmethod"];
    orderDatetime = json["order_datetime"];
    addressNo = json["address_no"];
    addressUserid = json["address_userid"];
    addressName = json["address_name"];
    cityId = json["city_id"];
    addressStreet = json["address_street"];
    additionalDetails = json["additional_details"];
    addressPhoneNumber = json["address_phone_number"];
    addressLat = json["address_lat"];
    addressLong = json["address_long"];
  }


}