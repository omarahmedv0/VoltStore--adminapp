
class CategoryModel {
  String? status;
  String? message;
  List<CategoryData> catData =[];

  CategoryModel({this.status, this.message, });

  CategoryModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    catData = (json["data"] == null ? null : (json["data"] as List).map((e) => CategoryData.fromJson(e)).toList())!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["status"] = status;
    data["message"] = message;
    data["data"] = catData.map((e) => e.toJson()).toList();
      return data;
  }
}

class CategoryData {
  String? categoryId;
  String? categoryNameAr;
  String? categoryNameEn;
  String? image;
  String? categoryTimeCreate;

  CategoryData({this.categoryId, this.categoryNameAr, this.categoryNameEn, this.image, this.categoryTimeCreate});

  CategoryData.fromJson(Map<String, dynamic> json) {
    categoryId = json["category_id"];
    categoryNameAr = json["category_name_ar"];
    categoryNameEn = json["category_name_en"];
    image = json["image"];
    categoryTimeCreate = json["category_time_create"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["category_id"] = categoryId;
    data["category_name_ar"] = categoryNameAr;
    data["category_name_en"] = categoryNameEn;
    data["image"] = image;
    data["category_time_create"] = categoryTimeCreate;
    return data;
  }
}