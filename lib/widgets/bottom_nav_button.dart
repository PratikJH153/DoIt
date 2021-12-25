import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget bottomNavButton({
  required BuildContext context,
  required IconData icon,
  required VoidCallback onTap,
  bool isTap = false,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 25,
          color: isTap ? Colors.grey[200] : Colors.grey[700],
        ),
        isTap
            ? Container(
                height: 2,
                width: 15,
                margin: const EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
              )
            : Container(),
      ],
    ),
  );
}
