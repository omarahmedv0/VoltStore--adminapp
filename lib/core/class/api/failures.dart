import '../../functions/check_internet.dart';
import 'api_errors.dart';

abstract class Failure {
  String errMessage;
  ApiErrors apiErrors;

  Failure(this.errMessage, this.apiErrors);
}

class ServerFailere extends Failure {
  ServerFailere(super.errMessage, super.apiErrors);

  factory ServerFailere.checkonStatuscode(int statuscode) {
    if (statuscode == 400 || statuscode == 401 || statuscode == 403) {
      return ServerFailere('Server Failure', ApiErrors.failure);
    } else if (statuscode == 404) {
      return ServerFailere(
          'Your request not found, Please try late !', ApiErrors.failure);
    } else if (statuscode == 500) {
      return ServerFailere(
          'Internal Server Error, Please try late !', ApiErrors.failure);
    } else if (checkInternet() == false) {
      return ServerFailere('No Internet', ApiErrors.offlinefailure);
    } else {
      return ServerFailere(
          'OPPS There Was an Error, Please try late !', ApiErrors.failure);
    }
  }
  factory ServerFailere.checkonErrormessage(String message) {
    switch (message) {
      case 'PHONE OR EMAIL was used':
        return ServerFailere(message, ApiErrors.emailORphoneExist);
      case 'Incorrect E-mail or password':
        return ServerFailere(message, ApiErrors.incorrectEmailorpassword);
      case 'coupon is not valid':
        return ServerFailere(message, ApiErrors.couponisnotValid);
         case 'This product has already been previously rated':
        return ServerFailere(message, ApiErrors.productHasAlreadyBeenPreviouslyRated);
      default:
        return ServerFailere('success', ApiErrors.none);

    }
  }
}
