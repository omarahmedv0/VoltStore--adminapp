
import 'cities_data.dart';

class CitiesModel {
  String? status;
  String? message;
  List<CitiesData> data =[];

  CitiesModel({this.status, this.message, });

  CitiesModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = (json["data"] == null ? null : (json["data"] as List).map((e) => CitiesData.fromJson(e)).toList())!;
  }

 
}
