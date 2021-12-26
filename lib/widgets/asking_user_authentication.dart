import 'package:challengeapp/views/authentication/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget askingUserAuthenticate({
  required BuildContext context,
  required String label,
  required String page,
  required Widget route,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Text(
        label,
        style: TextStyle(
          fontFamily: 'Quicksand',
          color: Colors.grey[500],
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
      const SizedBox(
        width: 5,
      ),
      GestureDetector(
        onTap: () =>
            Navigator.push(context, MaterialPageRoute(builder: (ctx) => route)),
        child: Text(
          page,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 17,
          ),
        ),
      ),
    ],
  );
}
