class MyorderDetails {
  String? orderId;
  String? orderSubprice;
  String? orderTotalprice;
  String? orderStatus;
  String? orderPaymentmethod;
  String? orderDatetime;
  String? orderDeliveryprice;
  String? orderDiscount;

  MyorderDetails({
    this.orderId,
    this.orderSubprice,
    this.orderTotalprice,
    this.orderStatus,
    this.orderPaymentmethod,
    this.orderDatetime,
    this.orderDeliveryprice,
  });

  MyorderDetails.fromJson(Map<String, dynamic> json) {
    orderId = json["order_id"];
    orderSubprice = json["order_subprice"];
    orderTotalprice = json["order_totalprice"];
    orderStatus = json["order_status"];
    orderDiscount = json["order_discount"];
    orderPaymentmethod = json["order_paymentmethod"];
    orderDatetime = json["order_datetime"];
    orderDeliveryprice = json["order_deliveryprice"];
  }


}
