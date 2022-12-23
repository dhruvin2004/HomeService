import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget details(
    {required String text1, required String text2, required Function() ontap}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    child: Row(
      children: [
        Text(
          text1,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: ontap,
          child: Text(
            text2,
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget listTile(
    {required IconData icons,
    required String title,
    required Function() ontap}) {
  return ListTile(
      leading: Icon(
        icons,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600),
      ),
      trailing: const Icon(
        CupertinoIcons.right_chevron,
        color: Colors.black,
      ),
      selected: true,
      onTap: ontap);
}
