import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';

void customSnackBar(BuildContext context, String message,
    AnimatedSnackBarType status, int milliseconds) {
  AnimatedSnackBar.material(
    message,
    duration: Duration(
      milliseconds: milliseconds,
    ),
    type: status,
  ).show(context);
}
