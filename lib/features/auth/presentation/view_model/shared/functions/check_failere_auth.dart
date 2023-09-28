

import '../../../../../../core/class/api/api_errors.dart';
import '../../../../../../core/class/api/failures.dart';

import '../classes/auth_failere_handling.dart';
AuthFailereHandling _authFailereHandling = AuthFailereHandling();
checkFailereAuth( context, Failure failure) {
  if (failure.apiErrors == ApiErrors.incorrectEmailorpassword) {
    _authFailereHandling.incorrectEmailorPasswordCase(context);
  } else if (failure.apiErrors == ApiErrors.emailORphoneExist) {
    _authFailereHandling.emailorPhoneExistCase(context);
  } else if (failure.apiErrors == ApiErrors.offlinefailure) {
    _authFailereHandling.offlineFailureCase(context);
  } else {
    _authFailereHandling.otherFailereCase(context, failure);
  }
}