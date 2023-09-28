// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:adminapp/core/class/api/api_service.dart';
import 'package:adminapp/core/class/api/failures.dart';
import 'package:adminapp/core/constants/api_links.dart';
import 'package:adminapp/features/accounts/data/models/admin_account_model.dart';
import 'package:adminapp/features/accounts/data/models/delivey_account_model.dart';
import 'package:adminapp/features/accounts/data/repos/accounts_repo.dart';
import 'package:dartz/dartz.dart';

class AccountsRepoImpl implements AccountsRepo {
  ApiService apiService;
  AccountsRepoImpl({
    required this.apiService,
  });

  @override
  Future<Either<Failure, AdminAccountModel>> getAdminsAccounts() async {
    try {
      var response = await apiService.getData(
        ApiLinks.getAdminAccount,
      );
      return response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(AdminAccountModel.fromJson(
          data,
        ));
      });
    } on ServerFailere catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, DeliveryAccountModel>> getDeliveriesAccounts() async {
    try {
      var response = await apiService.getData(
        ApiLinks.getDeliveriesAccount,
      );
      return response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(DeliveryAccountModel.fromJson(
          data,
        ));
      });
    } on ServerFailere catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, Map>> addAdminAccount(
      String userName, String email, String password, String phone) async {
    try {
      var response = await apiService.postData(ApiLinks.addAdminAccount, {
        'name': userName,
        'email': email,
        'phone': phone,
        'password': password
      });
      return response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(
          data,
        );
      });
    } on ServerFailere catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, Map>> addDeliveryAccount(
      String userName, String email, String password, String phone) async {
    try {
      var response = await apiService.postData(ApiLinks.addDeliveriesAccount, {
        'name': userName,
        'email': email,
        'phone': phone,
        'password': password
      });
      return response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(
          data,
        );
      });
    } on ServerFailere catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, Map>> editAdminAccount(String adminID, String userName,
      String email, String password, String phone) async {
    try {
      var response = await apiService.postData(ApiLinks.editAdminAccount, {
        'id': adminID,
        'name': userName,
        'email': email,
        'phone': phone,
        'password': password
      });
      return response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(
          data,
        );
      });
    } on ServerFailere catch (e) {
      return left(e);
    }
  }

  @override
  Future<Either<Failure, Map>> editDeliveryAccount(String deliveryID,
      String userName, String email, String password, String phone) async {
    try {
      var response = await apiService.postData(ApiLinks.editDeliveryAccount, {
        'id': deliveryID,
        'name': userName,
        'email': email,
        'phone': phone,
        'password': password
      });
      return response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(
          data,
        );
      });
    } on ServerFailere catch (e) {
      return left(e);
    }
  }
  
  @override
  Future<Either<Failure, Map>> deleteAdminAccount(String adminID) async{
    try {
      var response = await apiService.postData(ApiLinks.deleteAdminAccount, {
        'id': adminID,
       
      });
      return response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(
          data,
        );
      });
    } on ServerFailere catch (e) {
      return left(e);
    }
  }
  
  @override
  Future<Either<Failure, Map>> deleteDeliveryAccount(String deliveryID) async{
    try {
      var response = await apiService.postData(ApiLinks.deleteDeliveriesAccount, {
        'id': deliveryID,
       
      });
      return response.fold((failere) {
        return left(failere);
      }, (data) {
        return right(
          data,
        );
      });
    } on ServerFailere catch (e) {
      return left(e);
    }
  }
}
