import 'package:flutter/material.dart';

toNamed(context, String routeName, {Object? arguments}) {
  Navigator.of(context).pushNamed(
    routeName,
    arguments: arguments,
  );
}
