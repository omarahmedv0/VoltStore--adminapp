import '../../../../core/class/api/failures.dart';
import '../models/admin_account_model.dart';
import '../models/delivey_account_model.dart';
import 'package:dartz/dartz.dart';

abstract class AccountsRepo {
  Future<Either<Failure, AdminAccountModel>> getAdminsAccounts();
  Future<Either<Failure, DeliveryAccountModel>> getDeliveriesAccounts();
  Future<Either<Failure, Map>> addDeliveryAccount(
    String userName,
    String email,
    String password,
    String phone,
  );
  Future<Either<Failure, Map>> addAdminAccount(
    String userName,
    String email,
    String password,
    String phone,
  );

  Future<Either<Failure, Map>> editDeliveryAccount(
    String deliveryID,
    String userName,
    String email,
    String password,
    String phone,
  );
  Future<Either<Failure, Map>> editAdminAccount(
    String adminID,
    String userName,
    String email,
    String password,
    String phone,
  );

  Future<Either<Failure, Map>> deleteDeliveryAccount(
    String deliveryID,
  );
  Future<Either<Failure, Map>> deleteAdminAccount(
    String adminID,
  );
}
