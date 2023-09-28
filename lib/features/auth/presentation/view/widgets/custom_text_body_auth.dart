// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextBodyAuth extends StatelessWidget {
   CustomTextBodyAuth({
    super.key,
    required this.body,
    required this.title
  });
  String title;
    String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Text(
            maxLines: 3,
            textAlign: TextAlign.center,
            body,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ),
      ],
    );
  }
}
