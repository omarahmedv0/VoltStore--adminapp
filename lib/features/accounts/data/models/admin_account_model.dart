
class AdminAccountModel {
  String? status;
  String? message;
  List<AdminData> data = [];

  AdminAccountModel({this.status, this.message,});

  AdminAccountModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    message = json["message"];
    data = (json["data"] == null ? null : (json["data"] as List).map((e) => AdminData.fromJson(e)).toList())!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> d = <String, dynamic>{};
    d["status"] = status;
    d["message"] = message;
    d["data"] = data.map((e) => e.toJson()).toList();
      return d;
  }
}

class AdminData {
  String? adminId;
  String? adminName;
  String? adminEmail;
  String? adminPassword;
  String? adminPhone;

  AdminData({this.adminId, this.adminName, this.adminEmail, this.adminPassword, this.adminPhone});

  AdminData.fromJson(Map<String, dynamic> json) {
    adminId = json["admin_id"];
    adminName = json["admin_name"];
    adminEmail = json["admin_email"];
    adminPassword = json["admin_password"];
    adminPhone = json["admin_phone"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["admin_id"] = adminId;
    data["admin_name"] = adminName;
    data["admin_email"] = adminEmail;
    data["admin_password"] = adminPassword;
    data["admin_phone"] = adminPhone;
    return data;
  }
}