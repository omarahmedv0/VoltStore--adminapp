import 'package:dialogs/dialogs/message_dialog.dart';
import 'package:flutter/material.dart';

import '../constants/colors_manager.dart';


customDialog(context, String title, String body, String textBottom,
    Function()? funBottom) {
  final messageDialog = MessageDialog(
    title: title,
    message: body,
    messageColor: Theme.of(context).textTheme.bodySmall!.color,
    buttonOkColor: ColorsManager.primary,
    buttonOkOnPressed: funBottom,
    buttonOkText: textBottom,
  );
  messageDialog.show(context);
}
