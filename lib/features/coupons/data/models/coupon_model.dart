
class CouponModel {
  String? status;
  String? message;
  List<CouponData>? data;

  CouponModel({this.status, this.message, this.data});

  CouponModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = json["data"] == null ? null : (json["data"] as List).map((e) => CouponData.fromJson(e)).toList();
  }


}

class CouponData {
  String? couponId;
  String? couponName;
  String? couponCount;
  String? couponDiscount;
  String? couponExpiredata;

  CouponData({this.couponId, this.couponName, this.couponCount, this.couponDiscount, this.couponExpiredata});

  CouponData.fromJson(Map<String, dynamic> json) {
    couponId = json["coupon_id"];
    couponName = json["coupon_name"];
    couponCount = json["coupon_count"];
    couponDiscount = json["coupon_discount"];
    couponExpiredata = json["coupon_expiredata"];
  }

 
}