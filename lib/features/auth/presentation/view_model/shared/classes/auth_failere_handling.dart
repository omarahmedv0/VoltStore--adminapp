import 'package:adminapp/core/functions/navigation/pop.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/class/api/failures.dart';
import '../../../../../../core/functions/custom_dialog.dart';



class AuthFailereHandling {
  void emailorPhoneExistCase(context) {
    customDialog(context, 'Notice!', 'Email or  Phone already  exist', 'ok', () {
         pop(context);

    });
  }

  void otherFailereCase(BuildContext context, Failure failure) {
    customDialog(context, 'Alert!', failure.errMessage, 'ok', () {
         pop(context);

    });
  }

  void offlineFailureCase(BuildContext context) {
    customDialog(context, 'Alert!', 'Please connect intrnet', 'ok', () {
          pop(context);

    });
  }

  void incorrectEmailorPasswordCase(context) {
    customDialog(context, 'Notice!', 'Email or Password is incorrect', 'ok', () {
          pop(context);

    });
  }
}
