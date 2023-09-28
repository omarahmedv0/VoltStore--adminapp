
class AddressData {
 String? addressNo;
  String? addressUserid;
  String? addressName;
  String? cityId;
  String? addressStreet;
  String? additionalDetails;
  String? addressPhoneNumber;
  String? addressLat;
  String? addressLong;
  String? cityNameEn;
  String? cityNameAr;

  AddressData({this.addressNo, this.addressUserid, this.addressName, this.cityId, this.addressStreet, this.additionalDetails, this.addressPhoneNumber, this.addressLat, this.addressLong, this.cityNameEn, this.cityNameAr});

  AddressData.fromJson(Map<String, dynamic> json) {
    addressNo = json["address_no"];
    addressUserid = json["address_userid"];
    addressName = json["address_name"];
    cityId = json["city_id"];
    addressStreet = json["address_street"];
    additionalDetails = json["additional_details"];
    addressPhoneNumber = json["address_phone_number"];
    addressLat = json["address_lat"];
    addressLong = json["address_long"];
    cityNameEn = json["city_name_en"];
    cityNameAr = json["city_name_ar"];
  }

 
}