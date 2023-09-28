
class CitiesData {
  String? cityId;
  String? cityNameEn;
  String? cityNameAr;

  CitiesData({this.cityId, this.cityNameEn, this.cityNameAr});

  CitiesData.fromJson(Map<String, dynamic> json) {
    cityId = json["city_id"];
    cityNameEn = json["city_name_en"];
    cityNameAr = json["city_name_ar"];
  }

 
}