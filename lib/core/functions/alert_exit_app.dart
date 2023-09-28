import 'dart:io';

import 'package:adminapp/core/functions/navigation/pop.dart';
import 'package:dialogs/dialogs/choice_dialog.dart';

import '../constants/colors_manager.dart';

Future<bool> alertExitApp(context) {
  ChoiceDialog(
    title: 'Alert!',
    message: 'Exit app?',
    buttonCancelText: 'Cancel',
    buttonCancelOnPressed: () {
         pop(context);

    },
    buttonCancelBorderColor: ColorsManager.primary,
    buttonOkText: 'Confirm',
    buttonOkColor: ColorsManager.primary,
    buttonOkOnPressed: () {
      exit(0);
    },
  ).show(context);

  return Future.value(false);
}
