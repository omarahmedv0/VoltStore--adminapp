
import 'package:flutter/material.dart';

toNamedandRemoveUntil(BuildContext context, String routeName) {
  Navigator.of(context).pushNamedAndRemoveUntil(
    routeName,
    (route) => false,
  );
}