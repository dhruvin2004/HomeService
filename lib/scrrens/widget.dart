import 'package:flutter/material.dart';

Widget details({required String text1, required String text2}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: Row(
      children: [
        Text(
          text1,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        Text(
          text2,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ],
    ),
  );
}
